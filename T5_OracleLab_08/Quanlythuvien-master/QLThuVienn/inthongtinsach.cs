using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLThuVien
{
    public partial class inthongtinsach : Form
    {
        public inthongtinsach()
        {
            InitializeComponent();
        }

        private void reportDocument1_InitReport(object sender, EventArgs e)

        {

        }

        private void crystalReportViewer1_Load(object sender, EventArgs e)
        {
            rpmuonsach a = new rpmuonsach();
            crystalReportViewer1.ReportSource = a;
        }
    }
}
