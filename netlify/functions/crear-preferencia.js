const ALLOWED_ORIGINS = [
  'https://luzbelito.netlify.app',
  'https://www.luzbelito.netlify.app',
];

const MAX_ITEMS = 20;
const MAX_PRICE = 500000;
const MIN_PRICE = 100;
const MAX_QUANTITY = 10;
const MAX_STRING_LENGTH = 200;

function sanitize(str) {
  if (typeof str !== 'string') return '';
  return str.slice(0, MAX_STRING_LENGTH).replace(/[<>]/g, '');
}

function getCorsHeaders(event) {
  const origin = (event.headers || {}).origin || '';
  const allowed = ALLOWED_ORIGINS.includes(origin) ? origin : ALLOWED_ORIGINS[0];
  return {
    'Access-Control-Allow-Origin': allowed,
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
    'Vary': 'Origin',
  };
}

exports.handler = async (event) => {
  const corsHeaders = getCorsHeaders(event);

  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 200, headers: corsHeaders, body: '' };
  }

  if (event.httpMethod !== 'POST') {
    return { statusCode: 405, headers: corsHeaders, body: 'Method Not Allowed' };
  }

  const origin = (event.headers || {}).origin || '';
  if (!ALLOWED_ORIGINS.includes(origin)) {
    return { statusCode: 403, headers: corsHeaders, body: JSON.stringify({ error: 'Origen no permitido' }) };
  }

  let body;
  try {
    body = JSON.parse(event.body);
  } catch {
    return { statusCode: 400, headers: corsHeaders, body: JSON.stringify({ error: 'Body inválido' }) };
  }

  const { items, comprador, envio } = body;

  if (!items || !Array.isArray(items) || !items.length || items.length > MAX_ITEMS || !comprador) {
    return { statusCode: 400, headers: corsHeaders, body: JSON.stringify({ error: 'Datos incompletos' }) };
  }

  for (const item of items) {
    const precio = Number(item.precio_num);
    const cantidad = Number(item.cantidad);
    if (!precio || precio < MIN_PRICE || precio > MAX_PRICE || !Number.isFinite(precio)) {
      return { statusCode: 400, headers: corsHeaders, body: JSON.stringify({ error: 'Precio fuera de rango' }) };
    }
    if (!cantidad || cantidad < 1 || cantidad > MAX_QUANTITY || !Number.isInteger(cantidad)) {
      return { statusCode: 400, headers: corsHeaders, body: JSON.stringify({ error: 'Cantidad invalida' }) };
    }
  }

  const accessToken = process.env.MP_ACCESS_TOKEN;
  if (!accessToken) {
    return { statusCode: 500, headers: corsHeaders, body: JSON.stringify({ error: 'Error interno' }) };
  }

  const preferencia = {
    items: items.map(item => ({
      title: sanitize(`${item.nombre} — Talle ${item.talle}`),
      quantity: Math.min(Math.max(1, Math.floor(Number(item.cantidad))), MAX_QUANTITY),
      unit_price: Math.round(Number(item.precio_num) * 100) / 100,
      currency_id: 'ARS',
    })),
    payer: {
      name: sanitize(comprador.nombre),
      email: sanitize(comprador.email),
    },
    back_urls: {
      success: 'https://luzbelito.netlify.app/exito.html',
      failure: 'https://luzbelito.netlify.app/error.html',
      pending: 'https://luzbelito.netlify.app/pendiente.html',
    },
    auto_return: 'approved',
    statement_descriptor: 'LUZBELITO',
    external_reference: `LUZ-${Date.now()}`,
    shipments: envio ? { mode: 'not_specified' } : undefined,
  };

  try {
    const response = await fetch('https://api.mercadopago.com/checkout/preferences', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${accessToken}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(preferencia),
    });

    const data = await response.json();

    if (!response.ok) {
      console.error('Error MP:', data);
      return {
        statusCode: 500,
        headers: corsHeaders,
        body: JSON.stringify({ error: 'Error al crear preferencia' }),
      };
    }

    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({
        init_point: data.init_point,
        preference_id: data.id,
      }),
    };
  } catch (err) {
    console.error('Error:', err);
    return {
      statusCode: 500,
      headers: corsHeaders,
      body: JSON.stringify({ error: 'Error interno' }),
    };
  }
};
