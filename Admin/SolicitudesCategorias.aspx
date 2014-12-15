<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="SolicitudesCategorias.aspx.vb" Inherits="Admin_SolicitudesCategorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h1 class="page-header">Solicitudes de Categorias</h1>
        <asp:GridView ID="gridSoliCategorias" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sqlSoliCategorias" GridLines="None">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                <asp:BoundField DataField="Comentarios" HeaderText="Comentarios" SortExpression="Comentarios" />
                <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
            </Columns>
            <EmptyDataTemplate>
                <div class="alert alert-danger" role="alert">
                    No hay Solicitudes de <strong>Categorias</strong>.
                </div>
            </EmptyDataTemplate>
        </asp:GridView>
    
    <p>
        <asp:Button ID="cmdAceptar" runat="server" Text="Aceptar Categoria" Visible="False" />
&nbsp;&nbsp;
        <asp:Button ID="cmdRechazar" runat="server" Text="Rechazar Categoria" Visible="False" />
    </p>
    <p>
        <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:SqlDataSource ID="sqlSoliCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT [Id], [Categoria], [Comentarios], [estado], [fecha] FROM [Solicitud_Categoria]"></asp:SqlDataSource>
    </p>
</asp:Content>

