
--T?o b?ng
CREATE TABLE NhanVien (
  maNV VARCHAR2(10) NOT NULL PRIMARY KEY,
  hoTen NVARCHAR2(50) NOT NULL,
  diaChi NVARCHAR2(50) NOT NULL,
  dienThoai VARCHAR2(10),
  email VARCHAR2(50),
  maPhong VARCHAR2(10),
  chiNhanh VARCHAR2(10),
  luong FLOAT
)

CREATE TABLE PhongBan (
  maPhong VARCHAR2(10) NOT NULL PRIMARY KEY,
  tenPhong NVARCHAR2(50) NOT NULL,
  truongPhong VARCHAR2(10),
  ngayNhanChuc DATE,
  soNhanVien INT,
  chiNhanh VARCHAR2(10)
)

CREATE TABLE ChiNhanh (
  maCN VARCHAR2(10) NOT NULL PRIMARY KEY,
  tenCN NVARCHAR2(50) NOT NULL,
  truongChiNhanh VARCHAR2(10)
)

CREATE TABLE DuAn (
  maDA VARCHAR2(10) NOT NULL PRIMARY KEY,
  tenDA NVARCHAR2(50) NOT NULL,
  kinhPhi FLOAT,
  phongChuTri VARCHAR2(10),
  truongDA VARCHAR2(10)
)

CREATE TABLE PhanCong (
  maNV VARCHAR2(10) NOT NULL,
  duAn VARCHAR2(10) NOT NULL,
  vaiTro NVARCHAR2(50),
  phuCap FLOAT,
  CONSTRAINT PhanCong_PK PRIMARY KEY(maNV,duAn) ENABLE
)

CREATE TABLE ChiTieu (
  maChiTieu VARCHAR2(10) NOT NULL PRIMARY KEY,
  tenChiTieu NVARCHAR2(50) NOT NULL,
  soTien FLOAT,
  duAn VARCHAR2(10)
)

--Thi?t ð?t các khóa liên k?t gi?a các b?ng
ALTER TABLE NhanVien  ADD CONSTRAINT FK1_NhanVien_PhongBan FOREIGN KEY(maPhong) REFERENCES PhongBan (maPhong)
ALTER TABLE NhanVien  ADD CONSTRAINT FK2_NhanVien_ChiNhanh FOREIGN KEY(chiNhanh) REFERENCES ChiNhanh (maCN)
ALTER TABLE PhongBan  ADD CONSTRAINT FK1_PhongBan_ChiNhanh FOREIGN KEY(chiNhanh) REFERENCES ChiNhanh (maCN)
ALTER TABLE PhongBan  ADD CONSTRAINT FK2_PhongBan_NhanVien FOREIGN KEY(truongPhong) REFERENCES NhanVien (maNV)
ALTER TABLE ChiNhanh  ADD CONSTRAINT FK1_ChiNhanh_NhanVien FOREIGN KEY(truongChiNhanh) REFERENCES NhanVien (maNV)
ALTER TABLE DuAn  ADD CONSTRAINT FK1_DuAn_PhongBan FOREIGN KEY(phongChuTri) REFERENCES PhongBan (maPhong)
ALTER TABLE DuAn  ADD CONSTRAINT FK1_DuAn_NhanVien FOREIGN KEY(truongDA) REFERENCES NhanVien (maNV)
ALTER TABLE PhanCong  ADD CONSTRAINT FK1_PhanCong_NhanVien FOREIGN KEY(maNV) REFERENCES NhanVien (maNV)
ALTER TABLE PhanCong  ADD CONSTRAINT FK2_PhanCong_DuAn FOREIGN KEY(duAn) REFERENCES DuAn (maDA)
ALTER TABLE ChiTieu  ADD CONSTRAINT FK1_ChiTieu_DuAn FOREIGN KEY(duAn) REFERENCES DuAn (maDA)


--Tao role cho cac chuc vu va cac Procedure tu dong cap cac role cho cac nhanh vien phu hop
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