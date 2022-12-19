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
join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu
where quarter(hd.ngay_bat_dau) = 1 and year(2021);

