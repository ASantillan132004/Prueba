using Datos;
using MySql.Data.MySqlClient;
using System.Data;

namespace Prueba
{
    public partial class Form1 : Form
    {
        private Datos.conexion mconexion;
        public Form1()
        {
            InitializeComponent();
            mconexion = new Datos.conexion();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string result = "";
            MySqlDataReader MySqlDataReader = null;
            string consulta = "select * from categoria";
            if (mconexion.GetConexion() != null)
            {


                MessageBox.Show("conexion exitosa");
            }
            else
            {
                MessageBox.Show("Error al conexion");
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string consulta = "select * from categoria";
            MySqlDataAdapter adaptador = new MySqlDataAdapter(consulta, mconexion.GetConexion());
            DataTable dt = new DataTable();
            adaptador.Fill(dt);
            dataGridView1.DataSource = dt;

        }
        private void button2_Click_1(object sender, EventArgs e)
        {

            MySqlCommand comando = new MySqlCommand();
            comando.Connection = mconexion.GetConexion();
            comando.CommandText = ("insert into categoria values(" + textId.Text + ",'" + textNombre.Text + "','" + textdes.Text + "');");
            comando.ExecuteNonQuery();
            textId.Text = "";
            textdes.Text = "";
            textNombre.Text = "";

            string consulta = "select * from categoria";
            MySqlDataAdapter adaptador = new MySqlDataAdapter(consulta, mconexion.GetConexion());
            DataTable dt = new DataTable();
            adaptador.Fill(dt);
            dataGridView1.DataSource = dt;

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string cadena = "delete from categoria where IdCategoria=" + dataGridView1.CurrentRow.Cells[0].Value.ToString() + "";
            MySqlCommand comando = new MySqlCommand(cadena, mconexion.GetConexion());
            comando.ExecuteNonQuery();
            MessageBox.Show("Eliminado");

            string consulta = "select * from categoria";
            MySqlDataAdapter adaptador = new MySqlDataAdapter(consulta, mconexion.GetConexion());
            DataTable dt = new DataTable();
            adaptador.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void textId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}