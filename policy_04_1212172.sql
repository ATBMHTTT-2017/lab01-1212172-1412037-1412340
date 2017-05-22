--Giam Doc duoc phep xem thong tin du an
CREATE OR REPLACE VIEW View_GiamDoc_DuAn AS SELECT da.maDA, da.tenDA, da.kinhPhi, pb.tenPhong AS phongChuTri, cn.tenCN as ChiNhanh, nv.hoTen as truongDuAn                            
                                            FROM DuAn da, ChiNhanh cn, NhanVien nv, PhongBan pb
                                            WHERE da.phongChuTri = pb.maPhong and pb.chiNhanh = cn.maCN and da.truongDA = nv.maNV
                                            GROUP BY da.maDA, da.tenDA, da.kinhPhi, pb.tenPhong, cn.tenCN, nv.hoTen; 
                                            
GRANT SELECT ON View_GiamDoc_DuAn to rGiamDoc;