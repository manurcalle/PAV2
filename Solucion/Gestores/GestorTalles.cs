using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using MySql.Data.MySqlClient;


namespace Gestores
{
    public class GestorTalles
    {

        public static List<Talles> ObtenerTalles()
        {
            string conexionCadena = "server=localhost; database=pav2; user id=root; password=root";
            MySqlConnection cn = new MySqlConnection();

            List<Talles> talles = new List<Talles>();
            try
            {
                cn.ConnectionString = conexionCadena;
                cn.Open();

                string sql = "select nroTalle,nombreTalle from talles order by nroTalle";
                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = cn;
                MySqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {

                    Talles p = new Talles();
                    p.nroTalle = (int)dr["nroTalle"];
                    p.nombreTalle = dr["nombreTalle"].ToString();
                    talles.Add(p);
                }
            }
            catch (MySqlException ex)
            {
                throw new ApplicationException("Error al guardar el talle.");

            }
            finally
            {
                if (cn.State == System.Data.ConnectionState.Open)
                    cn.Close();
            }
            return talles;
        }
    }

}
