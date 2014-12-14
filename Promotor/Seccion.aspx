<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Seccion.aspx.vb" Inherits="Promotor_Seccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <div >
       <br />
        <asp:Label ID="Label2" runat="server" Text="Nueva Sección"></asp:Label>
        <br />
        <asp:Label ID="labelSeccion" Text="Descripcion:" runat="server" />
        <asp:TextBox ID="DescripcionSeccion" runat="server" Height="45px" Width="162px" required="required" TextMode="MultiLine" />
        <br />
        <br />
        <asp:Button ID="InsertSeccion" runat="server" Text="Crear" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancelSeccion" runat="server" Text="Cancelar" UseSubmitBehavior="False" />
     </div>
            
</asp:Content>

