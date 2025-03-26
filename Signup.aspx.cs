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
    public partial class SignUp : System.Web.UI.Page
    {
        // Conexión a la base de datos desde la configuración
        string cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Método de carga de página
            if (!IsPostBack)
            {
                // Código adicional si es necesario al cargar la página
            }
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            // Validar que todos los campos estén llenos y los términos estén aceptados
            if (Page.IsValid && chkTerminos.Checked)
            {
                // Obtener datos del formulario
                string nombreCompleto = txtNombreCompleto.Text.Trim();
                string correo = txtCorreo.Text.Trim();
                string contrasena = txtContrasena.Text;

                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    try
                    {
                        conexion.Open();

                        // Verificar si el correo ya existe
                        string sqlVerificar = "SELECT COUNT(*) FROM usuarios WHERE correo = @correo";
                        using (MySqlCommand cmdVerificar = new MySqlCommand(sqlVerificar, conexion))
                        {
                            cmdVerificar.Parameters.AddWithValue("@correo", correo);
                            int existeCorreo = Convert.ToInt32(cmdVerificar.ExecuteScalar());

                            if (existeCorreo > 0)
                            {
                                lblEstado.Text = "El correo electrónico ya está registrado.";
                                return;
                            }
                        }

                        // Insertar nuevo usuario
                        string sqlInsertar = @"
                            INSERT INTO usuarios (nombre, correo, contrasena) 
                            VALUES (@nombre, @correo, @contrasena);
                            SELECT LAST_INSERT_ID();";

                        using (MySqlCommand cmdInsertar = new MySqlCommand(sqlInsertar, conexion))
                        {
                            cmdInsertar.Parameters.AddWithValue("@nombre", nombreCompleto);
                            cmdInsertar.Parameters.AddWithValue("@correo", correo);
                            cmdInsertar.Parameters.AddWithValue("@contrasena", contrasena);

                            // Obtener el ID del usuario recién insertado
                            int idUsuario = Convert.ToInt32(cmdInsertar.ExecuteScalar());

                            // Asignar rol por defecto (Cliente)
                            string sqlAsignarRol = @"
                                INSERT INTO usuario_roles (id_usuario, id_rol) 
                                VALUES (@idUsuario, 2)";

                            using (MySqlCommand cmdAsignarRol = new MySqlCommand(sqlAsignarRol, conexion))
                            {
                                cmdAsignarRol.Parameters.AddWithValue("@idUsuario", idUsuario);
                                cmdAsignarRol.ExecuteNonQuery();
                            }
                        }

                        // Redirigir a página de inicio de sesión o dashboard
                        Session["nombreUsuario"] = nombreCompleto;
                        Response.Redirect("Login.aspx", false);
                    }
                    catch (Exception ex)
                    {
                        // Manejar cualquier error durante el registro
                        lblEstado.Text = "Error al registrar: " + ex.Message;
                    }
                }
            }
            else
            {
                // Validaciones adicionales si es necesario
                if (!chkTerminos.Checked)
                {
                    lblEstado.Text = "Debe aceptar los términos y condiciones.";
                }
            }
        }
    }
}