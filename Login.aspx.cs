using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Melodyhub2
{
    public partial class Login : System.Web.UI.Page
    {
        String cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //code page load
        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            {
                //se reciben datos
                string nombre = txtUsuario.Text;
                string contrasena = txtPassword.Text;

                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    try
                    {
                        //consulta sql user and pswd
                        string sql = "SELECT contrasena FROM usuarios WHERE nombre=@nombre and contrasena=@contrasena";
                        conexion.Open();
                        MySqlCommand comando = new MySqlCommand(sql, conexion);
                        comando.Parameters.AddWithValue("@nombre", nombre);
                        comando.Parameters.AddWithValue("@contrasena", contrasena);

                        MySqlDataReader lector = comando.ExecuteReader();

                        if (lector.HasRows)
                        {
                            //redirect
                            Session["usuario"] = nombre;
                            Response.Redirect("Index.aspx", false);
                        }
                        else
                        {
                            //error message
                            lblEstado.Text = "Usuario o contraseña incorrectos.";
                        }
                    }
                    catch (Exception ex)
                    {
                        //error message + exepción
                        lblEstado.Text = "Error: " + ex.Message;
                    }
                }
            }
        }
    }
}