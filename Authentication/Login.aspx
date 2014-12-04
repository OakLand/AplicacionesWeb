<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Authentication_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form class="form-signin" role="form">
    <div class="form-signin">
        <h2 class="form-signin-heading">Por favor, inicie sesión</h2>
        <label for="inputEmail" class="sr-only">Correo electrónico</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Correo electrónico" required autofocus />
        <br />
        <label for="inputPassword" class="sr-only">Contraseña</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Contraseña" required />
        <br />

        <button class="btn btn-primary btn-block" type="submit">Iniciar sesión</button>
        <button class="btn btn-primary btn-block" >Registrarse</button>
        </div>
      </form>

    <div style="vertical-align: middle; text-align: center;display:none;">

        <br />
        <asp:Login ID="Login1" runat="server">
        </asp:Login>
    </div>
    <br />
</asp:Content>

