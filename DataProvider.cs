using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLySach
{
    internal class DataProvider
    {
        //private string connectString = "Data Source=MSI;Initial Catalog=db_quan_ly_ban_sach;Integrated Security=True;Trust Server Certificate=True";
        /*public DataTable execQuery(string query)
        {
            DataTable data= new DataTable();
            using (SqlConnection con = new SqlConnection(connectString))
                //using(var  con =new SqlConnection(connectString))
            {
                con.Open();
                SqlCommand cmd=new SqlCommand(query, con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(data);
                con.Close();
            }
            return data;}*/
        //private string connectString = "Data Source=MSI;Initial Catalog=db_quan_ly_ban_sach;Integrated Security=True;Trust Server Certificate=True";

        public DataTable execQuery(string query)
        {
            DataTable data = new DataTable();
            using (SqlConnection conn = new SqlConnection(@"Data Source=MSI;Initial Catalog=db_quan_ly_ban_sach;User ID=sa;Password=sa;TrustServerCertificate=True"))
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(data);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
            return data;
        }

        public int execNonQuery(string query)
        {
            int data = 0;
            using (SqlConnection conn = new SqlConnection(@"Data Source=MSI;Initial Catalog=db_quan_ly_ban_sach;User ID=sa;Password=sa;TrustServerCertificate=True"))
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    data = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
            return data;
        }

        public int execScaler(string query)
        {
            object data = 0;
            using (SqlConnection conn = new SqlConnection(@"Data Source=MSI;Initial Catalog=db_quan_ly_ban_sach;User ID=sa;Password=sa;TrustServerCertificate=True"))
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    data = cmd.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
            return Convert.ToInt32(data ?? 0); // Handle null values safely
        }
    }
}
