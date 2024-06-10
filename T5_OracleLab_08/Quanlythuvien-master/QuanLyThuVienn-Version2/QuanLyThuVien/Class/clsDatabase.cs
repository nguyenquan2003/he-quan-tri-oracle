using System;
using System.Data;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace QuanLyThuVien.Class
{
    class clsDatabase
    {
        //DBA PRIVILEGE = SYSDBA; TNS_ADMIN=C:\Users\admin\Oracle\network\admin;USER ID = SYS; DATA SOURCE = localhost:1521/orcl;PERSIST SECURITY INFO=True
        public static string strConnect = "User Id=SYS;Password=1234567890;Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SID=orcl)));DBA Privilege=SYSDBA;";
        OracleConnection oracleCon;
        OracleCommand oracleCom;
        OracleDataReader oracleRea;
        OracleDataAdapter oracleAdap;
        DataSet ds = new DataSet();
        DataTable dt = new DataTable("DB");

        public void KetNoi()
        {
            oracleCon = new OracleConnection(strConnect);
            if (oracleCon.State == ConnectionState.Closed)
            {
                oracleCon.Open();
            }
        }

        public DataTable getTable(string sql)
        {
            OracleDataAdapter da = new OracleDataAdapter(sql, strConnect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0];
        }

        private void NgatKetNoi()
        {
            if (oracleCon.State == ConnectionState.Open)
            {
                oracleCon.Close();
            }
        }

        public void ThucThiSQLTheoKetNoi(string strSql)
        {
            KetNoi();
            oracleCom = new OracleCommand(strSql, oracleCon);
            oracleCom.ExecuteNonQuery();
            NgatKetNoi();
        }

        public void ThucThiSQLTheoPKN(string strSql)
        {
            ds.Clear();
            oracleAdap = new OracleDataAdapter(strSql, strConnect);
            oracleAdap.Fill(ds, "DB");
        }

        public void LoadData2Combobox(ComboBox cb, string strSelect)
        {
            cb.Items.Clear();
            KetNoi();
            oracleCom = new OracleCommand(strSelect, oracleCon);
            oracleRea = oracleCom.ExecuteReader();
            while (oracleRea.Read())
            {
                cb.Items.Add(oracleRea[0].ToString());
            }
            NgatKetNoi();
        }

        public void LoadData2Label(Label lb, string strSelect)
        {
            lb.Text = "";
            KetNoi();
            oracleCom = new OracleCommand(strSelect, oracleCon);
            oracleRea = oracleCom.ExecuteReader();
            while (oracleRea.Read())
            {
                lb.Text = oracleRea[0].ToString();
            }
            NgatKetNoi();
        }

        public void LoadData2DataGridView(DataGridView dg, string strSelect)
        {
            try
            {
                dt.Clear();
                KetNoi();
                oracleAdap = new OracleDataAdapter(strSelect, oracleCon);
                oracleAdap.Fill(dt);
                dg.DataSource = dt;
                NgatKetNoi();
            }
            catch (OracleException ex)
            {
                MessageBox.Show($"OracleException: {ex.Message}", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Exception: {ex.Message}", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public void LoadData1Datagirdview(DataGridView DG, string sql, string Bang)
        {
            // Add your implementation here
        }
    }
}

