create database furama_management;
USE furama_management;


---------- CÁC BẢNG LƯU TRỮ DỮ LIỆU ----------

DROP DATABASE IF EXISTS furama_management;

CREATE DATABASE furama_management;

USE furama_management;

-- Vị trí --
CREATE TABLE position (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Trình độ --
CREATE TABLE education_degree (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Bộ phận --
CREATE TABLE division (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Loại dịch vụ --
CREATE TABLE facility_type (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Kiểu thuê --
CREATE TABLE rengt_type (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Loại khách hàng --
CREATE TABLE customer_type (
    id INT,
    `name` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Dịch vụ miễn phí đi kèm --
CREATE TABLE attach_facility (
    id INT,
    `name` VARCHAR(45),
    cost DOUBLE,
    unit VARCHAR(10),
    `status` VARCHAR(45),
    PRIMARY KEY (id)
);

-- Nhân viên --
CREATE TABLE employee (
    id INT AUTO_INCREMENT,
    `name` VARCHAR(45),
    date_of_birth DATE,
    id_card VARCHAR(45),
    salary DOUBLE,
    phone_number VARCHAR(45),
    email VARCHAR(45),
    address VARCHAR(45),
    position_id INT,
    education_degree_id INT,
    division_id INT,
    PRIMARY KEY (id),
    `status` bit(1) default 1
);

-- Khách hàng --
CREATE TABLE customer (
    id INT AUTO_INCREMENT,
    customer_type_id INT,
    `name` VARCHAR(45),
    date_of_birth DATE,
    gender BIT(1),
    id_card VARCHAR(45),
    phone_number VARCHAR(45),
    email VARCHAR(45),
    address VARCHAR(45),
    PRIMARY KEY (id),
    `status` bit(1) default 1
);




-- Dịch vụ --
CREATE TABLE facility (
    id INT AUTO_INCREMENT,
    `name` VARCHAR(45),
    area INT,
    cost DOUBLE,
    max_people INT,
    rent_type_id INT,
    facility_type_id INT,
    standard_room VARCHAR(45),
    description_other_convenience VARCHAR(45),
    pool_area DOUBLE,
    number_of_floor INT,
    facility_free TEXT,
    PRIMARY KEY (id),
	foreign key (rent_type_id) references rengt_type(id),
    foreign key (facility_type_id) references facility_type(id),
    `status` bit(1) default 1
);

-- Hợp đồng --
CREATE TABLE contract (
    id INT AUTO_INCREMENT,
    start_date DATETIME,
    end_date DATETIME,
    deposit DOUBLE,
    employee_id INT,
    customer_id INT,
    facility_id INT,
    PRIMARY KEY (id)
);

-- Hợp đồng chi tiếc --
CREATE TABLE contract_detail (
    id INT,
    amount INT,
    contract_id INT,
    attach_facility_id INT,
    PRIMARY KEY (id)
);
