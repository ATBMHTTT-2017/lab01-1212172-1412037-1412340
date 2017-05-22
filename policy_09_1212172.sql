--Tao chinh sach
BEGIN
sa_sysdba.create_policy 
(policy_name => 'ACCESS_DuAn',
column_name => 'OLS_DuAn');
END;
--cap role access_duan_dba cho user DBA_Admin
GRANT access_duan_dba TO DBA_Admin; 
 
--Cap quyen tao cac thanh phan cua label
GRANT EXECUTE ON sa_components TO DBA_Admin; 
 
--Cap quyen tao cac label
GRANT EXECUTE ON sa_label_admin TO DBA_Admin; 
 
--Cap quyen gan nhan cho user
GRANT EXECUTE ON sa_user_admin TO DBA_Admin;

--Cap quyen chuyen chuoi ky tu cua label sang dang so tuong ung
GRANT EXECUTE ON char_to_label TO DBA_Admin;

--Tao level
BEGIN--lv ThongThuong
sa_components.create_level
(policy_name => 'ACCESS_DuAn',
long_name => 'ThongThuong',
short_name => 'TT',
level_num => 1000);
END;

BEGIN--lv GioiHan
sa_components.create_level
(policy_name => 'ACCESS_DuAn',
long_name => 'GioiHan',
short_name => 'GH',
level_num => 2000);
END;

BEGIN--lv BiMat
sa_components.create_level
(policy_name => 'ACCESS_DuAn',
long_name => 'BiMat',
short_name => 'BM',
level_num => 3000);
END;

BEGIN--lv BiMatCao
sa_components.create_level
(policy_name => 'ACCESS_DuAn',
long_name => 'BiMatCao',
short_name => 'TT',
level_num => 4000);
END;

--Tao comparment
BEGIN--Phong Nhan Su
sa_components.create_compartment
(policy_name => 'ACCESS_DuAn',
long_name => 'NhanSu',
short_name => 'NS',
level_num => 5000);
END;

BEGIN--Phong Ke Toan
sa_components.create_compartment
(policy_name => 'ACCESS_DuAn',
long_name => 'KeToan',
short_name => 'KT',
level_num => 6000);
END;

BEGIN--Phong Ke Hoach
sa_components.create_compartment
(policy_name => 'ACCESS_DuAn',
long_name => 'KeHoach',
short_name => 'KH',
level_num => 7000);
END;

--Tao Group
BEGIN--Gr Tong Cong Ty
sa_components.create_group
(policy_name => 'ACCESS_DuAn',
long_name => 'TongCongTy',
short_name => 'TCT',
group_num => 1000,
parent_name => NULL);
END;

BEGIN--Gr HoChiMinh
sa_components.create_group
(policy_name => 'ACCESS_DuAn',
long_name => 'HoChiMinh',
short_name => 'HCM',
group_num => 2000,
parent_name => 'TCT');
END;

BEGIN--Gr HoChiMinh
sa_components.create_group
(policy_name => 'ACCESS_DuAn',
long_name => 'HoChiMinh',
short_name => 'HCM',
group_num => 2000,
parent_name => 'TCT');
END;

BEGIN--Gr HaNoi
sa_components.create_group
(policy_name => 'ACCESS_DuAn',
long_name => 'HaNoi',
short_name => 'HN',
group_num => 4000,
parent_name => 'TCT');
END;

BEGIN--Gr DaNang
sa_components.create_group
(policy_name => 'ACCESS_DuAn',
long_name => 'DaNang',
short_name => 'DN',
group_num => 3000,
parent_name => 'TCT');
END;

--Tao Label
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 500,
          label_value => 'TT');
          
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 1000,
          label_value => 'TT:NS:HCM');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 2000,
          label_value => 'TT:KT:HCM');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 3000,
          label_value => 'TT:KH:HCM');
          
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 4000,
          label_value => 'TT:NS:DN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 5000,
          label_value => 'TT:KT:DN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 6000,
          label_value => 'TT:KH:DN');
          
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 7000,
          label_value => 'TT:NS:HN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 8000,
          label_value => 'TT:KT:HN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 9000,
          label_value => 'TT:KH:HN');
          
-----10000

EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 10000,
          label_value => 'GH:NS:HCM');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 11000,
          label_value => 'GH:KT:HCM');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 12000,
          label_value => 'GH:KH:HCM');
          
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 13000,
          label_value => 'GH:NS:DN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 14000,
          label_value => 'GH:KT:DN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 15000,
          label_value => 'GH:KH:DN');
          
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 16000,
          label_value => 'GH:NS:HN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 17000,
          label_value => 'GH:KT:HN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 18000,
          label_value => 'GH:KH:HN');
--19000

EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 19000,
          label_value => 'BM:NS:HCM');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 20000,
          label_value => 'BM:KT:HCM');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 21000,
          label_value => 'BM:KH:HCM');
          
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 22000,
          label_value => 'BM:NS:DN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 23000,
          label_value => 'BM:KT:DN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 24000,
          label_value => 'BM:KH:DN');
          
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 25000,
          label_value => 'BM:NS:HN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 26000,
          label_value => 'BM:KT:HN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 27000,
          label_value => 'BM:KH:HN');
--28000
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 28000,
          label_value => 'BMC:NS:HCM');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 29000,
          label_value => 'BMC:KT:HCM');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 30000,
          label_value => 'BMC:KH:HCM');
          
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 31000,
          label_value => 'BMC:NS:DN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 32000,
          label_value => 'BMC:KT:DN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 33000,
          label_value => 'BMC:KH:DN');
          
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 34000,
          label_value => 'BMC:NS:HN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 35000,
          label_value => 'BMC:KT:HN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 36000,
          label_value => 'BMC:KH:HN');
    
 --label co do bao mat cao nhat   
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 40000,
          label_value => 'BMC:NS,KT,KH:HCM');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 50000,
          label_value => 'BMC:NS,KT,KH:DN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 60000,
          label_value => 'BMC:NS,KT,KH:HN');
EXECUTE sa_label_admin.create_label
          (policy_name => 'ACCESS_DuAn',
          label_tag => 70000,
          label_value => 'BMC:NS,KT,KH:TCT');
--Ap dung chinh sach cho bang ChiTieu
BEGIN
sa_policy_admin.apply_table_policy
(policy_name => 'ACCESS_DuAn',
schema_name => 'SYS',
table_name => 'SYS.ChiTieu',
table_options => 'NO_CONTROL');--thiet lap NO_CONTROL de tam thoi chua cho OLS hoat dong 
END;

--Tao nhan cho tung dong du lieu trong bang ChiTieu
UPDATE SYS.ChiTieu SET OLS_DuAn = char_to_label ('ACCESS_DuAn','TT:NS:HCM')
WHERE maChiTieu = 'CT001';
UPDATE SYS.ChiTieu SET OLS_DuAn = char_to_label ('ACCESS_DuAn','GH:KT:HCM')
WHERE maChiTieu = 'CT002';
UPDATE SYS.ChiTieu SET OLS_DuAn = char_to_label ('ACCESS_DuAn','BMC:KH:HCM')
WHERE maChiTieu = 'CT003';
UPDATE SYS.ChiTieu SET OLS_DuAn = char_to_label ('ACCESS_DuAn','GH:NS:HN')
WHERE maChiTieu = 'CT004';
UPDATE SYS.ChiTieu SET OLS_DuAn = char_to_label ('ACCESS_DuAn','BM:KT:HN')
WHERE maChiTieu = 'CT005';
UPDATE SYS.ChiTieu SET OLS_DuAn = char_to_label ('ACCESS_DuAn','BMC:KH:HN')
WHERE maChiTieu = 'CT006';
UPDATE SYS.ChiTieu SET OLS_DuAn = char_to_label ('ACCESS_DuAn','BM:NS:HCM')
WHERE maChiTieu = 'CT007';
UPDATE SYS.ChiTieu SET OLS_DuAn = char_to_label ('ACCESS_DuAn','GH:NS:DN')
WHERE maChiTieu = 'CT008';
UPDATE SYS.ChiTieu SET OLS_DuAn = char_to_label ('ACCESS_DuAn','BMC:KH:DN')
WHERE maChiTieu = 'CT009';
UPDATE SYS.ChiTieu SET OLS_DuAn = char_to_label ('ACCESS_DuAn','GH:KH:DN')
WHERE maChiTieu = 'CT010';


--policy_09--TRuong chi nhanh duoc phep truy xuat tat ca du lieu chi tiet cua du an 
-------------cua tat ca cac phong ban thuoc quyen quan ly cua minh
-----Gan nhan nguoi dung
--Gan nhan cho user la TruongChiNhanh khu vuc TPHCM
BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_DuAn',
user_name => 'nv006',
max_read_label => 'BMC:NS,KT,KH:HCM',
max_write_label => 'BMC:NS,KT,KH:HCM',
min_write_label => 'TT',
def_label => 'BMC:NS,KT,KH:HCM',
row_label => 'BMC:NS,KT,KH:HCM');
END;

--Gan nhan cho user la TruongChiNhanh khu vuc HaNoi
BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_DuAn',
user_name => 'nv007',
max_read_label => 'BMC:NS,KT,KH:HN',
max_write_label => 'BMC:NS,KT,KH:HN',
min_write_label => 'TT',
def_label => 'BMC:NS,KT,KH:HN',
row_label => 'BMC:NS,KT,KH:HN');
END;

--Gan nhan cho user la TruongChiNhanh khu vuc DaNang
BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_DuAn',
user_name => 'nv008',
max_read_label => 'BMC:NS,KT,KH:DN',
max_write_label => 'BMC:NS,KT,KH:DN',
min_write_label => 'TT',
def_label => 'BMC:NS,KT,KH:DN',
row_label => 'BMC:NS,KT,KH:DN');
END;
BEGIN
sa_policy_admin.remove_table_policy
(policy_name => 'ACCESS_DUAN',
schema_name => 'sys_bt1',
table_name => 'CHITIEU');
END;
BEGIN
sa_policy_admin.apply_table_policy
(policy_name => 'ACCESS_DUAN',
schema_name => 'sys_bt1',
table_name => 'CHITIEU',
table_options =>
'READ_CONTROL,WRITE_CONTROL');
END;
--Thuc thi chinh sach
--Xoa Chinh sach 
BEGIN
sa_policy_admin.remove_table_policy
(policy_name => 'ACCESS_DuAn',
schema_name => 'SYS',
table_name => 'SYS.ChiTieu');
END;
--Gan lai chinh sach cho bang ChiTieu
BEGIN
sa_policy_admin.apply_table_policy
(policy_name => 'ACCESS_DuAn',
schema_name => 'SYS',
table_name => 'SYS.ChiTieu',
table_options =>'READ_CONTROL,WRITE_CONTROL');
END;

--policy_09--Truong chi nhanh HaNoi duoc phep truy xuat du lieu cua chi nhanh HaNoi
-------------va tat ca cac chi nhanh khac
--Thay doi label cho truong chi nhanh HaNoi len muc do cao nhat.
BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_DuAn',
user_name => 'nv007',
max_read_label => 'BMC:NS,KT,KH:TCT',
max_write_label => 'BMC:NS,KT,KH:TCT',
min_write_label => 'TT',
def_label => 'BMC:NS,KT,KH:TCT',
row_label => 'BMC:NS,KT,KH:TCT');
END;
--Xoa Chinh sach 
BEGIN
sa_policy_admin.remove_table_policy
(policy_name => 'ACCESS_DuAn',
schema_name => 'SYS',
table_name => 'SYS.ChiTieu');
END;
--Gan lai chinh sach cho bang ChiTieu
BEGIN
sa_policy_admin.apply_table_policy
(policy_name => 'ACCESS_DuAn',
schema_name => 'SYS',
table_name => 'SYS.ChiTieu',
table_options =>'READ_CONTROL,WRITE_CONTROL');
END;
