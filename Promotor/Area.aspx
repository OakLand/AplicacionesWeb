<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Area.aspx.vb" Inherits="Promotor_Area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <div >
       <br />
        <asp:Label ID="Label2" runat="server" Text="Nueva Area"></asp:Label>
        <br />
        <asp:Label ID="labelArea" Text="Descripcion:" runat="server" />
        <asp:TextBox ID="DescripcionArea" runat="server" Height="45px" Width="162px" required="required" TextMode="MultiLine" />
        <br />
        <br />
        <asp:Button ID="InsertArea" runat="server" Text="Crear" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancelArea" runat="server" Text="Cancelar" UseSubmitBehavior="False" />
     </div>
            
</asp:Content>

