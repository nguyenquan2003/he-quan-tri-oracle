CREATE USER HotenSV_QLSV IDENTIFIED BY 123;

GRANT CREATE SESSION TO HotenSV_QLSV;
GRANT CREATE TABLE TO HotenSV_QLSV;
GRANT INSERT ANY TABLE TO HotenSV_QLSV;

CREATE TABLE LOPHOC(
    MALOP VARCHAR2(8) PRIMARY KEY,
    SISO INT,
    LOPTRUONG VARCHAR2(8),
    GVQUANLI VARCHAR2(7),
    NAMBATDAU INT,
    NAMKETTHUC INT
);

CREATE TABLE GIAOVIEN(
    MAGV VARCHAR2(7) PRIMARY KEY,
    TENGV VARCHAR2(50),
    NGAYSINH DATE,
    GIOITINH NVARCHAR2(10),
    DIENTHOAI VARCHAR2(11),
    MAGVQUANLI VARCHAR2(7),
    CONSTRAINT FK_GV_SELF FOREIGN KEY (MAGVQUANLI) REFERENCES GIAOVIEN(MAGV)
);

CREATE TABLE HOCVIEN(
    MAHOCVIEN VARCHAR2(8) PRIMARY KEY,
    TENHOCVIEN NVARCHAR2(50),
    NGAYSINH DATE,
    TINHTRANG NVARCHAR2(50),
    MALOP VARCHAR2(8),
    CONSTRAINT FK_HV_LOPHOC FOREIGN KEY (MALOP) REFERENCES LOPHOC(MALOP)
);

CREATE TABLE MONHOC(
    MAMONHOC VARCHAR2(7) PRIMARY KEY,
    TENMONHOC VARCHAR2(50),
    SOCHI INT,
    MALOP VARCHAR2(8),
    CONSTRAINT FK_MH_LOPHOC FOREIGN KEY (MALOP) REFERENCES LOPHOC(MALOP)
);

CREATE TABLE KETQUA(
    MAHV VARCHAR2(8),
    MAMONHOC VARCHAR2(7),
    LANTHI INT,
    DIEM FLOAT,
    PRIMARY KEY (MAHV, MAMONHOC, LANTHI),
    CONSTRAINT FK_KQ_HOCVIEN FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHOCVIEN),
    CONSTRAINT FK_KQ_MONHOC FOREIGN KEY (MAMONHOC) REFERENCES MONHOC(MAMONHOC)
);

CREATE TABLE GIAOVIEN_DAY_MONHOC (
    MAGV VARCHAR2(7),
    MAMH VARCHAR2(7),
    THANNIEN INT,
    SOLOPADAY INT,
    PRIMARY KEY (MAGV, MAMH),
    CONSTRAINT FK_GV_MH_GIAOVIEN FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV),
    CONSTRAINT FK_GV_MH_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMONHOC)
);

CREATE TABLE PHANCONG(
    MAGV VARCHAR2(7),
    MAMH VARCHAR2(7),
    MALOP VARCHAR2(8),
    PRIMARY KEY (MAGV, MAMH, MALOP),
    CONSTRAINT FK_PC_GIAOVIEN FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV),
    CONSTRAINT FK_PC_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMONHOC),
    CONSTRAINT FK_PC_LOPHOC FOREIGN KEY (MALOP) REFERENCES LOPHOC(MALOP)
);

-- 1
SELECT TENGV, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM NGAYSINH) AS TUOI
FROM GIAOVIEN
WHERE GIOITINH = 'Nữ';

-- 2
SELECT TENHOCVIEN, TINHTRANG
FROM HOCVIEN
WHERE MAHOCVIEN = 'HV000001';

-- 3
SELECT TENHOCVIEN
FROM HOCVIEN
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM NGAYSINH) <= 20;

-- 4
SELECT MALOP
FROM LOPHOC
WHERE SISO BETWEEN 2 AND 4;

-- 5
SELECT MAGV, TENGV, NGAYSINH
FROM GIAOVIEN
WHERE TENGV LIKE 'Nguyễn%';

-- 6
SELECT DISTINCT MAHV
FROM KETQUA
WHERE (MAMONHOC = 'MH00009' OR MAMONHOC = 'MH00010') AND DIEM < 5;

-- 7
SELECT TENGV
FROM GIAOVIEN
WHERE MAGVQUANLI IS NULL;

-- 8
SELECT DISTINCT MAGVQUANLI
FROM GIAOVIEN
WHERE MAGVQUANLI IS NOT NULL;

-- 9
SELECT DISTINCT MAGVQUANLI, TENGV
FROM GIAOVIEN
WHERE MAGVQUANLI IS NOT NULL;

-- 10
SELECT MAGVQUANLI
FROM GIAOVIEN
WHERE MAGV IN ('GV00006', 'GV00007', 'GV00010');

-- 11
SELECT MAMONHOC
FROM MONHOC
WHERE TENMONHOC LIKE '%dữ liệu%';

-- 12
SELECT TENHOCVIEN
FROM HOCVIEN
WHERE TENHOCVIEN LIKE 'Trần%' AND (TINHTRANG = 'Đã tốt nghiệp' OR TINHTRANG = 'Buộc thôi học');

-- 13
SELECT MAHOCVIEN, TENHOCVIEN
FROM HOCVIEN
WHERE MAHOCVIEN IN (SELECT LOPTRUONG FROM LOPHOC);

-- 14
SELECT KETQUA.MAMONHOC, MONHOC.TENMONHOC
FROM KETQUA
JOIN MONHOC ON KETQUA.MAMONHOC = MONHOC.MAMONHOC
WHERE MAHV = 'HV000005' AND DIEM < 5;

-- 15
SELECT MAHV
FROM KETQUA
WHERE MAMONHOC = 'MH00009'
GROUP BY MAHV
HAVING COUNT(*) > 1;

-- 16
SELECT MAHV, TENHOCVIEN, MAX(DIEM) AS MAX_DIEM
FROM KETQUA JOIN HOCVIEN ON KETQUA.MAHV = HOCVIEN.MAHOCVIEN
WHERE MAMONHOC = 'MH00009'
GROUP BY MAHV, TENHOCVIEN;

-- 17
SELECT TENHOCVIEN, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM NGAYSINH) AS TUOI
FROM HOCVIEN
WHERE NGAYSINH = (SELECT MAX(NGAYSINH) FROM HOCVIEN);

-- 18
SELECT MAMONHOC, TENMONHOC, SOCHI
FROM MONHOC
WHERE MAMONHOC = (SELECT MAMONHOC FROM KETQUA WHERE DIEM < 5 GROUP BY MAMONHOC ORDER BY COUNT(*) DESC FETCH FIRST 1 ROW ONLY);

-- 19
SELECT COUNT(DISTINCT MAMONHOC) AS SO_MON
FROM KETQUA
WHERE MAHV = (SELECT MAHOCVIEN FROM HOCVIEN WHERE TENHOCVIEN = 'Trần Minh An') AND DIEM >= 5;

-- 20
SELECT SUM(DIEM * SOCHI) / SUM(SOCHI) AS DIEM_TRUNG_BINH
FROM KETQUA JOIN MONHOC ON KETQUA.MAMONHOC = MONHOC.MAMONHOC
WHERE MAHV = 'HV000004';

-- 21
SELECT SUM(SOCHI) AS TIN_CHI_DA_DAT
FROM KETQUA JOIN MONHOC ON KETQUA.MAMONHOC = MONHOC.MAMONHOC
WHERE MAHV = (SELECT MAHOCVIEN FROM HOCVIEN WHERE TENHOCVIEN = 'Trần Minh An') AND DIEM >= 5;

-- 22
SELECT TENHOCVIEN, SUM(SOCHI) AS TIN_CHI_DA_DAT
FROM KETQUA JOIN MONHOC ON KETQUA.MAMONHOC = MONHOC.MAMONHOC
JOIN HOCVIEN ON KETQUA.MAHV = HOCVIEN.MAHOCVIEN
WHERE DIEM >= 5
GROUP BY TENHOCVIEN
HAVING SUM(SOCHI) > 8;

-- 23
SELECT TENHOCVIEN, SUM(DIEM * SOCHI) / SUM(SOCHI) AS DIEM_TRUNG_BINH
FROM KETQUA JOIN MONHOC ON KETQUA.MAMONHOC = MONHOC.MAMONHOC
JOIN HOCVIEN ON KETQUA.MAHV = HOCVIEN.MAHOCVIEN
GROUP BY TENHOCVIEN;

-- 24
SELECT MAHOCVIEN, TENHOCVIEN
FROM HOCVIEN
WHERE MAHOCVIEN NOT IN (
  SELECT MAHV FROM KETQUA WHERE LANTHI = 1 AND DIEM < 5
);

-- 25
SELECT MALOP, SISO, LOPTRUONG, GVQUANLI, NAMBATDAU, NAMKETTHUC
FROM LOPHOC
WHERE MALOP NOT IN (
  SELECT MALOP FROM HOCVIEN JOIN KETQUA ON HOCVIEN.MAHOCVIEN = KETQUA.MAHV
  WHERE LANTHI = 1 AND DIEM < 5
);