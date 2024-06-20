create database furama;

use furama;

drop database furama;

create table ViTri(
	IDViTri int auto_increment primary key,
    tenViTri varchar(255)
);

create table TrinhDo(
	IDTrinhDo int auto_increment primary key,
    trinhDo varchar(255)
);

create table BoPhan(
	IDBoPhan int auto_increment primary key,
    tenBoPhan varchar(255)
);

create table NhanVien(
	IDNhanVien int auto_increment primary key,
    hoTen varchar(255) not null,
    IDViTri int not null,
    IDTrinhDo int not null,
    IDBoPhan int not null,
    ngaySinh date,
    SoCMTND varchar(255),
    luong int,
    sdt varchar(15),
    email varchar(255),
    diaChi varchar(255),
	foreign key (IDViTri) references ViTri(IDViTri),
	foreign key (IDTrinhDo) references TrinhDo(IDTrinhDo),
	foreign key (IDBoPhan) references BoPhan(IDBoPhan)
);

create table KhachHang(
	IDKhachHang int auto_increment primary key,
    IDLoaiKhach int,
    hoTen varchar(255),
    ngaySinh date,
    soCMTND varchar(255),
    sdt varchar(15),
    email varchar(255),
    diaChi varchar(255),
	foreign key (IDLoaiKhach) references LoaiKhach(IDLoaiKhach)
);

create table LoaiKhach(
	IDLoaiKhach int auto_increment primary key,
    tenLoaiKhach varchar(255)
);

create table HopDong(
	IDHopDong int auto_increment primary key,
    IDNhanVien int,
    IDKhachHang int,
    IDDichVu int,
    ngayLamHopDong DATE,
    ngayKetThuc DATE,
    tienDatCoc int,
    tongTien int,
	foreign key (IDNhanVien) references NhanVien(IDNhanVien),
	foreign key (IDKhachHang) references KhachHang(IDKhachHang),
	foreign key (IDDichVu) references DichVu(IDDichVu)
);

create table HopDongChiTiet(
	IDHopDongChiTiet int auto_increment primary key,
    IDHopDong int,
    IDDichVuDiKem int,
    soLuong int,
	foreign key (IDHopDong) references HopDong(IDHopDong),
	foreign key (IDDichVuDiKem) references DichVuDiKem(IDDichVuDiKem)
);

create table DichVuDiKem(
	IDDichVuDiKem int auto_increment primary key,
    tenDichVuDiKem varchar(255),
    gia int,
    donVi int,
    trangThaiKhaDung varchar(255)
);

create table DichVu(
	IDDichVu int auto_increment primary key,
    tenDichVu varchar(255),
    dienTich int,
    soTang int,
    soNguoiToiDa varchar(255),
    chiPhiThue int,
    IdKieuThue int,
    IdLoaiDichVu int,
    trangThai varchar(255),
	foreign key (IdKieuThue) references KieuThue(IdKieuThue),
	foreign key (IdLoaiDichVu) references LoaiDichVu(IdLoaiDichVu)
);

create table KieuThue(
	IDKieuThue int auto_increment primary key,
    tenKieuThue varchar(255),
    gia int
);

create table LoaiDichVu(
	IDLoaiDichVu int auto_increment primary key,
    tenLoaiDichVu varchar(255)
);

INSERT INTO ViTri (tenViTri) VALUES 
('Lễ tân'),
('Phục vụ'),
('Chuyên viên'),
('Giám sát');

INSERT INTO TrinhDo (trinhDo) VALUES 
('Trung cấp'),
('Cao đẳng'),
('Đại học'),
('Sau đại học');

INSERT INTO BoPhan (tenBoPhan) VALUES 
('Sale – Marketing'),
('Hành Chính'),
('Phục vụ'),
('Quản lý');

INSERT INTO NhanVien (hoTen, IDViTri, IDTrinhDo, IDBoPhan, ngaySinh, SoCMTND, luong, sdt, email, diaChi) VALUES 
('Nguyen Van A', 1, 1, 1, '1985-05-15', '123456789', 5000000, 123456789012, 'nguyenvana@example.com', 'Da Nang'),
('Tran Thi B', 2, 2, 2, '1990-08-25', '987654321', 6000000, 987654321012, 'tranthib@example.com', 'Da Nang'),
('Le Van C', 3, 3, 3, '1987-11-30', '456789123', 7000000, 456789123021, 'levanc@example.com', 'Da Nang');

INSERT INTO LoaiKhach (tenLoaiKhach) VALUES 
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

-- Insert into KhachHang
INSERT INTO KhachHang (IDLoaiKhach, hoTen, ngaySinh, soCMTND, sdt, email, diaChi) VALUES 
(1, 'Pham Van D', '1995-03-21', '321654987', 03216549870, 'phamvand@example.com', 'Da Nang'),
(2, 'Nguyen Thi E', '1992-07-11', '654321987', 06543219870, 'nguyenthie@example.com', 'Da Nang'),
(3, 'Tran Van F', '1998-12-05', '789123654', 07891236540, 'tranvanf@example.com', 'Quang Tri'),
(4, 'Hoang Van G', '1993-04-22', '654987321', 06549873210, 'hoangvang@example.com', 'Ha Noi'),
(5, 'Le Thi H', '1991-09-13', '321987654', 03219876540, 'lethih@example.com', 'Ha Noi'),
(1, 'Vu Van I', '1989-06-30', '789654123', 07896541230, 'vuvani@example.com', 'Quang Tri'),
(2, 'Nguyen Van J', '1994-08-19', '123789456', 01237894560, 'nguyenvanj@example.com', 'Ha Noi'),
(4, 'Tran Thi K', '1996-11-25', '987123654', 09871236540, 'tranthik@example.com', 'Sai Gon');


-- Insert into DichVu
INSERT INTO DichVu (tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, IdKieuThue, IdLoaiDichVu, trangThai) VALUES 
('Villa Luxury', 500, 2, '10', 2000000, 1, 1, 'Available'),
('Standard House', 200, 1, '5', 1000000, 2, 2, 'Available'),
('Deluxe Room', 50, 1, '2', 500000, 3, 3, 'Available');

-- Insert into KieuThue
INSERT INTO KieuThue (tenKieuThue, gia) VALUES 
('Theo năm', 24000000),
('Theo tháng', 2000000),
('Theo ngày', 100000),
('Theo giờ', 5000);

-- Insert into LoaiDichVu
INSERT INTO LoaiDichVu (tenLoaiDichVu) VALUES 
('Villa'),
('House'),
('Room');

-- Insert into DichVuDiKem
INSERT INTO DichVuDiKem (tenDichVuDiKem, gia, donVi, trangThaiKhaDung) VALUES 
('Massage', 300000, 1, 'Available'),
('Karaoke', 150000, 1, 'Available'),
('Thức ăn', 50000, 1, 'Available'),
('Nước uống', 20000, 1, 'Available');

-- Insert into HopDong
INSERT INTO HopDong (IDNhanVien, IDKhachHang, IDDichVu, ngayLamHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES 
(1, 33, 4, '2023-01-01', '2023-01-07', 1000000, 7000000),
(2, 34, 5, '2023-02-01', '2023-02-05', 500000, 5000000),
(3, 35, 6, '2023-03-01', '2023-03-03', 200000, 1500000);

-- Insert into HopDongChiTiet
INSERT INTO HopDongChiTiet (IDHopDong, IDDichVuDiKem, soLuong) VALUES 
(19, 1, 2),
(20, 2, 1),
(21, 3, 3);