--Chi truong phong, truong chi nhanh duoc cap quyen thuc thi stored procedure cap nhat thong tin phong ban cua minh
CREATE OR REPLACE PROCEDURE CapNhat_PhongBan (ma_Phong VARCHAR2, ten_Phong NVARCHAR2, truong_Phong VARCHAR2, ngay_NhanChuc DATE,so_NhanVien INT,
chi_Nhanh VARCHAR2)
AS
  n_b NUMBER;
BEGIN
  v_hopLe := FALSE;
  IF (ma_Phong IS NOT NULL) THEN
        BEGIN
         IF( EXISTS ( SELECT maPhong FROM SYS.PhongBan WHERE maPhong = ma_Phong))THEN 
          n_b := 1;
         ELSE n_b := 0;
        END;
  END IF;
  IF (n_b = 1) THEN
      BEGIN
        UPDATE SYS.PhongBan
        SET tenPhong = ten_Phong,
            truongPhong = truong_Phong,
            ngayNhanChuc = ngay_NhanChuc,
            soNhanVien = so_NhanVien,
            chiNhanh = chi_Nhanh
        WHERE maPhong = ma_Phong;
      END;
  END IF;
END;
GRANT EXECUTE ON CapNhat_PhongBan TO rTruongPhong;
GRANT EXECUTE ON CapNhat_PhongBan TO rTruongChiNhanh;