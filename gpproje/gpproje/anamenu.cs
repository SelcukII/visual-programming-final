using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.Crmf;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;
using static System.Net.WebRequestMethods;

namespace gpproje
{
    public partial class anamenu : Form
    {
        MySqlConnection baglanti;
        MySqlDataAdapter veria;
        public anamenu()
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
        // https://openweathermap.org sitesinden kayıt olunarak bir alt satırdaki api kodu alınır
        private const string api = "09f32bdf91dbbfcc8b8ab80b038b04bc";
        // hava durumu bilgileri bir alt satırdaki web adresinden çekilecektir
        private const string connection = "http://api.openweathermap.org/data/2.5/weather?q=Turkey,Antalya&mode=xml&units=metric&APPID=" + api;

        private void anamenu_Load(object sender, EventArgs e)
        {
            verigetir();
            XDocument Hava = XDocument.Load(connection);
            var Sicaklik = Hava.Descendants("temperature").ElementAt(0).Attribute("value").Value;
            label1.Text = Sicaklik.ToString() + "°";

            //aşağıda yazılan kod satırları için bu siteden faydalanıyoruz.
            var Durum = Hava.Descendants("clouds").ElementAt(0).Attribute("name").Value;
            label2.Text = Durum.ToString();

        }


        private void button1_Click(object sender, EventArgs e)
        {
            verigetir();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            eklesilguncelle fototografekle = new eklesilguncelle();
            fototografekle.Show();  // eklesilguncelle göster diyoruz
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            

        }
    }
}

