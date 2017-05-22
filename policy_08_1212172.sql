--Truong phong chi duoc doc thong tin chi tieu cua du an trong phong ban minh quan li. 
--Voi nhung du an khong thuoc phong ban cua minh, cac truoc phong d??c phep xem thong tin chi tieu nhung khong duoc xem cu the so tien.

CREATE OR REPLACE FUNCTION VPD_TruongPhong_ChiTieu (p_schema IN VARCHAR2 DEFAULT NULL, p_object IN VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2 
AS
  user VARCHAR2(100);
  ma_DA VARCHAR2(10);
  n_b NUMBER;
BEGIN
  user:= SYS_CONTEXT('userenv','SESSION_USER');
  SELECT COUNT(*) INTO n_b FROM SYS.PhongBan WHERE truongPhong = user;
  IF (n_b > 0) THEN
  RETURN '';
  ELSE
    BEGIN
      SELECT maDA INTO ma_DA FROM SYS.DuAn WHERE phongChuTri IN (SELECT maPhong 
                                                                  FROM SYS.PhongBan 
                                                                  WHERE truongPhong = user);
      RETURN 'duAn='|| q'[']' || ma_DA || q'[']';
    END;
  END IF;
EXCEPTION
      WHEN OTHERS THEN RETURN '1 = 0';
END;
-- them policy vao bang ChiTieu

EXECUTE dbms_rls.add_policy (object_schema => 'SYS',
                          object_name => 'SYS.ChiTieu',
                          policy_name => 'VPD_TruongPhong_ChiTieu',
                          function_schema => 'SYS',
                          policy_function => 'VPD_TruongPhong_ChiTieu',
                          sec_relevant_cols=>'soTien',
                          sec_relevant_cols_opt=>dbms_rls.ALL_ROWS);
