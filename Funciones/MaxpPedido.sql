create or replace FUNCTION MaxpPedido
  RETURN NUMERIC
IS
  l_max NUMERIC;

BEGIN

SELECT MAX(ID_PEDIDO) AS PP INTO l_max FROM PEDIDO;

  RETURN l_max;
END;