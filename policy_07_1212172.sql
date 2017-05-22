--truong du an chi duoc phep doc ghi thong tin chi tieu cua du an minh quan li

CREATE OR REPLACE FUNCTION VPD_TruongDuAn_ChiTieu (p_schema VARCHAR2, p_obj VARCHAR2)
RETURN VARCHAR2
AS
  user VARCHAR2(100);
  ma_DA VARCHAR2(10);
  n_b NUMBER;
BEGIN
  user:= SYS_CONTEXT('userenv','SESSION_USER');
  SELECT COUNT(*) INTO n_b FROM SYS.PhongBan WHERE truongPhong = user;
  IF(n_b > 0) THEN
    RETURN '';
  ELSE
    BEGIN
     SELECT maDA INTO ma_DA FROM SYS.DuAn WHERE truongDA = user;
     RETURN 'duAn='|| q'[']' || ma_DA || q'[']';
    END;
  END IF;
  EXCEPTION
      WHEN OTHERS THEN RETURN '1 = 0';
END;

--them policy vao bang du lieu ChiTieu
EXECUTE dbms_rls.add_policy(object_schema=>'SYS',
                        object_name=>'SYS.ChiTieu',
                        policy_name=>'VPD_TruongDuAn_ChiTieu',
                        function_schema=>'SYS',
                        policy_function=>'VPD_TruongDuAn_ChiTieu',
                        statement_types=>'select,update,insert',
                        update_check=>TRUE);