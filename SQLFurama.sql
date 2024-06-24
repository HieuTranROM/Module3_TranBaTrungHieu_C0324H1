use furama;

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các kí tự 
select * from nhanvien where hoTen like '%H%' or'%T%' or '%K' and length(hoTen) < 15;

-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 và có địa chỉ ở "Đà Nẵng" hoặc "Quảng Trị"
select * FROM khachhang
where (year(CURDATE()) - year(ngaySinh)) between 18 AND 50
and (diaChi = 'Da Nang' or diaChi = 'Quang Tri');

-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần 
select kh.hoTen as "Tên khách hàng",COUNT(hd.IDHopDong) as "Số lần đặt phòng"
from KhachHang kh
join LoaiKhach lk on kh.IDLoaiKhach = lk.IDLoaiKhach
join HopDong hd on kh.IDKhachHang = hd.IDKhachHang
where lk.tenLoaiKhach = 'Diamond'
group by kh.IDKhachHang, kh.hoTen
order by "Số lần đặt phòng" asc;

-- 5.Hiển thị các thông tin cho tất cả khách hàng đã từng đặt phòng (Những khách hàng chưa từng đặt phòng cũng hiển thị ra)
SELECT 
    kh.IDKhachHang,
    kh.hoTen,
    lk.tenLoaiKhach,
    hd.IDHopDong,
    dv.tenDichVu,
    hd.ngayLamHopDong,
    hd.ngayKetThuc,
    IFNULL(hd.tongTien + COALESCE(SUM(hdct.soLuong * dvdk.gia), 0), 0) AS TongTien
FROM 
    KhachHang kh
LEFT JOIN 
    LoaiKhach lk ON kh.IDLoaiKhach = lk.IDLoaiKhach
LEFT JOIN 
    HopDong hd ON kh.IDKhachHang = hd.IDKhachHang
LEFT JOIN 
    DichVu dv ON hd.IDDichVu = dv.IDDichVu
LEFT JOIN 
    HopDongChiTiet hdct ON hd.IDHopDong = hdct.IDHopDong
LEFT JOIN 
    DichVuDiKem dvdk ON hdct.IDDichVuDiKem = dvdk.IDDichVuDiKem
GROUP BY 
    kh.IDKhachHang, kh.hoTen, lk.tenLoaiKhach, hd.IDHopDong, dv.tenDichVu, hd.ngayLamHopDong, hd.ngayKetThuc, hd.tongTien
ORDER BY 
    kh.IDKhachHang;

-- 6.Hiển thị tất cả các loại Dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2019    
SELECT 
    dv.IDDichVu, 
    dv.tenDichVu, 
    dv.dienTich, 
    dv.chiPhiThue, 
    ldv.tenLoaiDichVu
FROM 
    DichVu dv
LEFT JOIN 
    LoaiDichVu ldv ON dv.IdLoaiDichVu = ldv.IDLoaiDichVu
LEFT JOIN 
    HopDong hd ON dv.IDDichVu = hd.IDDichVu 
    AND hd.ngayLamHopDong >= '2019-01-01' 
    AND hd.ngayLamHopDong < '2019-03-01'
WHERE 
    hd.IDDichVu IS NULL;

-- 7.Hiển thị của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng năm 2018 nhưng chưa từng được đặt năm 2019 
SELECT 
    dv.IDDichVu, 
    dv.tenDichVu, 
    dv.dienTich, 
    dv.soNguoiToiDa, 
    dv.chiPhiThue, 
    ldv.tenLoaiDichVu
FROM 
    DichVu dv
JOIN 
    LoaiDichVu ldv ON dv.IdLoaiDichVu = ldv.IDLoaiDichVu
WHERE 
    EXISTS (
        SELECT 1
        FROM HopDong hd
        WHERE hd.IDDichVu = dv.IDDichVu
          AND YEAR(hd.ngayLamHopDong) = 2018
    )
    AND NOT EXISTS (
        SELECT 1
        FROM HopDong hd
        WHERE hd.IDDichVu = dv.IDDichVu
          AND YEAR(hd.ngayLamHopDong) = 2019
    );
    
-- 8
-- c1
SELECT DISTINCT hoTen AS HoTenKhachHang
FROM KhachHang;

-- c2
SELECT hoTen AS HoTenKhachHang
FROM KhachHang
GROUP BY hoTen;

-- 9
SELECT 
    MONTH(hd.ngayLamHopDong) AS Thang,
    COUNT(DISTINCT hd.IDKhachHang) AS SoKhachHang
FROM 
    HopDong hd
WHERE 
    YEAR(hd.ngayLamHopDong) = 2019
GROUP BY 
    MONTH(hd.ngayLamHopDong)
ORDER BY 
    Thang;
    
-- 10
SELECT 
    hd.IDHopDong,
    hd.ngayLamHopDong,
    hd.ngayKetThuc,
    hd.tienDatCoc,
    COUNT(hdct.IDHopDongChiTiet) AS SoLuongDichVuDiKem
FROM 
    HopDong hd
LEFT JOIN 
    HopDongChiTiet hdct ON hd.IDHopDong = hdct.IDHopDong
GROUP BY 
    hd.IDHopDong,
    hd.ngayLamHopDong,
    hd.ngayKetThuc,
    hd.tienDatCoc;

-- 11
SELECT 
    dvdk.IDDichVuDiKem,
    dvdk.tenDichVuDiKem,
    dvdk.gia,
    dvdk.donVi,
    dvdk.trangThaiKhaDung,
    lk.tenLoaiKhach
FROM 
    KhachHang kh
JOIN 
    LoaiKhach lk ON kh.IDLoaiKhach = lk.IDLoaiKhach
JOIN 
    HopDong hd ON kh.IDKhachHang = hd.IDKhachHang
JOIN 
    HopDongChiTiet hdct ON hd.IDHopDong = hdct.IDHopDong
JOIN 
    DichVuDiKem dvdk ON hdct.IDDichVuDiKem = dvdk.IDDichVuDiKem
WHERE 
    lk.tenLoaiKhach = 'Diamond' AND 
    (kh.diaChi = 'Vinh' OR kh.diaChi = 'Quảng Ngãi');
-- 12
SELECT 
    hd.IDHopDong,
    nv.hoTen AS TenNhanVien,
    kh.hoTen AS TenKhachHang,
    kh.sdt AS SoDienThoaiKhachHang,
    dv.tenDichVu,
    SUM(hdct.soLuong) AS SoLuongDichVuDiKem,
    hd.tienDatCoc
FROM 
    HopDong hd
JOIN 
    NhanVien nv ON hd.IDNhanVien = nv.IDNhanVien
JOIN 
    KhachHang kh ON hd.IDKhachHang = kh.IDKhachHang
JOIN 
    DichVu dv ON hd.IDDichVu = dv.IDDichVu
JOIN 
    HopDongChiTiet hdct ON hd.IDHopDong = hdct.IDHopDong
WHERE 
    hd.ngayLamHopDong BETWEEN '2019-10-01' AND '2019-12-31'
    AND hd.IDDichVu NOT IN (
        SELECT DISTINCT hd2.IDDichVu
        FROM HopDong hd2
        WHERE hd2.ngayLamHopDong BETWEEN '2019-01-01' AND '2019-06-30'
    )
GROUP BY 
    hd.IDHopDong, nv.hoTen, kh.hoTen, kh.sdt, dv.tenDichVu, hd.tienDatCoc
ORDER BY 
    hd.IDHopDong;

-- 13
SELECT 
    dvdk.IDDichVuDiKem, 
    dvdk.tenDichVuDiKem, 
    COUNT(hdct.IDHopDongChiTiet) AS SoLanSuDung
FROM 
    HopDongChiTiet hdct
JOIN 
    DichVuDiKem dvdk ON hdct.IDDichVuDiKem = dvdk.IDDichVuDiKem
GROUP BY 
    dvdk.IDDichVuDiKem, 
    dvdk.tenDichVuDiKem
HAVING 
    COUNT(hdct.IDHopDongChiTiet) = (
        SELECT 
            MAX(SoLanSuDung)
        FROM (
            SELECT 
                COUNT(hdct2.IDHopDongChiTiet) AS SoLanSuDung
            FROM 
                HopDongChiTiet hdct2
            GROUP BY 
                hdct2.IDDichVuDiKem
        ) AS subquery
    );


-- 14
SELECT 
    hd.IDHopDong,
    ldv.tenLoaiDichVu,
    dvdk.tenDichVuDiKem,
    COUNT(*) AS SoLanSuDung
FROM 
    HopDongChiTiet hdct
JOIN 
    DichVuDiKem dvdk ON hdct.IDDichVuDiKem = dvdk.IDDichVuDiKem
JOIN 
    HopDong hd ON hdct.IDHopDong = hd.IDHopDong
JOIN 
    DichVu dv ON hd.IDDichVu = dv.IDDichVu
JOIN 
    LoaiDichVu ldv ON dv.IdLoaiDichVu = ldv.IDLoaiDichVu
GROUP BY 
    hd.IDHopDong, ldv.tenLoaiDichVu, dvdk.tenDichVuDiKem
HAVING 
    SoLanSuDung = 1;
    
-- 15
SELECT 
    nv.IDNhanVien,
    nv.hoTen AS HoTen,
    td.trinhDo AS TrinhDo,
    bp.tenBoPhan AS TenBoPhan,
    nv.sdt AS SoDienThoai,
    nv.diaChi AS DiaChi,
    COUNT(hd.IDHopDong) AS SoHopDong
FROM 
    NhanVien nv
JOIN 
    HopDong hd ON nv.IDNhanVien = hd.IDNhanVien
JOIN 
    TrinhDo td ON nv.IDTrinhDo = td.IDTrinhDo
JOIN 
    BoPhan bp ON nv.IDBoPhan = bp.IDBoPhan
WHERE 
    YEAR(hd.ngayLamHopDong) BETWEEN 2018 AND 2019
GROUP BY 
    nv.IDNhanVien, nv.hoTen, td.trinhDo, bp.tenBoPhan, nv.sdt, nv.diaChi
HAVING 
    COUNT(hd.IDHopDong) <= 3;
-- 16
DELETE FROM NhanVien
WHERE NOT EXISTS (
    SELECT 1
    FROM HopDong hd
    WHERE hd.IDNhanVien = NhanVien.IDNhanVien
      AND YEAR(hd.ngayLamHopDong) BETWEEN 2017 AND 2019
);
-- 17
UPDATE KhachHang kh
SET kh.IDLoaiKhach = (
    SELECT lk.IDLoaiKhach
    FROM LoaiKhach lk
    WHERE lk.tenLoaiKhach = 'Diamond'
)
WHERE kh.IDKhachHang IN (
    SELECT hd.IDKhachHang
    FROM HopDong hd
    WHERE YEAR(hd.ngayLamHopDong) = 2019
    GROUP BY hd.IDKhachHang
    HAVING SUM(hd.tongTien) > 10000000
);

-- 18
DELETE FROM KhachHang
WHERE IDKhachHang IN (
    SELECT kh.IDKhachHang
    FROM KhachHang kh
    INNER JOIN HopDong hd ON kh.IDKhachHang = hd.IDKhachHang
    WHERE YEAR(hd.ngayLamHopDong) < 2016
);
-- 19
UPDATE DichVuDiKem
SET gia = gia * 2
WHERE IDDichVuDiKem IN (
    SELECT 
        hdct.IDDichVuDiKem
    FROM 
        HopDongChiTiet hdct
    INNER JOIN 
        HopDong hd ON hdct.IDHopDong = hd.IDHopDong
    WHERE 
        YEAR(hd.ngayLamHopDong) = 2019
    GROUP BY 
        hdct.IDDichVuDiKem
    HAVING 
        COUNT(hdct.IDDichVuDiKem) > 10
);

-- 20
SELECT 
    IDNhanVien AS ID, 
    hoTen AS HoTen, 
    email AS Email, 
    sdt AS SoDienThoai, 
    ngaySinh AS NgaySinh, 
    diaChi AS DiaChi,
	'Nhân viên' as 'role'  
FROM 
    NhanVien

UNION

SELECT 
    IDKhachHang AS ID, 
    hoTen AS HoTen, 
    email AS Email, 
    sdt AS SoDienThoai, 
    ngaySinh AS NgaySinh, 
    diaChi AS DiaChi,
    'Khách hàng' as 'role'
FROM 
    KhachHang;










