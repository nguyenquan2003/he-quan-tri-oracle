﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QuanLyThuVien
{
    public partial class ttLinhVuc : Form
    {
        public ttLinhVuc()
        {
            InitializeComponent();
        }
        Class.clsDatabase cls = new QuanLyThuVien.Class.clsDatabase();
        private void ttLinhVuc_Load(object sender, EventArgs e)
        {
            string sql = "Select * from tblTacGia";
            DataTable dt = cls.getTable(sql);
            dataGridView1.DataSource = dt;
            //cls.LoadData2DataGridView(dataGridView1,"Select *from tblLinhVuc");
        }
    }
}
