using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySach
{
    public partial class Form1 : Form
    {
        private DataProvider dataProvider = new DataProvider();
        private int maSachLoaiSach;
        private int maSachSach;
        private int maSachLoaiSachLoai;
        public Form1()
        {
            InitializeComponent();
            init();   //khoi tao 
        }
        private void init()
        {
            initSach();
            initLoaiSach();
        }
        private void initSach()
        {
            loadDgSach();
            loadcbSachLoaiSach();
        }
        private void loadDgSach()
        {
            DataTable dt = new DataTable();

            StringBuilder query = new StringBuilder("SELECT ma_sach as [Mã Sách] ");  //FROM tbl_sach
            query.Append(",ten_sach as [Tên Sách]");
            query.Append(",ten_loai_sach as [Loại Sách]");
            query.Append(",tac_gia as [Tác Giả]");
            query.Append(",so_luong as [Số Lượng]");
            query.Append(",gia_ban as [Giá Bán]");
            query.Append(" FROM tbl_sach,tbl_loai_sach");
            query.Append(" WHERE tbl_sach.ma_loai_sach=tbl_loai_sach.ma_loai_sach;");

            dt = dataProvider.execQuery(query.ToString());

            dgSach.DataSource = dt;
        }
        private void loadcbSachLoaiSach()
        {
            DataTable dt = new DataTable();
            dt = dataProvider.execQuery("SELECT * FROM tbl_loai_sach");
            cbSachLoaiSach.DisplayMember = "ten_loai_sach";
            cbSachLoaiSach.ValueMember = "ma_loai_sach";
            cbSachLoaiSach.DataSource = dt;
        }


        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowId = e.RowIndex;
            DataGridViewRow row = dgSach.Rows[rowId];
            txtSachTenSach.Text = row.Cells[1].Value.ToString();

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dgSach_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowId = e.RowIndex;
            if (rowId < 0) rowId = 0;
            if (rowId == dgSach.RowCount - 1) rowId = rowId - 1;
            //MessageBox.Show(dgSach.RowCount.ToString());
            //DataGridViewRow row = dgSach.Rows[rowId];

            DataGridViewRow row = dgSach.Rows[rowId];
            maSachSach = (int)row.Cells[0].Value;
            txtSachTenSach.Text = row.Cells[1].Value.ToString();
            cbSachLoaiSach.Text = row.Cells[2].Value.ToString();
            txtSachTacGia.Text = row.Cells[3].Value.ToString();
            numSachSoLuong.Value = (int)row.Cells[4].Value;
            numSachGiaBan.Value = Convert.ToInt32(row.Cells[5].Value);

            maSachLoaiSach = (int)dataProvider.execScaler("SELECT ma_loai_sach FROM tbl_loai_sach WHERE ten_loai_sach = N'" + cbSachLoaiSach.Text + "'");
        }

        private void btnSachThem_Click(object sender, EventArgs e)
        {
            StringBuilder query = new StringBuilder("EXEC proc_them_sach");
            query.Append(" @tenSach = N'" + txtSachTenSach.Text + "'");
            query.Append(",@maLoaiSach= " + maSachLoaiSach);
            query.Append(",@tacGia= N'" + txtSachTacGia.Text + "'");
            query.Append(",@soLuong= " + numSachSoLuong.Value);
            query.Append(",@giaBan= " + numSachGiaBan.Value);


            int result = dataProvider.execNonQuery(query.ToString());
            if (result > 0)
            {
                loadDgSach();
                MessageBox.Show("Thêm sách thành công! ", "Thành công", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            else
            {
                MessageBox.Show("Thêm sách không thành công! ", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSachSua_Click(object sender, EventArgs e)
        {
            StringBuilder query = new StringBuilder("EXEC proc_them_sach");
            query.Append(" @maSach= " + maSachSach);
            query.Append(" @tenSach = N'" + txtSachTenSach.Text + "'");
            query.Append(",@maLoaiSach= " + maSachLoaiSach);
            query.Append(",@tacGia= N'" + txtSachTacGia.Text + "'");
            query.Append(",@soLuong= " + numSachSoLuong.Value);
            query.Append(",@giaBan= " + numSachGiaBan.Value);


            int result = dataProvider.execNonQuery(query.ToString());
            if (result > 0)
            {
                loadDgSach();
                MessageBox.Show("Cập nhật sách thành công! ", "Thành công", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            else
            {
                MessageBox.Show("Cập nhật sách không thành công! ", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSachXoa_Click(object sender, EventArgs e)
        {
            DialogResult check = MessageBox.Show("Bạn chắc chắn muốn xóa sách" + txtSachTenSach.Text + "?", "Cảnh báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
            if (check == DialogResult.Yes)
            {
                string query = "DELETE FROM tbl_sach WHERE ma_sach = " + maSachSach;
                int result = dataProvider.execNonQuery(query.ToString());
                if (result > 0)
                {
                    loadDgSach();
                    MessageBox.Show("Xóa sách thành công! ", "Thành công", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                }
                else
                {
                    MessageBox.Show("Xóa sách không thành công! ", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void cbSachLoaiSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboBox comboBox = sender as ComboBox;
            maSachLoaiSach = (int)comboBox.SelectedValue;

        }
        private void initLoaiSach()
        {
            loadDgLoaiSach();
        }
        private void loadDgLoaiSach()
        {
            DataTable dt = new DataTable();

            StringBuilder query = new StringBuilder("SELECT ma_loai_sach as [Mã Loại Sách]");
            query.Append(",ten_loai_sach as [Tên Loại Sách]");
            query.Append(" FROM tbl_loai_sach");

            dt = dataProvider.execQuery(query.ToString());

            dgLoaiSach.DataSource = dt;
        }

        private void dgLoaiSach_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowId = e.RowIndex;
            if (rowId < 0) rowId = 0;
            if (rowId == dgLoaiSach.RowCount - 1) rowId = rowId - 1;

            DataGridViewRow row = dgLoaiSach.Rows[rowId];
            maSachLoaiSachLoai = (int)row.Cells[0].Value;
            txtLoaiSachTenLoaiSach.Text = row.Cells[1].Value.ToString();
        }
    }
}
