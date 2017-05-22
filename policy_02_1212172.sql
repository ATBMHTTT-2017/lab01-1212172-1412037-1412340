--Tao role cho cac chuc vu va cac Procedure tu dong cap cac role cho cac nhanh vien phu hop
CREATE ROLE rGiamDoc ;--Role GiamDoc
CREATE ROLE rNhanVien ;--Role Nhan Vien
CREATE OR REPLACE PROCEDURE GrantRoleNhanVien 
AS
  CURSOR TBL_NhanVien  IS SELECT maNV FROM SYS.NhanVien ;
BEGIN
    FOR ROW_maNV IN TBL_NhanVien 
    LOOP
        EXECUTE IMMEDIATE 'GRANT rNhanVien  TO ' || ROW_maNV.maNV;
    END LOOP;
END;
EXECUTE GrantRoleNhanVien ;


CREATE ROLE rTruongPhong ;--Role Truong Phong
CREATE OR REPLACE PROCEDURE GrantRoleTruongPhong 
AS
  CURSOR TBL_TruongPhong  IS SELECT maNV FROM SYS.NhanVien  JOIN SYS.PhongBan  ON maNV = truongPhong;
BEGIN
    FOR ROW_maNV IN TBL_TruongPhong 
    LOOP
        EXECUTE IMMEDIATE 'GRANT rTruongPhong  TO ' || ROW_maNV.maNV;
    END LOOP;
END;
EXECUTE GrantRoleTruongPhong ;


CREATE ROLE rTruongDuAn ;--Role Truong Du An
CREATE OR REPLACE PROCEDURE GrantRoleTruongDuAn 
AS
  CURSOR TBL_TruongDuAn  IS SELECT maNV FROM SYS.NhanVien  JOIN SYS.DuAn  ON maNV = truongDA;
BEGIN
    FOR ROW_maNV IN TBL_TruongDuAn 
    LOOP
        EXECUTE IMMEDIATE 'GRANT rTruongDuAn  TO ' || ROW_maNV.maNV;
    END LOOP;
END;
EXECUTE GrantRoleTruongDuAn ;


CREATE ROLE rTruongChiNhanh ;--Role Truong Chi Nhanh
CREATE OR REPLACE PROCEDURE GrantRoleTruongChiNhanh 
AS
  CURSOR TBL_TruongChiNhanh  IS SELECT maNV FROM SYS.NhanVien  JOIN SYS.ChiNhanh  ON maNV = truongChiNhanh;
BEGIN
    FOR ROW_maNV IN TBL_TruongChiNhanh 
    LOOP
        EXECUTE IMMEDIATE 'GRANT rTruongChiNhanh  TO ' || ROW_maNV.maNV;
    END LOOP;
END;
EXECUTE GrantRoleTruongChiNhanh ;