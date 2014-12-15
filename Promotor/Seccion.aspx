<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Seccion.aspx.vb" Inherits="Promotor_Seccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../assets/css/promotor.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="page-header">Nueva Sección</h1>
    <div class="well">
        <h4>Descripción</h4>
        <div class="input-group seccion-descripcion">
            <asp:TextBox ID="DescripcionSeccion" CssClass="form-control" rows="5" runat="server"  required="required" TextMode="MultiLine" />
        </div>
        
        <asp:Button ID="InsertSeccion" CssClass="btn btn-default" runat="server" Text="Crear" />
        <asp:Button ID="btnCancelSeccion" runat="server" CssClass="btn-danger btn" Text="Cancelar" UseSubmitBehavior="False" />
    </div>
            
</asp:Content>

