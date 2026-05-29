exports.handler = async (event) => {
  if (event.httpMethod !== 'POST') {
    return { statusCode: 405, body: 'Method Not Allowed' };
  }

  const { items, comprador } = JSON.parse(event.body);
  const accessToken = process.env.MP_ACCESS_TOKEN;

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
        body: JSON.stringify({ error: 'Error al crear preferencia', detalle: data }),
      };
    }

    return {
      statusCode: 200,
      headers: { 'Access-Control-Allow-Origin': '*' },
      body: JSON.stringify({
        init_point: data.init_point,         // producción
        sandbox_init_point: data.sandbox_init_point, // pruebas
        preference_id: data.id,
      }),
    };
  } catch (err) {
    console.error('Error:', err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: err.message }),
    };
  }
};
