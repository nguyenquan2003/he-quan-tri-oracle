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
    public partial class ttTacgia : Form
    {
        public ttTacgia()
        {
            InitializeComponent();
        }
        Class.clsDatabase cls = new QuanLyThuVien.Class.clsDatabase();
        private void ttTacgia_Load(object sender, EventArgs e)
        {
            string sql = "Select * from tblTacGia";
            DataTable dt = cls.getTable(sql);
            dataGridView1.DataSource = dt;
            //cls.LoadData2DataGridView(dataGridView1,"Select * from tblTacGia");
        }
    }
}
