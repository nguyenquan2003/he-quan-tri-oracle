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

ALTER USER SYS IDENTIFIED BY 1234567890;

-- Ch? m?c trên c?t MATG trong tblSach
CREATE INDEX idx_tblSach_MATG ON tblSach(MATG);

-- Ch? m?c trên c?t MANXB trong tblSach
CREATE INDEX idx_tblSach_MANXB ON tblSach(MANXB);

-- Ch? m?c trên c?t MaLV trong tblSach
CREATE INDEX idx_tblSach_MaLV ON tblSach(MaLV);

-- Ch? m?c trên c?t TaiKhoan trong tblNhanVien
CREATE INDEX idx_tblNhanVien_TaiKhoan ON tblNhanVien(TaiKhoan);

-- Ch? m?c trên c?t MADG trong tblMuon
CREATE INDEX idx_tblMuon_MADG ON tblMuon(MADG);

-- Ch? m?c trên c?t MASACH trong tblMuon
CREATE INDEX idx_tblMuon_MASACH ON tblMuon(MASACH);

--Th? t?c ?? thêm d? li?u vào b?ng
CREATE OR REPLACE PROCEDURE InsertDataIntoTable (
    p_MADG IN tblDocGia.MADG%TYPE,
    p_HOTEN IN tblDocGia.HOTEN%TYPE,
    p_NGAYSINH IN tblDocGia.NGAYSINH%TYPE,
    p_GIOITINH IN tblDocGia.GIOITINH%TYPE,
    p_LOP IN tblDocGia.LOP%TYPE,
    p_DIACHI IN tblDocGia.DIACHI%TYPE,
    p_EMAIL IN tblDocGia.EMAIL%TYPE,
    p_GHICHU IN tblDocGia.GHICHU%TYPE,
    p_SOPHIEMUON IN tblDocGia.SOPHIEMUON%TYPE
) AS
BEGIN
    IF p_MADG IS NULL OR p_HOTEN IS NULL OR p_NGAYSINH IS NULL OR p_GIOITINH
    IS NULL OR p_LOP IS NULL OR p_DIACHI IS NULL OR p_EMAIL IS NULL OR p_GHICHU IS NULL OR p_SOPHIEMUON IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Vui lòng nh?p ??y ?? thông tin.');
    ELSE
        INSERT INTO tblDocGia (MADG, HOTEN, NGAYSINH, GIOITINH, LOP, DIACHI, EMAIL, GHICHU, SOPHIEMUON)
        VALUES (p_MADG, p_HOTEN, p_NGAYSINH, p_GIOITINH, p_LOP, p_DIACHI, p_EMAIL, p_GHICHU, p_SOPHIEMUON);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('D? li?u ?ã ???c thêm vào b?ng thành công.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END InsertDataIntoTable;

--Th? t?c ?? hi?n th? d? li?u
CREATE OR REPLACE PROCEDURE DisplayTableData AS
    CURSOR c_table_data IS
        SELECT * FROM tblDocGia;
    v_MADG tblDocGia.MADG%TYPE;
    v_HOTEN tblDocGia.HOTEN%TYPE;
    v_NGAYSINH tblDocGia.NGAYSINH%TYPE;
    v_GIOITINH tblDocGia.GIOITINH%TYPE;
    v_LOP tblDocGia.LOP%TYPE;
    v_DIACHI tblDocGia.DIACHI%TYPE;
    v_EMAIL tblDocGia.EMAIL%TYPE;
    v_GHICHU tblDocGia.GHICHU%TYPE;
    v_SOPHIEMUON tblDocGia.SOPHIEMUON%TYPE;
BEGIN
    OPEN c_table_data;
    LOOP
        FETCH c_table_data INTO v_MADG, v_HOTEN, v_NGAYSINH, v_GIOITINH, v_LOP, v_DIACHI, v_EMAIL, v_GHICHU, v_SOPHIEMUON;
        EXIT WHEN c_table_data%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('MADG: ' || v_MADG || ', HOTEN: ' || v_HOTEN || ', NGAYSINH: ' || v_NGAYSINH || ', GIOITINH: ' || v_GIOITINH || 
        ', LOP: ' || v_LOP || ', DIACHI: ' || v_DIACHI || ', EMAIL: ' || v_EMAIL || ', GHICHU: ' || v_GHICHU || ', SOPHIEMUON: ' || v_SOPHIEMUON);
    END LOOP;
    CLOSE c_table_data;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END DisplayTableData;

--Trigger BEFORE
CREATE OR REPLACE TRIGGER trg_before_control
BEFORE INSERT OR UPDATE OR DELETE ON tblSach
FOR EACH ROW
BEGIN
    -- Ki?m tra xem s? l??ng sách ???c m??n hi?n t?i có v??t quá s? l??ng trong kho không
    IF INSERTING OR UPDATING THEN
        IF :NEW.SOLUONG < 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'S? l??ng sách không th? âm.');
        END IF;
    END IF;
    
    -- Ki?m tra xem sách có ?ang ???c m??n không
    IF DELETING THEN
        IF :OLD.SOLUONG < :OLD.SOTRANG THEN
            RAISE_APPLICATION_ERROR(-20002, 'Sách ?ang ???c m??n, không th? xóa.');
        END IF;
    END IF;
END;
/

--Trigger AFTER
CREATE OR REPLACE TRIGGER trg_after_control
AFTER INSERT OR UPDATE OR DELETE ON tblMuon
FOR EACH ROW
DECLARE
    v_SoLuongConLai NUMBER;
BEGIN
    -- C?p nh?t s? l??ng sách còn l?i sau khi m??n ho?c tr? sách
    IF INSERTING THEN
        SELECT SOLUONG - 1 INTO v_SoLuongConLai FROM tblSach WHERE MASACH = :NEW.MASACH;
        UPDATE tblSach SET SOLUONG = v_SoLuongConLai WHERE MASACH = :NEW.MASACH;
    ELSIF DELETING THEN
        SELECT SOLUONG + 1 INTO v_SoLuongConLai FROM tblSach WHERE MASACH = :OLD.MASACH;
        UPDATE tblSach SET SOLUONG = v_SoLuongConLai WHERE MASACH = :OLD.MASACH;
    END IF;
END;
/


--Câu truy v?n t? 2 b?ng tr? lên có m?nh ?? WHERE, ORDER BY:
SELECT dg.HOTEN, s.TENSACH
FROM tblDocGia dg
JOIN tblMuon m ON dg.MADG = m.MADG
JOIN tblSach s ON m.MASACH = s.MASACH
WHERE s.NAMXB = 1995
ORDER BY dg.HOTEN;


--Câu truy v?n có AGGREGATE FUNCTION, GROUP BY, HAVING, WHERE và ORDER BY có liên k?t t? 2 b?ng tr? lên:
SELECT n.TENNV, COUNT(*) AS SoLuotMuon
FROM tblNhanVien n
JOIN tblMuon m ON n.TaiKhoan = m.SOPHIEMUON
JOIN tblSach s ON m.MASACH = s.MASACH
WHERE s.MaLV = 1
GROUP BY n.TENNV
HAVING COUNT(*) > 2
ORDER BY SoLuotMuon DESC;


--Câu truy v?n khác có AGGREGATE FUNCTION, GROUP BY, HAVING, WHERE và ORDER BY có liên k?t t? 2 b?ng tr? lên:
SELECT s.TENSACH, COUNT(*) AS SoLuongMuon
FROM tblSach s
JOIN tblMuon m ON s.MASACH = m.MASACH
JOIN tblDocGia dg ON m.MADG = dg.MADG
WHERE dg.GIOITINH = 'Nam'
GROUP BY s.TENSACH
HAVING COUNT(*) > 1
ORDER BY SoLuongMuon DESC;






--Hàm tính toán t?ng s? l??ng sách m??n c?a m?t ??c gi? d?a trên ID c?a ??c gi?:
CREATE OR REPLACE FUNCTION TotalBooksBorrowed(p_MADG IN tblDocGia.MADG%TYPE)
RETURN NUMBER
IS
    v_Total NUMBER := 0;
BEGIN
    -- Ki?m tra tính h?p l? c?a tham s? ??u vào
    IF p_MADG IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Vui lòng nh?p mã ??c gi?.');
    END IF;
    
    -- Tính t?ng s? l??ng sách m??n c?a ??c gi?
    SELECT COUNT(*)
    INTO v_Total
    FROM tblMuon
    WHERE MADG = p_MADG;

    RETURN v_Total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN -1;
END TotalBooksBorrowed;


--Hàm ki?m tra xem m?t sách c? th? có ?ang ???c m??n không d?a trên ID c?a sách:
CREATE OR REPLACE FUNCTION IsBookBorrowed(p_MASACH IN tblSach.MASACH%TYPE)
RETURN BOOLEAN
IS
    v_Count NUMBER := 0;
BEGIN
    -- Ki?m tra tính h?p l? c?a tham s? ??u vào
    IF p_MASACH IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Vui lòng nh?p mã sách.');
    END IF;
    
    -- Ki?m tra xem sách có ?ang ???c m??n không
    SELECT COUNT(*)
    INTO v_Count
    FROM tblMuon
    WHERE MASACH = p_MASACH;

    IF v_Count > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN FALSE;
END IsBookBorrowed;

-- Ví d? s? d?ng hàm TotalBooksBorrowed ?? l?y t?ng s? sách m??n c?a m?t ??c gi?
SELECT TotalBooksBorrowed(1) AS SoSachMuon
FROM dual;
-- Ví d? s? d?ng hàm IsBookBorrowed ?? ki?m tra xem m?t cu?n sách có ?ang ???c m??n không
SELECT CASE WHEN IsBookBorrowed(1) THEN '?ang ???c m??n' ELSE 'Không ???c m??n' END AS TrangThaiMuon
FROM dual;
