using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using TpRestaurante.Models;

namespace TpRestaurante.Models
{
    public class Consultas
    {
        //CONEXION
        //DESKTOP-1MDA051\SQLEXPRESS
        public static SqlConnection Conectar()
        {
            string ConnectionString = @"Server=DESKTOP-1MDA051\SQLEXPRESS;Database=Restorant BD;Trusted_Connection=True;";
            SqlConnection Conn = new SqlConnection(ConnectionString);
            Conn.Open();
            return Conn;
        }
        public static void Desconectar(SqlConnection conexion)
        {
            conexion.Close();
        }

        //SUCURSALES
        public List<Sucursales> Sucursales()
        {
            Sucursales Dat = new Sucursales();
            List<Sucursales> ListaSucu = new List<Sucursales>();
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "TraerSucursales";
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                Dat.IdSucursal = lector["IdSucursal"].ToString();
                Dat.Imagen = lector["Imagen"].ToString();
                ListaSucu.Add(Dat);
                Dat = new Sucursales();
            }
            Desconectar(Conexion);
            return ListaSucu;
        }
        public Sucursales SucursalCompleta(string IdSucursal)
        {
            Sucursales Dat = new Sucursales();

            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "SucursalCompleta";
            consulta.Parameters.AddWithValue("@pIdSucursal", IdSucursal);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                Dat.IdSucursal = lector["IdSucursal"].ToString();
                Dat.Mapa = lector["Mapa"].ToString();
                Dat.Imagen = lector["Imagen"].ToString();
                Dat.Domicilio = lector["Domicilio"].ToString();
                Dat.Telefono = lector["Telefono"].ToString();
            }
            Desconectar(Conexion);
            return Dat;
        }
        public List<Comentario> TraerComentarios(string id)
        {
            Comentario Dat = new Models.Comentario();
            List<Comentario> Lista = new List<Models.Comentario>();
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "TraerComentarios";
            consulta.Parameters.AddWithValue("@pId", id);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                Dat.Nom = lector["NombreComenta"].ToString();
                Dat.calificacion = lector["Calificacion"].ToString();
                Dat.com = lector["TextoComentario"].ToString();
                Lista.Add(Dat);
                Dat = new Comentario();
            }
            Desconectar(Conexion);
            return Lista;
        }
        public void Comentario(Comentario x)
        {
            Sucursales Dat = new Sucursales();
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "AgregarComentario";
            consulta.Parameters.AddWithValue("@pIdSucursal", x.idsucursal);
            consulta.Parameters.AddWithValue("@pNombreComenta", x.Nom);
            consulta.Parameters.AddWithValue("@pCalificacion", x.calificacion);
            consulta.Parameters.AddWithValue("@pTextoComentario", x.com);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.ExecuteNonQuery();
            Desconectar(Conexion);
        }

        //MENU
        public List<Menu> Menu()
        {
            Menu Dat = new Menu();
            List<Menu> ListaSucu = new List<Menu>();
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "TraerMenu";
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                Dat.Nombre = lector["Nombre"].ToString();
                Dat.Imagen = lector["Imagen"].ToString();
                Dat.IdMenu = lector["IdMenu"].ToString();
                Dat.Precio = lector["Precio"].ToString();
                ListaSucu.Add(Dat);
                Dat = new Menu();
            }
            Desconectar(Conexion);
            return ListaSucu;
        }

        //LOGIN
        public bool Login(string Usuario, string contraseña, ref string Id)
        {
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "Login";
            consulta.Parameters.AddWithValue("@pUsuario", Usuario);
            consulta.Parameters.AddWithValue("@pContraseña", contraseña);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                Id = lector["IdUsuario"].ToString();
                Desconectar(Conexion);
                return true;
            }
            Desconectar(Conexion);
            return false;
        }
        public void UltimaConexion(string id)
        {
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "UltimaConexion";
            consulta.Parameters.AddWithValue("@pID", id);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.ExecuteNonQuery();
        }


        // ADMINISTRAR PANEL 
        public List<Comentario> ComentariosNoAprobados()
        {
            List<Comentario> Lista = new List<Models.Comentario>();
            Comentario Dat = new Comentario();
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "ComentariosNoAprobados";
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                Dat.idcomentario = lector["IdComentario"].ToString();
                Dat.Nom = lector["NombreComenta"].ToString();
                Dat.calificacion = lector["Calificacion"].ToString();
                Dat.com = lector["TextoComentario"].ToString();
                Lista.Add(Dat);
                Dat = new Comentario();
            }
            Desconectar(Conexion);
            return Lista;
        }
        public void AprobarComentario(string id, bool aprobado)
        {
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "AprobarComentario";
            consulta.Parameters.AddWithValue("@pIdComentario", id);
            consulta.Parameters.AddWithValue("@pAprobado", aprobado);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.ExecuteNonQuery();
            Desconectar(Conexion);
        }
        public void EliminarComentario(string id)
        {
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "EliminarComentario";
            consulta.Parameters.AddWithValue("@pId", id);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.ExecuteNonQuery();
            Desconectar(Conexion);
        }
        public void ModSucursales(Sucursales x)
        {
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "ModificarSucursal";
            consulta.Parameters.AddWithValue("@pId", x.IdSucursal);
            consulta.Parameters.AddWithValue("@pMapa", x.Mapa);
            consulta.Parameters.AddWithValue("@pImagen", x.Imagen);
            consulta.Parameters.AddWithValue("@pTelefono", x.Telefono);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.ExecuteNonQuery();
            Desconectar(Conexion);
        }
        public void EliminarSucursal(string id)
        {
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "EliminarSucursal";
            consulta.Parameters.AddWithValue("@pId", id);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.ExecuteNonQuery();
            Desconectar(Conexion);
        }
        public void EliminarMenu(string id)
        {
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "EliminarMenu";
            consulta.Parameters.AddWithValue("@pId", id);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.ExecuteNonQuery();
            Desconectar(Conexion);
        }
        public Menu MenuCompleto(string id)
        {
            Menu Dat = new Menu();
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "MenuCompleto";
            consulta.Parameters.AddWithValue("@pId", id);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                Dat.Nombre = lector["Nombre"].ToString();
                Dat.Imagen = lector["Imagen"].ToString();
                Dat.IdMenu = lector["IdMenu"].ToString();
                Dat.Precio = lector["Precio"].ToString();
            }
            Desconectar(Conexion);
            return Dat;
        }
        public void ModMenu(Menu x)
        {
            SqlConnection Conexion = Conectar();
            SqlCommand consulta = Conexion.CreateCommand();
            consulta.CommandText = "ModificarMenu";
            consulta.Parameters.AddWithValue("@pId", x.IdMenu);
            consulta.Parameters.AddWithValue("@pNombre", x.Nombre);
            consulta.Parameters.AddWithValue("@pImagen", x.Imagen);
            consulta.Parameters.AddWithValue("@pPrecio", x.Precio);
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.ExecuteNonQuery();
            Desconectar(Conexion);
        }
    }
}