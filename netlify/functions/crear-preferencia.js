exports.handler = async (event) => {
  const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
  };

  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 200, headers: corsHeaders, body: '' };
  }

  if (event.httpMethod !== 'POST') {
    return { statusCode: 405, headers: corsHeaders, body: 'Method Not Allowed' };
  }

  let body;
  try {
    body = JSON.parse(event.body);
  } catch {
    return { statusCode: 400, headers: corsHeaders, body: JSON.stringify({ error: 'Body inválido' }) };
  }

  const { items, comprador, envio } = body;

  if (!items || !items.length || !comprador) {
    return { statusCode: 400, headers: corsHeaders, body: JSON.stringify({ error: 'Datos incompletos' }) };
  }

  const accessToken = process.env.MP_ACCESS_TOKEN;
  if (!accessToken) {
    return { statusCode: 500, headers: corsHeaders, body: JSON.stringify({ error: 'Token de Mercado Pago no configurado' }) };
  }

  const preferencia = {
    items: items.map(item => ({
      title: `${item.nombre} — Talle ${item.talle}`,
      quantity: item.cantidad,
      unit_price: item.precio_num,
      currency_id: 'ARS',
    })),
    payer: {
      name: comprador.nombre,
      email: comprador.email,
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
        body: JSON.stringify({ error: 'Error al crear preferencia', detalle: data }),
      };
    }

    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({
        init_point: data.init_point,
        sandbox_init_point: data.sandbox_init_point,
        preference_id: data.id,
      }),
    };
  } catch (err) {
    console.error('Error:', err);
    return {
      statusCode: 500,
      headers: corsHeaders,
      body: JSON.stringify({ error: err.message }),
    };
  }
};
