use furama_management;
INSERT INTO position (id, `name`) 
VALUES ('1', 'Quản Lý'), ('2', 'Nhân Viên');

-- Trình độ --
INSERT INTO education_degree (id, `name`) 
VALUES ('1', 'Trung Cấp'),
('2', 'Cao Đẳng'),
('3', 'Đại Học'),
('4', 'Sau Đại Học');
 
 -- Bộ phận --
INSERT INTO division (id, `name`) 
VALUES ('1', 'Sale-Marketing'),
('2', 'Hành chính'),
('3', 'Phục vụ'),
('4', 'Quản lý');
  
-- Danh sách nhân viên -- 
INSERT INTO employee (id, `name`, date_of_birth, id_card, salary, phone_number, email, address, position_id, education_degree_id, division_id)
VALUES ('1', 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
('2', 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'),
('3', 'Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
('4', 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'),
('5', 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'),
('6', 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
('7', 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
('8', 'Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
('9', 'Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'),
('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');

-- Loại khách hàng --
INSERT INTO customer_type (id, `name`) 
VALUES ('1', 'Diamond'),
('2', 'Platinium'),
('3', 'Gold'),
('4', 'Silver'),
('5', 'Member');

-- Danh sách khách hàng -- 
INSERT INTO customer (id, customer_type_id, `name`, date_of_birth, gender, id_card, phone_number, email, address) 
VALUES('1', '5', 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
('2', '3', 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
('3', '1', 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
('4', '1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
('5', '4', 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
('6', '4', 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
('8', '3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
('9', '1', 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');

-- Kiểu thuê --
INSERT INTO rengt_type (id, name)
VALUES ('1', 'year'),
('2', 'month'),
('3', 'day'),
('4', 'hour');

-- Loại dịch vụ --
INSERT INTO facility_type (id, name)
VALUES ('1', 'Villa'),
('2', 'House'),
('3', 'Room');

-- Dịch vụ --
INSERT INTO facility (id, name, area, cost, max_people, rent_type_id, facility_type_id, standard_room, description_other_convenience, pool_area, number_of_floor, facility_free)
VALUES ('1', 'Villa Beach Front', '25000', '1000000', '10', '3', '1', 'vip', 'Có hồ bơi', '500', '4', null),
 ('2', 'House Princess 01', '14000', '5000000', '7', '2', '2', 'vip', 'Có thêm bếp nướng', null, '3', null),
 ('3', 'Room Twin 01', '5000', '1000000', '2', '4', '3', 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp'),
 ('4', 'Villa No Beach Front', '22000', '9000000', '8', '3', '1', 'normal', 'Có hồ bơi', '300', '3', null),
 ('5', 'House Princess 02', '10000', '4000000', '5', '3', '2', 'normal', 'Có thêm bếp nướng', null, '2', null),
 ('6', 'Room Twin 02', '3000', '900000', '2', '4', '3', 'normal', 'Có tivi', null, null, '1 Xe máy');


-- Dịch vụ đi kèm --
INSERT INTO attach_facility (id, name, cost, unit, status) 
VALUES ('1', 'Karaoke', '10000', 'giờ', 'tiện nghi, hiện tại'),
('2', 'Thuê xe máy', '10000', 'chiếc', 'hỏng 1 xe'),
('3', 'Thuê xe đạp', '20000', 'chiếc', 'tốt'),
('4', 'Buffet buổi sáng', '15000', 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('5', 'Buffet buổi trưa', '90000', 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('6', 'Buffet buổi tối', '16000', 'suất', 'đầy đủ đồ ăn, tráng miệng');

-- Hợp đông --
INSERT INTO contract (id, start_date, end_date, deposit, employee_id, customer_id, facility_id) 
VALUES ('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3'),
('2', '2020-07-14', '2020-07-21', '200000', '7', '3', '1'),
('3', '2021-03-15', '2021-03-17', '50000', '3', '4', '2'),
('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5'),
('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6'),
('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6'),
('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4'),
('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1'),
('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3'),
('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5'),
('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1'),
('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');

INSERT INTO contract_detail (id, amount, contract_id, attach_facility_id)
VALUES ('1', '5', '2', '4'),
('2', '8', '2', '5'),
('3', '15', '2', '6'),
('4', '1', '3', '1'),
('5', '11', '3', '2'),
('6', '1', '1', '3'),
('7', '2', '1', '2'),
('8', '2', '12', '2');

-- CREATE PROCEDURE find_customer(IN key_search VARCHAR(45))
-- 	BEGIN
	select c.id, 
    ct.`name` as customer_type, 
    c.`name`, 
    c.date_of_birth, 
    c.gender, 
    c.id_card, 
    c.phone_number,
    c.email,
    c.address 
    from 
	customer c join customer_type ct on c.id = ct.id 
    where
    ct.`name` like 'diamond';
    
    -- where
-- 			c.`name` like concat("%", ngu, "%") 	;
			-- OR 
	-- 		c.id LIKE  concat("%", key_search, "%")
-- 			OR  
-- 			ct.`name` LIKE  concat("%", key_search, "%")
-- 	END //
-- DELIMITER ;


	
        -- 
select c.id,
		c.name AS customer_name,
		c.date_of_birth,
		c.gender,
		c.id_card,
		c.phone_number,
		c.email,
		c.address,
        c.customer_type_id, 
        ct.`name` as customer_type_name 
 from customer c  join customer_type ct on c.id = ct.id where (c.gender = ? and c.`name` like '?%') or c.phone_number like '09%';

	select * from customer;

-- Câu 11: Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng 
-- bởi những khách hàng có "tên loại khách" là “Diamond” và có "địa chỉ" ở “Vinh” hoặc “Quảng Ngãi”.
SELECT 
		c.id,
		c.name AS customer_name,
		c.date_of_birth,
		c.gender,
		c.id_card,
		c.phone_number,
		c.email,
		c.address,
        c.customer_type_id,
		ct.name AS customer_type
	FROM
		customer c
			JOIN
		customer_type ct ON c.customer_type_id = ct.id
	WHERE
		c.name LIKE  concat("%", key_search, "%") 
			OR 
        c.phone_number LIKE  concat("%", key_search, "%")
			OR  
        ct.name LIKE  concat("%", key_search, "%"); 
        
        select c.id, c.name AS customer_name, c.date_of_birth, c.gender, c.id_card, 
        c.phone_number, c.email, c.address, c.customer_type_id,  ct.`name` as customer_type_name  from customer c 
        join customer_type ct on c.id = ct.id where  c.`name` = 'Nguyễn Thị Hào' or c.id = 0;