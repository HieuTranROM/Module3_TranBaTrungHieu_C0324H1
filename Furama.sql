create database furama;

use furama;

drop table ViTri;

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
    sdt int(12),
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
    sdt int(11),
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