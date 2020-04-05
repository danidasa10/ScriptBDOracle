CREATE OR REPLACE PROCEDURE SP_SL_VALIDAR_USUARIO(USER IN  USUARIOS.NOMBRE_USUARIO%TYPE)
AS 
login_cursor SYS_REFCURSOR;
 OPTION_NOT_FOUND EXCEPTION;
begin 
  savepoint prev;

OPEN login_cursor FOR
SELECT NOMBRE_USUARIO AS USUA FROM USUARIOS WHERE NOMBRE_USUARIO=USER;
 APEX_JSON.write(login_cursor);
    COMMIT;
EXCEPTION 
    WHEN OPTION_NOT_FOUND THEN
         HTP.print(SQLERRM);
    WHEN OTHERS THEN
         HTP.print(SQLERRM);
end SP_SL_VALIDAR_USUARIO;
