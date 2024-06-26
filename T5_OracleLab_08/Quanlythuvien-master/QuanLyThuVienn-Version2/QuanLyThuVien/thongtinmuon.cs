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
    public partial class thongtinmuon : Form
    {
        public thongtinmuon()
        {
            InitializeComponent();
            if (dataGridView1 == null) throw new ArgumentNullException(nameof(dataGridView1));
            if (txtMADG == null) throw new ArgumentNullException(nameof(txtMADG));
            if (txtMASACH == null) throw new ArgumentNullException(nameof(txtMASACH));
            if (txtSOPHIEU == null) throw new ArgumentNullException(nameof(txtSOPHIEU));
            if (mktNGAYMUON == null) throw new ArgumentNullException(nameof(mktNGAYMUON));
            if (mktNGAYTRA == null) throw new ArgumentNullException(nameof(mktNGAYTRA));
            if (cboXACNHAN == null) throw new ArgumentNullException(nameof(cboXACNHAN));
            if (rtbGHICHU == null) throw new ArgumentNullException(nameof(rtbGHICHU));
        }

        Class.clsDatabase cls = new QuanLyThuVien.Class.clsDatabase();

        private void muon_Load(object sender, EventArgs e)
        {
            if (cls != null)
            {
                cls.LoadData2DataGridView(dataGridView1, "select *from tblMuon");
            }
            else
            {
                MessageBox.Show("Database class not initialized.");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string strInsert = "Insert Into tblMuon(MADG,MASACH,SOPHIEUMUON,NGAYMUON,NGAYTRA,XACNHANTRA,GHICHU) values ('" + txtMADG.Text + "','" + txtMASACH.Text + "','" + txtSOPHIEU.Text + "','" + mktNGAYMUON.Text + "','" + mktNGAYTRA.Text + "','" + cboXACNHAN.Text + "','" + rtbGHICHU.Text + "')";
                cls.ThucThiSQLTheoPKN(strInsert);
                cls.LoadData2DataGridView(dataGridView1, "select *from tblMuon");
                MessageBox.Show("Thêm thành công");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa không?(Y/N)", "Delete", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                try
                {
                    string strDelete = "Delete from tblMuon where MADG='" + txtMADG.Text + "'";
                    cls.ThucThiSQLTheoKetNoi(strDelete);
                    cls.LoadData2DataGridView(dataGridView1, "select *from tblMuon");
                    MessageBox.Show("Xóa thành công !!!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (dataGridView1.Rows[e.RowIndex].Cells[0].Value != null)
                {
                    txtMADG.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
                    txtMASACH.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                    txtSOPHIEU.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                    mktNGAYMUON.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                    mktNGAYTRA.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
                    cboXACNHAN.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
                    rtbGHICHU.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        int dem = 0;
        string madg;

        private void button2_Click(object sender, EventArgs e)
        {
            if (dem == 0)
            {
                madg = txtMADG.Text;
                dem = 1;
                button1.Enabled = false;
                button3.Enabled = false;
            }
            else
            {
                try
                {
                    string strUpdate = "Update tblMuon set MADG='" + txtMADG.Text + "',MASACH='" + txtMASACH.Text + "',SOPHIEUMUON='" + txtSOPHIEU.Text + "',NGAYMUON='" + mktNGAYMUON.Text + "',NGAYTRA='" + mktNGAYTRA.Text + "',XACNHANTRA='" + cboXACNHAN.Text + "',GHICHU='" + rtbGHICHU.Text + "' where MADG='" + madg + "'";
                    cls.ThucThiSQLTheoPKN(strUpdate);
                    cls.LoadData2DataGridView(dataGridView1, "select *from tblMuon");
                    button1.Enabled = true;
                    button3.Enabled = true;
                    MessageBox.Show("Sửa thành công");
                    dem = 0;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {
            // No implementation needed
        }

        //private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    cls.LoadData2Label(label9, "select count(*)from tblMuon where MASACH='" + comboBox1.Text + "'");
        //}
    }
}
