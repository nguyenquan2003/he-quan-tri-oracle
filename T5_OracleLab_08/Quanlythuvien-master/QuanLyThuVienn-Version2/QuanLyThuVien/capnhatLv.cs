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
    public partial class capnhatLv : Form
    {
        public capnhatLv()
        {
            InitializeComponent();
        }
        Class.clsDatabase cls = new Class.clsDatabase();
        private void capnhatLv_Load(object sender, EventArgs e)
        {
            cls.LoadData2DataGridView(dataGridView1, "select *from tblLinhVuc");            
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            string strInsert = "Insert Into tblLinhVuc(MaLv,TenLv,GhiChu) values ('" + txtMaLinhVuc.Text + "','" + txtTenLinhVuc.Text + "','" + richTxtGhiChu.Text + "')";
            cls.ThucThiSQLTheoPKN(strInsert);
            cls.LoadData2DataGridView(dataGridView1, "select *from tblLinhVuc");
            MessageBox.Show("Thêm thành công");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa không?(Y/N)", "Delete", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                try
                {
                    string strDelete = "Delete from tblLinhVuc where MaLv='" + txtMaLinhVuc.Text + "'";
                    cls.ThucThiSQLTheoKetNoi(strDelete);
                    cls.LoadData2DataGridView(dataGridView1, "select *from tblLinhVuc");
                }
                catch { MessageBox.Show("Phải xóa những thông tin liên quan đến lĩnh vực này trước"); };

            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                txtMaLinhVuc.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
                txtTenLinhVuc.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                richTxtGhiChu.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            }
            catch { };
        }
        int dem = 0;
        string MALV;
        private void button2_Click(object sender, EventArgs e)
        {
            if (dem == 0)
            {
                MALV = txtMaLinhVuc.Text;
                dem = 1;
                button1.Enabled = false;
                button3.Enabled = false;
            }
            else
            {
                try
                {
                    string strUpdate = "Update tblLinhVuc set Malv='" + txtMaLinhVuc.Text + "',TenLv='" + txtTenLinhVuc.Text + "',GhiChu='" + richTxtGhiChu.Text + "' where Malv='" + MALV + "'";
                    cls.ThucThiSQLTheoPKN(strUpdate);
                    cls.LoadData2DataGridView(dataGridView1, "select *from tblLinhVuc");
                    button1.Enabled = true;
                    button3.Enabled = true;
                    MessageBox.Show("Sửa thành công");
                    dem = 0;
                }
                catch { MessageBox.Show("Không thể sửa !!!"); };              
            }
        }
    }
}
