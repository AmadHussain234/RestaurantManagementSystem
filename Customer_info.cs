using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Restaurant_Managment_System
{
    public partial class Customer_info : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-G6R4S5L;Initial Catalog=Restaurant_Management_System;Integrated Security=True");
        SqlDataAdapter da;
        public Customer_info()
        {
            InitializeComponent();
            da = new SqlDataAdapter("SELECT ISNULL(MAX(CAST(customerID AS INT)),0) + 1 FROM Customers", con);
            DataTable dta = new DataTable();
            da.Fill(dta);
            textBox1.Text = dta.Rows[0][0].ToString();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
       // SqlDataAdapter da;

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            
            
            SqlCommand cmd = new SqlCommand("INSERT INTO Customers VALUES('" + textBox1.Text + "','" + textBox2.Text+"','"+textBox3.Text+"','"+textBox4.Text+ "','" + textBox5.Text + "')",con);
            
            cmd.ExecuteNonQuery();

            MessageBox.Show("insert data succesfully");

            con.Close();
                 
                }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();


            SqlCommand cmd = new SqlCommand("DELETE Customers where customerID='" + textBox1.Text + "'", con);

            cmd.ExecuteNonQuery();

            MessageBox.Show("deleted data succesfully");

            con.Close();

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }
    }
}
