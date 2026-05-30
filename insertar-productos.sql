-- ================================================================
-- LUZBELITO — Insertar 6 productos por banda
-- ================================================================
-- INSTRUCCIONES:
-- 1. Ir a https://supabase.com → tu proyecto → SQL Editor
-- 2. Pegar este script y ejecutarlo
-- 3. Los nombres y fotos se pueden editar después desde el dashboard
-- ================================================================

-- (Opcional) Ver cuántos productos tiene cada banda actualmente:
-- SELECT banda, COUNT(*) FROM productos WHERE activo = true GROUP BY banda ORDER BY banda;

-- (Opcional) Borrar todo para empezar de cero:
-- DELETE FROM producto_talles;
-- DELETE FROM productos;

-- ================================================================
-- INSERTAR PRODUCTOS (6 por banda)
-- ================================================================
INSERT INTO productos (banda, nombre, precio, descripcion, fotos, tag, activo) VALUES

-- PATRICIO REY Y LOS REDONDOS
('redondos', 'Remera Clásica',       '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('redondos', 'Remera Vintage',       '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('redondos', 'Remera Tour',          '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('redondos', 'Remera Artwork',       '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('redondos', 'Remera Minimalista',   '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('redondos', 'Edición Especial',     '$18.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', 'Edición Limitada', true),

-- SODA STEREO
('soda', 'Remera Clásica',           '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('soda', 'Remera Vintage',           '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('soda', 'Remera Tour',              '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('soda', 'Remera Artwork',           '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('soda', 'Remera Minimalista',       '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('soda', 'Edición Especial',         '$18.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', 'Edición Limitada', true),

-- BABASÓNICOS
('babasonicos', 'Remera Clásica',    '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('babasonicos', 'Remera Vintage',    '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('babasonicos', 'Remera Tour',       '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('babasonicos', 'Remera Artwork',    '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('babasonicos', 'Remera Minimalista','$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('babasonicos', 'Edición Especial',  '$18.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', 'Edición Limitada', true),

-- AIRBAG
('airbag', 'Remera Clásica',         '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('airbag', 'Remera Vintage',         '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('airbag', 'Remera Tour',            '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('airbag', 'Remera Artwork',         '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('airbag', 'Remera Minimalista',     '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('airbag', 'Edición Especial',       '$18.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', 'Edición Limitada', true),

-- CALLEJEROS
('callejeros', 'Remera Clásica',     '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('callejeros', 'Remera Vintage',     '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('callejeros', 'Remera Tour',        '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('callejeros', 'Remera Artwork',     '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('callejeros', 'Remera Minimalista', '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('callejeros', 'Edición Especial',   '$18.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', 'Edición Limitada', true),

-- LAS PASTILLAS DEL ABUELO
('pastillas', 'Remera Clásica',      '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('pastillas', 'Remera Vintage',      '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('pastillas', 'Remera Tour',         '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('pastillas', 'Remera Artwork',      '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('pastillas', 'Remera Minimalista',  '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('pastillas', 'Edición Especial',    '$18.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', 'Edición Limitada', true),

-- CHARLY GARCÍA
('charly', 'Remera Clásica',         '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('charly', 'Remera Vintage',         '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('charly', 'Remera Tour',            '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('charly', 'Remera Artwork',         '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('charly', 'Remera Minimalista',     '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('charly', 'Edición Especial',       '$18.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', 'Edición Limitada', true),

-- LOS PIOJOS
('piojos', 'Remera Clásica',         '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('piojos', 'Remera Vintage',         '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('piojos', 'Remera Tour',            '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('piojos', 'Remera Artwork',         '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('piojos', 'Remera Minimalista',     '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('piojos', 'Edición Especial',       '$18.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', 'Edición Limitada', true),

-- LA RENGA
('renga', 'Remera Clásica',          '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('renga', 'Remera Vintage',          '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('renga', 'Remera Tour',             '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('renga', 'Remera Artwork',          '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('renga', 'Remera Minimalista',      '$15.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', null,              true),
('renga', 'Edición Especial',        '$18.000', 'Remera 100% algodón peinado. Disponible en talles S a XL.', '[]', 'Edición Limitada', true);

-- ================================================================
-- INSERTAR TALLES (S, M, L, XL — stock 10 cada uno)
-- Solo para productos que todavía no tienen talles asignados
-- ================================================================
INSERT INTO producto_talles (producto_id, talle, stock)
SELECT p.id, t.talle, 10
FROM productos p
CROSS JOIN (VALUES ('S'), ('M'), ('L'), ('XL')) AS t(talle)
WHERE NOT EXISTS (
  SELECT 1 FROM producto_talles pt WHERE pt.producto_id = p.id
);

-- ================================================================
-- VERIFICAR RESULTADO
-- ================================================================
SELECT banda, COUNT(*) as productos FROM productos WHERE activo = true GROUP BY banda ORDER BY banda;
