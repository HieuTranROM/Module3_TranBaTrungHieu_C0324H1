create database sale_management;
drop database sale_management;
use sale_management;

create table phieu_xuat(
    soPX int PRIMARY KEY,
    ngayXuat DATE
);

create table vat_tu(
    maVTU int PRIMARY KEY,
    tenVTU varchar(255)
);

create table chi_tiet_phieu_xuat(
    soPX int,
    maVTU int,
    dGXuat varchar(255),
    sLXuat int,
    PRIMARY KEY (soPX,maVTU),
    Foreign KEY (soPX) references phieu_xuat(soPX),
    Foreign KEY (maVTU) references vat_tu(maVTU)
);

create table phieu_nhap(
    soPN int primary key,
    ngayNhap date 
);

create table chi_tiet_phieu_nhap(
    dGNhap double,
    sLNhap int,
    maVTU int ,
    soPN int ,
    primary key (maVTU,soPN),
    foreign key (maVTU) references vat_tu(maVTU),
    foreign key (soPN) references phieu_nhap(soPN)
);

create table nhacc(
    maNCC int primary key,
    tenNCC varchar(50),
    diaChi varchar(50)
);

create table dondh(
    soDH int primary key,
    ngayDH date,
    maNcc int,
    foreign key (maNcc) references nhaCC(maNCC)
);

create table chi_tiet_don_dat_hang(
    maVTU int,
    soDH int,
    primary key(maVTU,soDH),
    foreign key(maVTU) references vat_tu(maVTU),
    foreign key(maVTU) references dondh(soDH)
);

create table SDT(
    sdt varchar (10) not null primary key,
    maNcc int,
    foreign key(maNcc) references nhacc(maNcc)
);