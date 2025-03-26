<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Melodyhub2.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - MelodyHub</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="resources/css/login.css" rel="stylesheet" />
</head>
<body>
    <header class="bg-white shadow-sm">
        <div class="container d-flex align-items-center py-3">
            <img src="html/img/logo.png" alt="Logo MelodyHub" class="logo me-3" style="height: 125px;">
            <h1 class="text-primary">MelodyHub</h1>
        </div>
    </header>

    <div class="menu-nav bg-light">
        <nav class="container">
            <ul class="nav nav-pills justify-content-center">
                <li class="nav-item"><a class="nav-link active" href="html/index.html">Inicio</a></li>
                <li class="nav-item"><a class="nav-link" href="html/services.html">Servicios</a></li>
                <li class="nav-item"><a class="nav-link" href="html/plans.html">Planes</a></li>
                <li class="nav-item"><a class="nav-link" href="html/about.html">Sobre Nosotros</a></li>
                <li class="nav-item"><a class="nav-link" href="../Login.aspx">Iniciar Sesión</a></li>
                <li class="nav-item"><a class="nav-link" href="Signup.aspx">Registrarse</a></li>
            </ul>
        </nav>
    </div>
    <br />
    <!-- Login Form -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form id="form1" runat="server" class="wrapper">
                    <h1 class="text-center mb-4">Ingresar - MelodyHub</h1>

                    <div class="input-box">
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario" CssClass="form-label"></asp:Label>
                        <div class="field-with-error">
                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" AutoCompleteType="Disabled" />
                            <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="rfvUsuario" 
                                ControlToValidate="txtUsuario" 
                                ErrorMessage="Completa el campo." 
                                CssClass="error-message" 
                                Display="Static" />
                        </div>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="lblPassword" runat="server" Text="Contraseña" CssClass="form-label"></asp:Label>
                        <div class="field-with-error">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"/>
                            <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="rfvPassword" 
                                ControlToValidate="txtPassword" 
                                ErrorMessage="Completa el campo." 
                                CssClass="error-message" 
                                Display="Static" />
                        </div>
                    </div>
                    
                    <asp:Button 
                        ID="btnIngresar" 
                        runat="server" 
                        Text="Ingresar" 
                        CssClass="btn btn-primary w-100" 
                        OnClick="btnIngresar_Click" />

                    <asp:Label 
                        ID="lblEstado" 
                        runat="server" 
                        CssClass="error-message" />
                </form>
            </div>
        </div>
    </div>

    <footer class="py-4 mt-4">
        <div class="container">
            <ul class="footer-links list-unstyled text-center mb-3">
                <li class="d-inline mx-2"><a href="html/terms.html">Términos y Condiciones</a></li>
                <li class="d-inline mx-2"><a href="html/navMap.html">Mapa de Navegación</a></li>
                <li class="d-inline mx-2"><a href="html/404.html">Error - 404</a></li>
                <li class="d-inline mx-2"><a href="html/500.html">Error - 500</a></li>
            </ul>
            <p class="copyright text-center mb-0">&copy; 2024 MelodyHub - Todos los derechos reservados</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>