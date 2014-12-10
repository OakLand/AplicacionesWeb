<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Authentication_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<form class="form-signin" role="form" method="post">--%>
    <div class="form-signin" role="form" >
        
        <h2 class="form-signin-heading">Por favor, inicie sesión</h2>
        <label for="inputUser" class="sr-only">Usuario</label>
        <asp:TextBox ID="inputUser" type="user" class="form-control" placeholder="Usuario" required="required" autofocus="autofocus" runat="server"></asp:TextBox>
        <br />
        <label for="inputPassword" class="sr-only">Contraseña</label><asp:TextBox ID="inputPassword" type="password" class="form-control" placeholder="Contraseña" required="required" runat="server"></asp:TextBox>
            <br />
        <asp:Button ID="login" class="btn btn-primary btn-block submit" runat="server" Text="Iniciar Sesión" />
        <asp:LinkButton ID="register" runat="server">Registrarse</asp:LinkButton>
        
    </div>
    <%--</form>--%>

    <div style="vertical-align: middle; text-align: center; display:none">

        <br />
        <asp:Login ID="Login1" runat="server">
        </asp:Login>
    </div>
    <br />
</asp:Content>

