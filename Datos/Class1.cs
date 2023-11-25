using MySql.Data.MySqlClient;

namespace Datos
{
    public class conexion
    {
        private MySqlConnection conexcion;
        private string server = "localhost";
        private string database = "ventadevideojuegos";
        private string user = "root";
        private string password = "";
        private string cadenaConexcion;

        public conexion() 
        {
            cadenaConexcion = "Database= " + database +
                ";DataSource= " + server +
                ";user Id= " + user +
                ";Password= " + password;
        }
        public MySqlConnection GetConexion() 
        {
            if (conexcion == null)
            {
                conexcion = new MySqlConnection(cadenaConexcion);
                conexcion.Open();
            }
                 return conexcion;

        }
    }

}