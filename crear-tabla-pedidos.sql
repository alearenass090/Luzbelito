-- ================================================================
-- LUZBELITO — Crear tabla de pedidos
-- Ejecutar en Supabase → SQL Editor
-- ================================================================
CREATE TABLE IF NOT EXISTS pedidos (
  id          BIGSERIAL PRIMARY KEY,
  numero      TEXT UNIQUE NOT NULL,
  nombre      TEXT,
  email       TEXT,
  telefono    TEXT,
  direccion   TEXT,
  envio       TEXT,
  metodo_pago TEXT,
  items       JSONB DEFAULT '[]',
  total       INTEGER DEFAULT 0,
  estado      TEXT DEFAULT 'pendiente',
  payment_id  TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Verificar que se creó correctamente
SELECT column_name, data_type FROM information_schema.columns
WHERE table_name = 'pedidos' ORDER BY ordinal_position;
