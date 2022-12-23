use furama;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong 
-- hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien as nv where substring_index(nv.ho_ten,' ',-1) like "H%" or substring_index(nv.ho_ten,' ',-1) like "T%" or substring_index(nv.ho_ten,' ',-1) like "K%";

-- 3.	Hiển thị thông tin của tất cả khách hàng có 
-- độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang where (year(curdate()) - year(ngay_sinh) between 18 and 50) and (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị");

/* 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.*/
select kh.*,lk.ten_loai_khach, count(hd.ma_khach_hang) as sl from khach_hang as kh
join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach_hang
where lk.ten_loai_khach = "Diamond"
group by hd.ma_khach_hang
order by sl;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).




-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các 
-- loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu , dv.ten_dich_vu , dv.dien_tich , dv.chi_phi_thue , dv.ma_loai_dich_vu from dich_vu as dv
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu
where hd.ma_dich_vu not in (select ma_dich_vu from hop_dong where quarter(ngay_bat_dau) = 1 and year(ngay_bat_dau)=2021)
group by hd.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
--  ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng
--  trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select dv.ma_dich_vu , dv.ten_dich_vu , dv.dien_tich , dv.so_nguoi_toi_da , dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from dich_vu as dv
join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(ngay_bat_dau) = 2020 and hd.ma_dich_vu not in (select ma_dich_vu from hop_dong where year(ngay_bat_dau)=2021)
group by hd.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- c1 :
select distinct kh.ho_ten from khach_hang as kh;
 -- c2:
 select * from khach_hang group by ho_ten;
 -- c3:
 select kh.ho_ten from khach_hang as kh 
 union select kh.ho_ten from khach_hang as kh ;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hd.ngay_bat_dau) as thang,count(ma_khach_hang) as so_luong
from hop_dong as hd
where year(hd.ngay_bat_dau) = 2021
group by hd.ma_khach_hang
order by thang;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong , hd.ngay_bat_dau , hd.ngay_ket_thuc , hd.tien_dat_coc , sum(hdct.so_luong)
from hop_dong as hd 
left join hop_dong_chi_tiet as hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong ;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select hdct.ma_dich_vu_di_kem , dvdk.ten_dich_vu_di_kem 
from dich_vu_di_kem as dvdk
join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong as hd on hd.ma_hop_dong =  hdct.ma_hop_dong
join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
where kh.ma_loai_khach_hang = "1" and dia_chi like "%Vinh" or dia_chi like "%Quảng Ngãi";

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng)
-- , ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong , nv.ho_ten , kh.ho_ten , kh.so_dien_thoai , dv.ten_dich_vu , sum(hdct.so_luong) ,hd.tien_dat_coc
from hop_dong as hd
left join nhan_vien as nv on nv.ma_nhan_vien = hd.ma_nhan_vien 
left join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
where (quarter(hd.ngay_bat_dau) = 4 and year(hd.ngay_bat_dau) = 2020) and not (month(ngay_bat_dau) in (1,2,3,4,5,6) and year(ngay_bat_dau) = 2021)
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng 
-- nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvdk.ma_dich_vu_di_kem ,dvdk.ten_dich_vu_di_kem , sum(hdct.so_luong) as so_luong
from dich_vu_di_kem as dvdk 
join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong = (select max(so_luong) from hop_dong_chi_tiet);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong , dv.ten_dich_vu , dvdk.ten_dich_vu_di_kem , count(dvdk.ma_dich_vu_di_kem) as so_luong
from hop_dong as hd
join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong_chi_tiet as hdct on hd.ma_hop_dong =  hdct.ma_hop_dong
join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong = "1"
order by ma_hop_dong;

-- hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, 
-- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien , nv.ho_ten , td.ma_trinh_do ,bp.ten_bo_phan , nv.so_dien_thoai , nv.dia_chi , count(nv.ma_nhan_vien) as so_luong
from nhan_vien as nv
join trinh_do as td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan as bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong as hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where year(hd.ngay_bat_dau) in (2020,2021)
group by nv.ma_nhan_vien
having so_luong <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET SQL_SAFE_UPDATES = 0;
delete from nhan_vien where nhan_vien.ma_nhan_vien not in (select ma_nhan_vien from hop_dong as hd
where year(hd.ngay_bat_dau) in (2019,2020,2021) group by ma_nhan_vien);
select * from nhan_vien;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ. 

select kh.*, sum(dv.chi_phi_thue + hdct.so_luong * dvdk.gia) as tong_tien from khach_hang as kh 
join loai_khach as lkh on lkh.ma_loai_khach = kh.ma_loai_khach_hang
join hop_dong as hd on  hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where lkh.ten_loai_khach = 'Platinum'
group by hd.ma_khach_hang 
having tong_tien > 10000000;