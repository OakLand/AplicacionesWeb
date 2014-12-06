<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="View.aspx.vb" Inherits="Eventos_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:FormView ID="FormView1" runat="server" DataSourceID="sqlEvento">
        <EditItemTemplate>
            Promotor:
            <asp:TextBox ID="PromotorTextBox" runat="server" Text='<%# Bind("Promotor") %>' />
            <br />
            Descripción:
            <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' />
            <br />
            Ubicación:
            <asp:TextBox ID="UbicaciónTextBox" runat="server" Text='<%# Bind("Ubicación") %>' />
            <br />
            Categoría:
            <asp:TextBox ID="CategoríaTextBox" runat="server" Text='<%# Bind("Categoría") %>' />
            <br />
            Fecha:
            <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
            <br />
            Hora:
            <asp:TextBox ID="HoraTextBox" runat="server" Text='<%# Bind("Hora") %>' />
            <br />
            Reservar:
            <asp:TextBox ID="ReservarTextBox" runat="server" Text='<%# Bind("Reservar") %>' />
            <br />
            Tiempo de Reserva:
            <asp:TextBox ID="Tiempo_de_ReservaTextBox" runat="server" Text='<%# Bind("[Tiempo de Reserva]") %>' />
            <br />
            Boletos:
            <asp:TextBox ID="BoletosTextBox" runat="server" Text='<%# Bind("Boletos") %>' />
            <br />
            Disponibles:
            <asp:TextBox ID="DisponiblesTextBox" runat="server" Text='<%# Bind("Disponibles") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            Evento No Disponible
        </EmptyDataTemplate>
        <InsertItemTemplate>
            Promotor:
            <asp:TextBox ID="PromotorTextBox" runat="server" Text='<%# Bind("Promotor") %>' />
            <br />
            Descripción:
            <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' />
            <br />
            Ubicación:
            <asp:TextBox ID="UbicaciónTextBox" runat="server" Text='<%# Bind("Ubicación") %>' />
            <br />
            Categoría:
            <asp:TextBox ID="CategoríaTextBox" runat="server" Text='<%# Bind("Categoría") %>' />
            <br />
            Fecha:
            <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
            <br />
            Hora:
            <asp:TextBox ID="HoraTextBox" runat="server" Text='<%# Bind("Hora") %>' />
            <br />
            Reservar:
            <asp:TextBox ID="ReservarTextBox" runat="server" Text='<%# Bind("Reservar") %>' />
            <br />
            Tiempo de Reserva:
            <asp:TextBox ID="Tiempo_de_ReservaTextBox" runat="server" Text='<%# Bind("[Tiempo de Reserva]") %>' />
            <br />
            Boletos:
            <asp:TextBox ID="BoletosTextBox" runat="server" Text='<%# Bind("Boletos") %>' />
            <br />
            Disponibles:
            <asp:TextBox ID="DisponiblesTextBox" runat="server" Text='<%# Bind("Disponibles") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            Promotor:
            <asp:Label ID="PromotorLabel" runat="server" Text='<%# Bind("Promotor") %>' />
            <br />
            Descripción:
            <asp:Label ID="DescripciónLabel" runat="server" Text='<%# Bind("Descripción") %>' />
            <br />

            Ubicación:
            <asp:Label ID="UbicaciónLabel" runat="server" Text='<%# Bind("Ubicación") %>' />
            <br />
            Categoría:
            <asp:Label ID="CategoríaLabel" runat="server" Text='<%# Bind("Categoría") %>' />
            <br />
            Fecha:
            <asp:Label ID="FechaLabel" runat="server" Text='<%# Bind("Fecha") %>' />
            <br />
            Hora:
            <asp:Label ID="HoraLabel" runat="server" Text='<%# Bind("Hora") %>' />
            <br />
            Reservar:
            <asp:Label ID="ReservarLabel" runat="server" Text='<%# Bind("Reservar") %>' />
            <br />
            Tiempo de Reserva:
            <asp:Label ID="Tiempo_de_ReservaLabel" runat="server" Text='<%# Bind("[Tiempo de Reserva]") %>' />
            <br />
            Boletos:
            <asp:Label ID="BoletosLabel" runat="server" Text='<%# Bind("Boletos") %>' />
            <br />
            Disponibles:
            <asp:Label ID="DisponiblesLabel" runat="server" Text='<%# Bind("Disponibles") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    
    <asp:SqlDataSource ID="sqlEvento" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT        Persona.Nombre AS Promotor, Evento.Descripcion AS Descripción, Evento.Ubicacion AS Ubicación, 
Categoria.Nombre AS Categoría, Evento.Fecha, Evento.Hora, Evento.Reservar, Evento.Tiempo_Reserva AS [Tiempo de Reserva], (Select count(*) from Boleto) AS Boletos, (Select count(*) from Boleto where Boleto.Tipo = 0) as Disponibles
FROM            Evento INNER JOIN
                         Persona ON Evento.Id_Persona = Persona.Id INNER JOIN
                         Categoria ON Evento.Categoria = Categoria.Id"></asp:SqlDataSource>
    
</asp:Content>

