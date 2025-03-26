<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Melodyhub2.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Registrarse | MelodyHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        :root {
            --primary-color: #3B82F6;
            --secondary-color: #60A5FA;
            --accent-color: #2563EB;
            --background-color: #F0F9FF;
            --text-color: #1F2937;
        }

        body {
            background-color: var(--background-color);
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .signup-section {
            flex-grow: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 0;
        }

        .signup-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(59, 130, 246, 0.15);
            padding: 2rem;
            width: 100%;
            max-width: 500px;
        }

        .form-label {
            color: var(--primary-color);
        }

        footer {
            background-color: var(--secondary-color);
            color: white;
        }

        .footer-links a {
            color: white;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: var(--background-color);
        }
    </style>
</head>
<body>
    <header class="bg-white shadow-sm">
        <div class="container d-flex align-items-center py-3">
            <img src="html/img/logo.png" alt="Logo MelodyHub" class="logo me-3" style="height: 125px;" />
            <h1 class="text-primary">MelodyHub</h1>
        </div>
    </header>
    
    <div class="menu-nav bg-light">
        <nav class="container">
            <ul class="nav nav-pills justify-content-center">
                <li class="nav-item"><a class="nav-link" href="html/index.html">Inicio</a></li>
                <li class="nav-item"><a class="nav-link" href="html/services.html">Servicios</a></li>
                <li class="nav-item"><a class="nav-link" href="html/plans.html">Planes</a></li>
                <li class="nav-item"><a class="nav-link" href="html/about.html">Sobre Nosotros</a></li>
                <li class="nav-item"><a class="nav-link" href="Login.aspx">Iniciar Sesión</a></li>
                <li class="nav-item"><a class="nav-link active" href="Signup.aspx">Registrarse</a></li>
            </ul>
        </nav>
    </div>

    <div class="container signup-section">
        <div class="signup-card">
            <h2 class="text-primary text-center mb-4">Crea tu Cuenta MelodyHub</h2>
            <form id="registrationForm" runat="server">
                <div class="mb-3">
                    <asp:Label ID="lblNombreCompleto" runat="server" Text="Nombre Completo" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtNombreCompleto" runat="server" CssClass="form-control" placeholder="Ingresa tu nombre completo" required="required"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombreCompleto" runat="server" 
                        ControlToValidate="txtNombreCompleto" 
                        ErrorMessage="El nombre completo es requerido" 
                        CssClass="text-danger" 
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblCorreo" runat="server" Text="Correo Electrónico" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" CssClass="form-control" placeholder="ejemplo@melodyhub.com" required="required"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" 
                        ControlToValidate="txtCorreo" 
                        ErrorMessage="El correo electrónico es requerido" 
                        CssClass="text-danger" 
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revCorreo" runat="server" 
                        ControlToValidate="txtCorreo" 
                        ErrorMessage="Formato de correo electrónico inválido" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        CssClass="text-danger" 
                        Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblContrasena" runat="server" Text="Contraseña" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="form-control" placeholder="Crea una contraseña segura" required="required"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContrasena" runat="server" 
                        ControlToValidate="txtContrasena" 
                        ErrorMessage="La contraseña es requerida" 
                        CssClass="text-danger" 
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblConfirmarContrasena" runat="server" Text="Confirmar Contraseña" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtConfirmarContrasena" runat="server" TextMode="Password" CssClass="form-control" placeholder="Repite tu contraseña" required="required"></asp:TextBox>
                    <asp:CompareValidator ID="cvContrasena" runat="server" 
                        ControlToValidate="txtConfirmarContrasena" 
                        ControlToCompare="txtContrasena" 
                        ErrorMessage="Las contraseñas no coinciden" 
                        CssClass="text-danger" 
                        Display="Dynamic"></asp:CompareValidator>
                </div>
                <div class="form-check mb-3">
                    <asp:CheckBox ID="chkTerminos" runat="server" CssClass="form-check-input" required="required" />
                    <asp:Label ID="lblTerminos" runat="server" CssClass="form-check-label" Text="Acepto los Términos y Condiciones"></asp:Label>
                </div>
                <asp:Button ID="btnRegistrarse" runat="server" Text="Registrarse" CssClass="btn btn-primary w-100" OnClick="btnRegistrarse_Click" />
                
                <asp:Label ID="lblEstado" runat="server" CssClass="text-danger mt-3 d-block"></asp:Label>
            </form>
            <div class="text-center mt-3">
                <p class="small">¿Ya tienes una cuenta? <a href="Login.aspx" class="text-primary">Inicia Sesión</a></p>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>