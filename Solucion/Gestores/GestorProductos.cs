using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Enidades;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace Gestores
{
    public class GestorProductos
    {
        public static void Insertar(Productos productos)
        {
            string conexionCadena = "server=localhost; database=pav2; user id=root; password=root";
            MySqlConnection cn = new MySqlConnection();
            //MySqlTransaction tran = null;
            try
            {
                cn.ConnectionString = conexionCadena;
                cn.Open();
                //tran = cn.BeginTransaction();
                string nroPrd = "SELECT MAX(nroProducto) FROM Productos";
                MySqlCommand cmd1 = new MySqlCommand();
                cmd1.CommandText = nroPrd;
                cmd1.Connection = cn;
                //cmd1.Transaction = tran;

                int nroProducto = Convert.ToInt32(cmd1.ExecuteScalar());

                string sql = "INSERT INTO productos (nroProducto,nombreProducto,idTalle,precioVenta,precioCompra,esAccesorio,marca,stock) ";
                sql += " values (@nroProducto,@nombreProducto,@idTalle,@precioVenta,@precioCompra,@esAccesorio,@marca,@stock)";
                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = cn;
                //cmd.Transaction = tran;


                cmd.Parameters.AddWithValue("@nroProducto", nroProducto);
                cmd.Parameters.AddWithValue("@nombreProducto", productos.nombreProducto);
                cmd.Parameters.AddWithValue("@idTalle", productos.idTalle);
                cmd.Parameters.AddWithValue("@precioVenta", productos.precioVenta);
                cmd.Parameters.AddWithValue("@precioCompra", productos.precioCompra);
                cmd.Parameters.AddWithValue("@esAccesorio", productos.esAccesorio);
                cmd.Parameters.AddWithValue("@marca", productos.marca);
                cmd.Parameters.AddWithValue("@stock", productos.stock);

                //if (provincias.FechaUltCenso.HasValue)
                //    cmd.Parameters.AddWithValue("@FechaUltCenso", provincias.FechaUltCenso.Value);
                //else
                //    cmd.Parameters.AddWithValue("@FechaUltCenso", DBNull.Value);

                //if (provincias.Poblacion.HasValue)
                //    cmd.Parameters.AddWithValue("@Poblacion", provincias.Poblacion);
                //else
                //    cmd.Parameters.AddWithValue("@Poblacion", DBNull.Value);


                cmd.ExecuteNonQuery();
                
                //tran.Commit(); //confirmo los cambios

            }
            catch (MySqlException ex)
            {
                throw new ApplicationException("Error al guardar la provincia.");
                //if (cn.State == System.Data.ConnectionState.Open)
                //    tran.Rollback(); //Vuelvo atras los cambios
            }
            finally
            {
                if (cn.State == System.Data.ConnectionState.Open)
                    cn.Close();
            }
        }

        public static void Actualizar(Productos producto)
        {
            string conexionCadena = "server=localhost; database=pav2; user id=root; password=root";
            MySqlConnection cn = new MySqlConnection();
            try
            {
                cn.ConnectionString = conexionCadena;
                cn.Open();
                
                string sql = "UPDATE productos  set nombreProducto@nombreProducto,idTalle=@idTalle,precioVenta=@precioVenta,";
                sql += " precioCompra=@precioCompra,esAccesorio=@esAccesorio,marca=@marca,stock=@stock where nroProducto=@nroProducto";
                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = cn;
                
                cmd.Parameters.AddWithValue("@nroProducto", producto.nroProducto);
                cmd.Parameters.AddWithValue("@nombreProducto", producto.nombreProducto);
                cmd.Parameters.AddWithValue("@idTalle", producto.idTalle);
                cmd.Parameters.AddWithValue("@precioVenta", producto.precioVenta);
                cmd.Parameters.AddWithValue("@precioCompra", producto.precioCompra);
                cmd.Parameters.AddWithValue("@esAccesorio", producto.esAccesorio);
                cmd.Parameters.AddWithValue("@marca", producto.marca);
                cmd.Parameters.AddWithValue("@stock", producto.stock);
                
                cmd.ExecuteNonQuery();
            }
            catch (MySqlException ex)
            {
                throw new ApplicationException("Error al guardar la provincia.");
            }
            finally
            {
                if (cn.State == System.Data.ConnectionState.Open)
                    cn.Close();
            }
        }

        public static List<Productos> ObtenerProductos()
        {
            string conexionCadena = "server=localhost; database=pav2; user id=root; password=root";
            MySqlConnection cn = new MySqlConnection();

            List<Productos> productos = new List<Productos>();
            try
            {
                cn.ConnectionString = conexionCadena;
                cn.Open();

                string sql = "select nroProducto,nombreProducto,idTalle,precioVenta,precioCompra,esAccesorio,marca,stock from productos order by nroProducto";
                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = cn;
                MySqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {

                    Productos p = new Productos();
                    p.nroProducto = (int)dr["nroProducto"];
                    p.nombreProducto = dr["nombreProducto"].ToString();
                    p.idTalle = Convert.ToInt32(dr["idTalle"]);
                    p.precioVenta = (double)dr["precioVenta"];
                    p.precioCompra = (double)dr["precioCompra"];
                    if (dr["esAccesorio"] == "0")
                        p.esAccesorio = false;
                    else
                        p.esAccesorio = true;
                    p.marca = dr["marca"].ToString();
                    p.stock = Convert.ToInt32(dr["stock"]);
                    
                    productos.Add(p);
                }
            }
            catch (MySqlException ex)
            {
                throw new ApplicationException("Error al guardar el producto.");

            }
            finally
            {
                if (cn.State == System.Data.ConnectionState.Open)
                    cn.Close();
            }
            return productos;
        }

        public static void Borrar(Productos producto)
        {
            string conexionCadena = "server=localhost; database=pav2; user id=root; password=root";
            MySqlConnection cn = new MySqlConnection();
            //MySqlTransaction tran = null;
            try
            {
                cn.ConnectionString = conexionCadena;
                cn.Open();
                //tran = cn.BeginTransaction();
                string sql = "DELETE FROM Productos where nroProducto = @nroProducto";
                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = cn;
                //cmd.Transaction = tran;
                cmd.Parameters.AddWithValue("@nroProducto", producto.nroProducto);
                cmd.ExecuteNonQuery();
                //int idProvincia = Convert.ToInt32(cmd.ExecuteScalar());

                
                //tran.Commit(); //confirmo los cambios


            }
            catch (MySqlException ex)
            {
                throw new ApplicationException("Error al guardar la provincia.");
                //if (cn.State == ConnectionState.Open)
                //    tran.Rollback(); //Vuelvo atras los cambios
            }
            finally
            {
                if (cn.State == System.Data.ConnectionState.Open)
                    cn.Close();
            }
        }

        public static List<Productos> ObtenerProducto(int nroProducto)
        {
            string conexionCadena = "server=localhost; database=pav2; user id=root; password=root";
            MySqlConnection cn = new MySqlConnection();
            List<Productos> productos = null;
            try
            {
                cn.ConnectionString = conexionCadena;
                cn.Open();

                string sql = "select nroProducto,nombreProducto,idTalle,precioVenta,precioCompra,esAccesorio,marca,stock from productos order by nroProducto where nroProducto = @nroProducto";
                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = cn;
                cmd.Parameters.AddWithValue("@nroProducto", nroProducto);
                MySqlDataReader dr = cmd.ExecuteReader();


                if (dr.Read())
                {

                    Productos p = new Productos();
                    p.nroProducto = (int)dr["nroProducto"];
                    p.nombreProducto = dr["nombreProducto"].ToString();
                    p.idTalle = Convert.ToInt32(dr["idTalle"]);
                    p.precioVenta = (double)dr["precioVenta"];
                    p.precioCompra = (double)dr["precioCompra"];
                    if (dr["esAccesorio"] == "0")
                        p.esAccesorio = false;
                    else
                        p.esAccesorio = true;
                    p.marca = dr["marca"].ToString();
                    p.stock = Convert.ToInt32(dr["stock"]);

                    productos.Add(p);
                }
            }
            catch (MySqlException ex)
            {
                throw new ApplicationException("Error al guardar la provincia.");
            }
            finally
            {
                if (cn.State == System.Data.ConnectionState.Open)
                    cn.Close();
            }
            return productos;
        }



    }
}
