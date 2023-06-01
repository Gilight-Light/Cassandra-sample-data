CREATE KEYSPACE QLBH
WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 3};

USE QLBH;

CREATE TYPE address ( T  text, H text, X text);

CREATE TABLE KHACHHANG(
	MSKH int,
	HOTEN tuple<text, text>,
	NGAYSINH date,
	DIACHI frozen<address>,
	SODT map<int, text>,
	DOANHSO bigint,
	PRIMARY KEY(DIACHI, MSKH)
);

CREATE TABLE NHANVIEN (
	MSNV int,
	HOTEN tuple<text, text>,
	NGAYSINH date,
	CHINHANH frozen<address>,
	PRIMARY KEY(CHINHANH, MSNV)
);

CREATE TABLE SANPHAM (
	MSSP int,
	TENSP text,
	DVT text,
	NUOCSX frozen<set<text>>,
	GIA int,
	PRIMARY KEY (NUOCSX, MSSP)
);

CREATE TABLE HOADON (
	SOHD int,
	NGAYHD date,
	MAKH int,
	MANV int,
	TRIGIA bigint,
	PRIMARY KEY (SOHD, NGAYHD)
);

CREATE TABLE CTHD (
	SOHD int,
	MASP int,
	SL int,
	GIA int,
	PRIMARY KEY(SOHD, MASP)
);
