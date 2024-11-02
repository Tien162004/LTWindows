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
    public partial class FormChiTietPhieuNhap : Form
    {
        DataProvider dataProvider=new DataProvider();
        private int maSach;
        private int maPhieuNhap;
        private int maChiTietPhieuNhap;
        public FormChiTietPhieuNhap(int maPhieuNhap)
        {
            InitializeComponent();
            this.maPhieuNhap = maPhieuNhap;
            init();
        }
        private void init()
        {
            loadcbSach();
            title.Text = "Chi Tiết Phiếu Nhập" + maPhieuNhap;
            loadDgPhieuNhap();
            //loadTongTien();
        }
        private void loadDgPhieuNhap()
        {
            DataTable dt = new DataTable();

            StringBuilder query = new StringBuilder("SELECT tbl_sach.ten_sach as [Tên Sách] ");  //FROM tbl_sach
            query.Append(",tbl_chi_tiet_phieu_nhap.so_luong as [Số Lượng]");
            query.Append(",tbl_chi_tiet_phieu_nhap.gia_nhap as [Giá Nhập]");
            query.Append(" FROM tbl_sach,tbl_chi_tiet_phieu_nhap");
            query.Append(" WHERE tbl_sach.ma_sach=tbl_chi_tiet_phieu_nhap.ma_sach;");

            dt = dataProvider.execQuery(query.ToString());

            dgPhieuNhap.DataSource = dt;
        }
        private void loadcbSach()
        {
            DataTable dt = new DataTable();

            dt = dataProvider.execQuery("SELECT * FROM tbl_sach");
            cbSach.DisplayMember = "ten_sach";
            cbSach.ValueMember = "ma_sach";

            cbSach.DataSource = dt;
        }
        //private void loadTongTien()
        //{
        //    float tongTien = (float)dataProvider.execScaler("SELECT SUM(so_luong * gia_nhap)from tbl_chi_tiet_phieu_nhap WHERE ma_phieu_nhap = " + maChiTietPhieuNhap);
        //    txtTongTien.Text = "Tổng Tiền " + tongTien;
        //}
        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void FormChiTietPhieuNhap_Load(object sender, EventArgs e)
        {

        }

        private void cbSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboBox comboBox = sender as ComboBox;
            maSach = (int)comboBox.SelectedValue;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            StringBuilder query = new StringBuilder("EXEC proc_them_chi_tiet_phieu_nhap");
            query.Append(" @maPhieuNhap = " + maPhieuNhap);
            query.Append(", @maSach = " + maSach);
            query.Append(", @soLuong = " + numSoLuongSach.Value);
            query.Append(", @giaNhap = " + numGiaNhapSach.Value);

            int result = dataProvider.execNonQuery(query.ToString());
            if (result > 0)
            {
                loadDgPhieuNhap();
                MessageBox.Show("Thêm sách vào phiếu nhập thành công!", "Thành công", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            else
            {
                MessageBox.Show("Thêm sách vào phiếu nhập không thành công!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {

        }
    }
}
