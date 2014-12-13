<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Solicitudes.aspx.vb" Inherits="Admin_Solicitudes" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
            <asp:GridView ID="gridSolicitudes" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sqlSolicitud">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                </Columns>
                <EmptyDataTemplate>
                    No Hay Solicitudes
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <asp:Button ID="cmdAceptar" runat="server" Text="Aceptar Solicitud" Visible="False" />
        &nbsp;&nbsp;
            <asp:Button ID="cmdRechazar" runat="server" Text="Rechazar Solicitud" Visible="False" />
            <br />
            <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>
    
    <br />
    <br />
    <asp:SqlDataSource ID="sqlSolicitud" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT Solicitud.Id, Persona.Nombre, Solicitud.Estado, Solicitud.Fecha FROM Solicitud INNER JOIN Persona ON Solicitud.Id_Persona = Persona.Id order by Solicitud.Estado Asc"></asp:SqlDataSource>
</asp:Content>

