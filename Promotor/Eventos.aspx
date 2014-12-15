<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Eventos.aspx.vb" Inherits="Promotor_Eventos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="page-header">Mis Eventos</h1>
        
                <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table table-striped"  AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sqlEventos" Width="100%" AllowPaging="True" AllowSorting="True" GridLines="None">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" SortExpression="Descripcion" />
                        <asp:BoundField DataField="Ubicacion" HeaderText="Ubicación" SortExpression="Ubicacion" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                        <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                        <asp:BoundField DataField="Categoria" HeaderText="Categoría" SortExpression="Categoria" />
                        <asp:BoundField DataField="Reservar" HeaderText="Reservar" SortExpression="Reservar" />
                        <asp:BoundField DataField="Tiempo_Reserva" HeaderText="Tiempo Reserva" SortExpression="Tiempo_Reserva" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="alert alert-danger" role="alert">
                            No tienes <strong>Eventos</strong> creados.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
       
    <div id="buttons">
        <asp:Button ID="newEvent" class="btn btn-default"  runat="server" Text="Nuevo Evento" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="soliCat" class="btn btn-default"  runat="server" Text="Solicitar Categoría" />
    </div>
<br />
<asp:SqlDataSource ID="sqlEventos" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DataBase %>" DeleteCommand="DELETE FROM [Evento] WHERE [Id] = @original_Id AND [Id_Persona] = @original_Id_Persona AND [Descripcion] = @original_Descripcion AND [Ubicacion] = @original_Ubicacion AND [Fecha] = @original_Fecha AND [Hora] = @original_Hora AND [Categoria] = @original_Categoria AND [Reservar] = @original_Reservar AND (([Tiempo_Reserva] = @original_Tiempo_Reserva) OR ([Tiempo_Reserva] IS NULL AND @original_Tiempo_Reserva IS NULL))" InsertCommand="INSERT INTO [Evento] ([Id], [Id_Persona], [Descripcion], [Ubicacion], [Fecha], [Hora], [Categoria], [Reservar], [Tiempo_Reserva]) VALUES (@Id, @Id_Persona, @Descripcion, @Ubicacion, @Fecha, @Hora, @Categoria, @Reservar, @Tiempo_Reserva)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT E.Id, P.Nombre as Persona, E.Descripcion, E.Ubicacion, E.Fecha, E.Hora, C.Nombre as Categoria, E.Reservar, E.Tiempo_Reserva FROM [Evento] as E inner join [Categoria] as C on E.Categoria = C.Id	inner join [Persona] as P on E.Id_Persona = P.Id" UpdateCommand="UPDATE [Evento] SET [Id_Persona] = @Id_Persona, [Descripcion] = @Descripcion, [Ubicacion] = @Ubicacion, [Fecha] = @Fecha, [Hora] = @Hora, [Categoria] = @Categoria, [Reservar] = @Reservar, [Tiempo_Reserva] = @Tiempo_Reserva WHERE [Id] = @original_Id AND [Id_Persona] = @original_Id_Persona AND [Descripcion] = @original_Descripcion AND [Ubicacion] = @original_Ubicacion AND [Fecha] = @original_Fecha AND [Hora] = @original_Hora AND [Categoria] = @original_Categoria AND [Reservar] = @original_Reservar AND (([Tiempo_Reserva] = @original_Tiempo_Reserva) OR ([Tiempo_Reserva] IS NULL AND @original_Tiempo_Reserva IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_Id_Persona" Type="Int32" />
        <asp:Parameter Name="original_Descripcion" Type="String" />
        <asp:Parameter Name="original_Ubicacion" Type="String" />
        <asp:Parameter DbType="Date" Name="original_Fecha" />
        <asp:Parameter Name="original_Hora" Type="String" />
        <asp:Parameter Name="original_Categoria" Type="Int32" />
        <asp:Parameter Name="original_Reservar" Type="Int32" />
        <asp:Parameter Name="original_Tiempo_Reserva" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Id" Type="Int32" />
        <asp:Parameter Name="Id_Persona" Type="Int32" />
        <asp:Parameter Name="Descripcion" Type="String" />
        <asp:Parameter Name="Ubicacion" Type="String" />
        <asp:Parameter DbType="Date" Name="Fecha" />
        <asp:Parameter Name="Hora" Type="String" />
        <asp:Parameter Name="Categoria" Type="Int32" />
        <asp:Parameter Name="Reservar" Type="Int32" />
        <asp:Parameter Name="Tiempo_Reserva" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Id_Persona" Type="Int32" />
        <asp:Parameter Name="Descripcion" Type="String" />
        <asp:Parameter Name="Ubicacion" Type="String" />
        <asp:Parameter DbType="Date" Name="Fecha" />
        <asp:Parameter Name="Hora" Type="String" />
        <asp:Parameter Name="Categoria" Type="Int32" />
        <asp:Parameter Name="Reservar" Type="Int32" />
        <asp:Parameter Name="Tiempo_Reserva" Type="Int32" />
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_Id_Persona" Type="Int32" />
        <asp:Parameter Name="original_Descripcion" Type="String" />
        <asp:Parameter Name="original_Ubicacion" Type="String" />
        <asp:Parameter DbType="Date" Name="original_Fecha" />
        <asp:Parameter Name="original_Hora" Type="String" />
        <asp:Parameter Name="original_Categoria" Type="Int32" />
        <asp:Parameter Name="original_Reservar" Type="Int32" />
        <asp:Parameter Name="original_Tiempo_Reserva" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

