using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace gpproje
{
    public partial class eklesilguncelle : Form
    {
        MySqlConnection baglanti;
        MySqlCommand komut;
        MySqlDataAdapter veria;
        public eklesilguncelle()
        {
            InitializeComponent();
        }
        void verigetir()
        {
            baglanti = new MySqlConnection("server=localhost;database=fotografci;uid=root;pwd=;");
            baglanti.Open();
            veria = new MySqlDataAdapter("SELECT * FROM foto", baglanti);
            DataTable tablo = new DataTable();
            veria.Fill(tablo);
            dataGridView1.DataSource = tablo;
            baglanti.Close();

        }

            private void button1_Click(object sender, EventArgs e)
        {
            string sorgu = "INSERT INTO foto ( fotograf_konu, fotograf_ceken, fotograf_yolu, fotograf_tarih) VALUES (@konu, @ceken, @yolu, @tarih)";
            komut = new MySqlCommand(sorgu, baglanti);
            komut.Parameters.AddWithValue("@konu", konutext.Text); // veritabanına veri ekleme 
            komut.Parameters.AddWithValue("@ceken", cekentext.Text);
            komut.Parameters.AddWithValue("@yolu", adrestext.Text);
            komut.Parameters.AddWithValue("@tarih", dateTimePicker1.Value);
            baglanti.Open();
            komut.ExecuteNonQuery(); // veri geri döndürmeme
            baglanti.Close();
            verigetir();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox1.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            konutext.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();    // datagridview deki verileri textboxların içerisinde gösterme
            cekentext.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            adrestext.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            dateTimePicker1.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string sorgu = "DELETE from foto WHERE fotograf_no=@fotono";
            komut = new MySqlCommand(sorgu, baglanti);
            komut.Parameters.AddWithValue("@fotono", Convert.ToInt32(textBox1.Text));
            baglanti.Open();
            komut.ExecuteNonQuery();
            baglanti.Close();
            verigetir();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string sorgu = "UPDATE foto SET  fotograf_konu=@konu, fotograf_ceken=@ceken, fotograf_yolu=@yolu, fotograf_tarih=@tarih WHERE fotograf_no=@fotono ";
            komut = new MySqlCommand(sorgu, baglanti);
            komut.Parameters.AddWithValue("@fotono", Convert.ToInt32(textBox1.Text));
            komut.Parameters.AddWithValue("@konu", konutext.Text);
            komut.Parameters.AddWithValue("@ceken", cekentext.Text);
            komut.Parameters.AddWithValue("@yolu", adrestext.Text);
            komut.Parameters.AddWithValue("@tarih", dateTimePicker1.Value);
            baglanti.Open();
            komut.ExecuteNonQuery();
            baglanti.Close();
            verigetir();
        }

        private void eklesilguncelle_Load(object sender, EventArgs e)
        {  
            verigetir();  
        }

        private void button4_Click(object sender, EventArgs e) //görsel ekleme
        {
            openFileDialog1.ShowDialog();  
            pictureBox1.ImageLocation = openFileDialog1.FileName;
            adrestext.Text = openFileDialog1.FileName;
           
        }
    }
}
