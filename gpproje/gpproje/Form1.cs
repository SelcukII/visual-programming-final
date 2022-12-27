using MySql.Data.MySqlClient;
using System.Data;

namespace gpproje
{
    public partial class Form1 : Form
    {
        MySqlConnection baglanti;
        MySqlDataAdapter veria;
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            baglanti = new MySqlConnection("server=localhost;database=fotografci;uid=root;pwd=;");
            baglanti.Open();
            veria = new MySqlDataAdapter("Select count(*) from admin where kulladi='"+kadi.Text+"' and sifre='"+sifre.Text+"'",baglanti);
            DataTable dt = new DataTable();
            veria.Fill(dt);

            if (dt.Rows[0][0].ToString()=="1")
            {
                this.Hide();
                anamenu main = new anamenu();
                main.Show();
            }
            else {
                MessageBox.Show("Kullanýcý adý yada þifre hatalý lütfen bilgileri kontrol ediniz!");
            }
        }
    }
}