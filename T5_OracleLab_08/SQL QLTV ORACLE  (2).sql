-- T?o b?ng tblTacGia
CREATE TABLE tblTacGia (
    MATG NUMBER PRIMARY KEY,
    TENTG NVARCHAR2(100),
    GIOITINH NVARCHAR2(10),
    DIACHI NVARCHAR2(200),
    GHICHU NVARCHAR2(200)
);

-- T?o b?ng tblNXB
CREATE TABLE tblNXB (
    MANXB NUMBER PRIMARY KEY,
    TENNXB NVARCHAR2(100),
    DIACHI NVARCHAR2(200),
    SODIENTHOAI NVARCHAR2(15),
    GHICHU NVARCHAR2(200)
);

-- T?o b?ng tblLinhVuc
CREATE TABLE tblLinhVuc (
    MaLV NUMBER PRIMARY KEY,
    TenLV NVARCHAR2(100),
    GhiChu NVARCHAR2(200)
);

-- T?o b?ng tblSach
CREATE TABLE tblSach (
    MASACH NUMBER PRIMARY KEY,
    TENSACH NVARCHAR2(200),
    MATG NUMBER,
    MANXB NUMBER,
    MaLV NUMBER,
    NAMXB NUMBER,
    SOTRANG NUMBER,
    SOLUONG NUMBER,
    NGAYNHAP DATE,
    GHICHU NVARCHAR2(200),
    FOREIGN KEY (MATG) REFERENCES tblTacGia(MATG),
    FOREIGN KEY (MANXB) REFERENCES tblNXB(MANXB),
    FOREIGN KEY (MaLV) REFERENCES tblLinhVuc(MaLV)
);

-- T?o b?ng tblDocGia
CREATE TABLE tblDocGia (
    MADG NUMBER PRIMARY KEY,
    HOTEN NVARCHAR2(100),
    NGAYSINH DATE,
    GIOITINH NVARCHAR2(10),
    LOP NVARCHAR2(50),
    DIACHI NVARCHAR2(200),
    EMAIL NVARCHAR2(100),
    GHICHU NVARCHAR2(200),
    SOPHIEMUON NUMBER
);

-- T?o b?ng tblNhanVien
CREATE TABLE tblNhanVien (
    TaiKhoan NVARCHAR2(50) PRIMARY KEY,
    MatKhau NVARCHAR2(50),
    QUYENHAN NVARCHAR2(50),
    TENNV NVARCHAR2(100),
    DiaChi NVARCHAR2(200),
    DIENTHOAI NVARCHAR2(15),
    EMAIL NVARCHAR2(100),
    ChucVu NVARCHAR2(50),
    Tuoi NUMBER
);

-- T?o b?ng tblMuon
CREATE TABLE tblMuon (
    MADG NUMBER,
    MASACH NUMBER,
    SOPHIEMUON NUMBER,
    NGAYMUON DATE,
    NGAYTRA DATE,
    XACNHANTRA NUMBER(1),
    GHICHU NVARCHAR2(200),
    PRIMARY KEY (MADG, MASACH),
    FOREIGN KEY (MADG) REFERENCES tblDocGia(MADG),
    FOREIGN KEY (MASACH) REFERENCES tblSach(MASACH)
);

-- Chèn d? li?u vào b?ng tblTacGia
INSERT INTO tblTacGia (MATG, TENTG, GIOITINH, DIACHI, GHICHU) VALUES
(1, 'Nguy?n Nh?t Ánh', 'Nam', 'Thành ph? H? Chí Minh', 'Không có ghi chú');
INSERT INTO tblTacGia (MATG, TENTG, GIOITINH, DIACHI, GHICHU) VALUES
(2, 'Nguy?n Ng?c T?', 'N?', 'Cà Mau', 'Không có ghi chú');
INSERT INTO tblTacGia (MATG, TENTG, GIOITINH, DIACHI, GHICHU) VALUES
(3, 'Tr?n ??ng Khoa', 'Nam', 'H?i D??ng', 'Không có ghi chú');

-- Chèn d? li?u vào b?ng tblNXB
INSERT INTO tblNXB (MANXB, TENNXB, DIACHI, SODIENTHOAI, GHICHU) VALUES
(1, 'NXB Kim ??ng', 'Hà N?i', '0123456789', 'Không có ghi chú');
INSERT INTO tblNXB (MANXB, TENNXB, DIACHI, SODIENTHOAI, GHICHU) VALUES
(2, 'NXB Tr?', 'Thành ph? H? Chí Minh', '0987654321', 'Không có ghi chú');
INSERT INTO tblNXB (MANXB, TENNXB, DIACHI, SODIENTHOAI, GHICHU) VALUES
(3, 'NXB V?n H?c', 'Hà N?i', '1234567890', 'Không có ghi chú');

-- Chèn d? li?u vào b?ng tblLinhVuc
INSERT INTO tblLinhVuc (MaLV, TenLV, GhiChu) VALUES
(1, 'V?n h?c', 'Không có ghi chú');
INSERT INTO tblLinhVuc (MaLV, TenLV, GhiChu) VALUES
(2, 'Khoa h?c', 'Không có ghi chú');
INSERT INTO tblLinhVuc (MaLV, TenLV, GhiChu) VALUES
(3, 'L?ch s?', 'Không có ghi chú');

-- Chèn d? li?u vào b?ng tblSach
INSERT INTO tblSach (MASACH, TENSACH, MATG, MANXB, MaLV, NAMXB, SOTRANG, SOLUONG, NGAYNHAP, GHICHU) VALUES
(1, 'M?t bi?c', 1, 1, 1, 1990, 300, 10, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Không có ghi chú');
INSERT INTO tblSach (MASACH, TENSACH, MATG, MANXB, MaLV, NAMXB, SOTRANG, SOLUONG, NGAYNHAP, GHICHU) VALUES
(2, 'Cô gái ??n t? hôm qua', 1, 2, 1, 1995, 250, 15, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'Không có ghi chú');
INSERT INTO tblSach (MASACH, TENSACH, MATG, MANXB, MaLV, NAMXB, SOTRANG, SOLUONG, NGAYNHAP, GHICHU) VALUES
(3, 'Cho tôi m?t vé ?i tu?i th?', 2, 3, 1, 2000, 200, 20, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'Không có ghi chú');
INSERT INTO tblSach (MASACH, TENSACH, MATG, MANXB, MaLV, NAMXB, SOTRANG, SOLUONG, NGAYNHAP, GHICHU) 
VALUES (4, 'Sach 4', 1, 1, 1, 2023, 150, 10, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Không có ghi chú');


-- Chèn d? li?u vào b?ng tblDocGia
INSERT INTO tblDocGia (MADG, HOTEN, NGAYSINH, GIOITINH, LOP, DIACHI, EMAIL, GHICHU, SOPHIEMUON) VALUES
(1, 'Lê V?n A', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'Nam', '12A1', 'Hà N?i', 'leva@gmail.com', 'Không có ghi chú', 1);
INSERT INTO tblDocGia (MADG, HOTEN, NGAYSINH, GIOITINH, LOP, DIACHI, EMAIL, GHICHU, SOPHIEMUON) VALUES
(2, 'Tr?n Th? B', TO_DATE('1999-02-02', 'YYYY-MM-DD'), 'N?', '12A2', 'Thành ph? H? Chí Minh', 'trantb@gmail.com', 'Không có ghi chú', 2);
INSERT INTO tblDocGia (MADG, HOTEN, NGAYSINH, GIOITINH, LOP, DIACHI, EMAIL, GHICHU, SOPHIEMUON) VALUES
(3, 'Nguy?n V?n C', TO_DATE('2001-03-03', 'YYYY-MM-DD'), 'Nam', '11A1', '?à N?ng', 'nguyenc@gmail.com', 'Không có ghi chú', 3);

-- Chèn d? li?u vào b?ng tblNhanVien
INSERT INTO tblNhanVien (TaiKhoan, MatKhau, QUYENHAN, TENNV, DiaChi, DIENTHOAI, EMAIL, ChucVu, Tuoi) VALUES
('admin', '123', 'admin', 'Nguy?n V?n Admin', 'Hà N?i', '0123456789', 'admin1@gmail.com', 'Qu?n lý', 35);
INSERT INTO tblNhanVien (TaiKhoan, MatKhau, QUYENHAN, TENNV, DiaChi, DIENTHOAI, EMAIL, ChucVu, Tuoi) VALUES
('user1', 'password2', 'user', 'Tr?n Th? User', 'Thành ph? H? Chí Minh', '0987654321', 'user1@gmail.com', 'Nhân viên', 28);
INSERT INTO tblNhanVien (TaiKhoan, MatKhau, QUYENHAN, TENNV, DiaChi, DIENTHOAI, EMAIL, ChucVu, Tuoi) VALUES
('admin3', '123', 'admin', 'Lê V?n Admin', '?à N?ng', '1234567890', 'admin2@gmail.com', 'Qu?n lý', 40);

-- Chèn d? li?u vào b?ng tblMuon
INSERT INTO tblMuon (MADG, MASACH, SOPHIEMUON, NGAYMUON, NGAYTRA, XACNHANTRA, GHICHU) VALUES
(1, 1, 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), 0, 'Không có ghi chú');
INSERT INTO tblMuon (MADG, MASACH, SOPHIEMUON, NGAYMUON, NGAYTRA, XACNHANTRA, GHICHU) VALUES
(2, 2, 2, TO_DATE('2023-05-05', 'YYYY-MM-DD'), TO_DATE('2023-05-20', 'YYYY-MM-DD'), 0, 'Không có ghi chú');
INSERT INTO tblMuon (MADG, MASACH, SOPHIEMUON, NGAYMUON, NGAYTRA, XACNHANTRA, GHICHU) VALUES
(3, 3, 3, TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2023-05-25', 'YYYY-MM-DD'), 0, 'Không có ghi chú');

-- Truy v?n t?t c? d? li?u t? các b?ng
SELECT * FROM tblTacGia;
SELECT * FROM tblNXB;
SELECT * FROM tblLinhVuc;
SELECT * FROM tblSach;
SELECT * FROM tblDocGia;
SELECT * FROM tblNhanVien;
SELECT * FROM tblMuon;

--1. n?u NV < 18t thì k ?c thêm NV
CREATE OR REPLACE TRIGGER trg_check_age
BEFORE INSERT ON tblNhanVien
FOR EACH ROW
BEGIN
    IF :NEW.Tuoi < 18 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nhân viên ph?i t? 18 tu?i tr? lên.');
    END IF;
END;
/
INSERT INTO tblNhanVien (TaiKhoan, MatKhau, QUYENHAN, TENNV, DiaChi, DIENTHOAI, EMAIL, ChucVu, Tuoi)
VALUES ('nv03', 'password3', 'User', 'Tran Van C', '789 GHI Street', '0123987654', 'tranvanc@example.com', 'Thuc Tap', 17);
--2. M??n sách thì s? l??ng gi?m ?i 1
CREATE OR REPLACE TRIGGER trg_update_sach
BEFORE INSERT ON tblMuon
FOR EACH ROW
BEGIN
    IF :NEW.NGAYTRA IS NULL THEN
        -- Gi?m s? l??ng sách trong b?ng tblSach
        UPDATE tblSach
        SET SOLUONG = SOLUONG - 1
        WHERE MASACH = :NEW.MASACH;

        -- Gán giá tr? cho c?t GHICHU và XACNHANTRA
        :NEW.GHICHU := 'chua tra';
        :NEW.XACNHANTRA := 0;
    END IF;
END;
/

INSERT INTO tblMuon (MADG, MASACH, SOPHIEMUON, NGAYMUON, NGAYTRA, XACNHANTRA, GHICHU) VALUES
(3, 1, 3, TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2023-05-25', 'YYYY-MM-DD'), 0, 'Không có ghi chú');
DELETE FROM tblMuon WHERE MADG=3 AND MASACH=2;

INSERT INTO tblMuon (MADG, MASACH, SOPHIEMUON, NGAYMUON) VALUES
(3, 2, 3, TO_DATE('2023-05-10', 'YYYY-MM-DD'));
--3. Tr? sách thì sansch t?ng lên 1
UPDATE tblMuon
SET NGAYTRA = TO_DATE('2024-06-10', 'YYYY-MM-DD')
WHERE MADG = 3 AND MASACH = 2;

CREATE OR REPLACE TRIGGER trg_trasach
BEFORE UPDATE OF NGAYTRA ON tblMuon
FOR EACH ROW
BEGIN
    IF :NEW.NGAYTRA IS NOT NULL THEN
        -- C?p nh?t giá tr? c?a XACNHANTRA và GHICHU
        :NEW.XACNHANTRA := 1;
        :NEW.GHICHU := 'da tra';

        -- T?ng s? l??ng sách trong b?ng tblSach
        UPDATE tblSach
        SET SOLUONG = SOLUONG + 1
        WHERE MASACH = :NEW.MASACH;
    END IF;
END;
/
SELECT * FROM tblMuon;
--4. m?i ??c gi? m??n t?i ?a 3 cu?n
CREATE OR REPLACE TRIGGER trg_limit_books
BEFORE INSERT ON tblMuon
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- ??m s? l??ng sách mà ??c gi? ?ã m??n và ch?a tr?
    SELECT COUNT(*)
    INTO v_count
    FROM tblMuon
    WHERE MADG = :NEW.MADG AND XACNHANTRA = 0;

    -- Ki?m tra n?u s? l??ng sách ?ã m??n và ch?a tr? >= 3
    IF v_count >= 3 THEN
        RAISE_APPLICATION_ERROR(-20001, '??c gi? ?ã m??n ?? 3 cu?n sách.');
    END IF;
END;

INSERT INTO tblMuon (MADG, MASACH, SOPHIEMUON, NGAYMUON)
VALUES (3, 4, 1000, TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO tblMuon (MADG, MASACH, SOPHIEMUON, NGAYMUON)
VALUES (3, 2, 1000, TO_DATE('2024-06-01', 'YYYY-MM-DD'));

/

--5. không cho phép ??c gi? có tình tr?ng b? c?m m??n sách
CREATE OR REPLACE TRIGGER trg_check_soluong_sach
BEFORE INSERT OR UPDATE OF SOLUONG ON tblSach
FOR EACH ROW
DECLARE
    v_message NVARCHAR2(200);
BEGIN
    IF :NEW.SOLUONG < 5 THEN
        v_message := 'Sách ' || :NEW.TENSACH || ' s?p h?t. Nh?p thêm sách.';
        -- Xóa toàn b? n?i dung trong c?t GHICHU
        :NEW.GHICHU := NULL;
        -- Thêm ghi chú m?i
        :NEW.GHICHU := v_message;
        DBMS_OUTPUT.PUT_LINE(v_message);
    END IF;
END;
/

UPDATE tblsach
SET soluong=4
WHERE MASACH = 2;
select*from tblsach

--n?u 