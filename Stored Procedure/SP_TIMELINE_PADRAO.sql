DROP PROCEDURE IF EXISTS TIMELINE_PADRAO;

DELIMITER //

CREATE PROCEDURE TIMELINE_PADRAO (
  IN ID_USUARIO_LOGADO INT
)
BEGIN
  -- VALIDA PARAMETRO INFORMADO
  IF COALESCE(ID_USUARIO_LOGADO, FALSE) THEN
    SELECT 
      ID_ANUNCIO,
      DS_TITULO,
      DS_DESCRICAO,
      NR_VALOR,
      DT_ANUNCIO,
      FOTO.DS_CAMINHO AS DS_CAMINHO,
      TB_USUARIO.NR_SEQ AS ID_USER,
      TB_USUARIO.NM_NOME AS NM_USER,
      TB_USUARIO.DS_FOTO AS FOTO_USER
    FROM
      TB_ANUNCIO
    LEFT JOIN
      TB_FOTOS AS FOTO ON FOTO.TB_ANUNCIO_ID_ANUNCIO = TB_ANUNCIO.ID_ANUNCIO
    INNER JOIN
      TB_USUARIO ON TB_USUARIO.NR_SEQ = TB_ANUNCIO.TB_USUARIO_NR_SEQ
    INNER JOIN
      TB_AMIZADE ON ID_SOLICITANTE = ID_USUARIO_LOGADO OR ID_SOLICITADO = ID_USUARIO_LOGADO AND TB_STATUS_AMIZADE_NR_STATUS_AMIGO = 2
    WHERE
      TB_STATUS_ID_STATUS = 2
    AND
      TB_ANUNCIO.TB_USUARIO_NR_SEQ != ID_USUARIO_LOGADO
    GROUP BY
      ID_ANUNCIO
    ORDER BY
      TB_ANUNCIO.DT_ANUNCIO DESC;
  END IF;

END//

DELIMITER ;