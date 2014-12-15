<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Area.aspx.vb" Inherits="Promotor_Area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="../assets/css/promotor.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="page-header">Nueva Area</h1>
    <div class="well">
        <h4>Descripción</h4>
        <div class="input-group area-descripcion">
            <asp:TextBox ID="DescripcionArea" CssClass="form-control" rows="5" runat="server"  required="required" TextMode="MultiLine" />
        </div>
        
        <asp:Button ID="InsertArea" CssClass="btn btn-default" runat="server" Text="Crear" />
        <asp:Button ID="btnCancelArea" runat="server" CssClass="btn-danger btn" Text="Cancelar" UseSubmitBehavior="False" />
    </div>

            
</asp:Content>

