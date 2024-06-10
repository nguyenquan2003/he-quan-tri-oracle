using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QuanLyThuVien
{
    public partial class TaoTaiKhoan : Form
    {
        public TaoTaiKhoan()
        {
            InitializeComponent();
        }
        Class.clsDatabase cls = new QuanLyThuVien.Class.clsDatabase();
        private void TaoTaiKhoan_Load(object sender, EventArgs e)
        {
            cls.KetNoi();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            if (txtTenTK.Text.Length - 1 < 5)
                MessageBox.Show("Tên tài khoản quá ngắn");
            else
                if (txtTenTK.Text.Length - 1 > 30)
                    MessageBox.Show("Tên tài khoản quá dài");
                else
                    if (txtMatKhau.Text.Length - 1 < 5)
                        MessageBox.Show("Mật khẩu quá ngắn");
                    else
                        if (txtXNMatKhau.Text.Length - 1 > 30)
                            MessageBox.Show("Mật khẩu quá dài");
                        else
                            if (txtMatKhau.Text != txtXNMatKhau.Text)
                                MessageBox.Show("Password không trùng nhau");
                            else
                            {
                                try
                                {
                                    cls.ThucThiSQLTheoPKN("insert into tblNhanVien(TAIKHOAN,MATKHAU,QUYENHAN)values('" + txtTenTK.Text + "','" + txtMatKhau.Text + "','user')");
                                    MessageBox.Show("Tạo tài khoản thành công hãy cập nhật thông tin cho tài khoản");
                                }
                                catch { MessageBox.Show("Không thể tạo được táo khoản"); }
                            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                txtMatKhau.PasswordChar = '\0';
                txtXNMatKhau.PasswordChar = '\0';
            }
            else
            {
                txtMatKhau.PasswordChar = '*';
                txtXNMatKhau.PasswordChar = '*';
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
