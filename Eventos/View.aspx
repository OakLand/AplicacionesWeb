<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="View.aspx.vb" Inherits="Eventos_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:FormView ID="FormView1" runat="server" DataSourceID="sqlEvento">
        <EditItemTemplate>
            Promotor:
            <asp:TextBox ID="PromotorTextBox" runat="server" Text='<%# Bind("Promotor") %>' />
            <br />
            Evento:
            <asp:TextBox ID="EventoTextBox" runat="server" Text='<%# Bind("Evento") %>' />
            <br />
            Descripcion:
            <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
            <br />
            Ubicacion:
            <asp:TextBox ID="UbicacionTextBox" runat="server" Text='<%# Bind("Ubicacion") %>' />
            <br />
            Fecha:
            <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
            <br />
            Hora:
            <asp:TextBox ID="HoraTextBox" runat="server" Text='<%# Bind("Hora") %>' />
            <br />
            Categoria:
            <asp:TextBox ID="CategoriaTextBox" runat="server" Text='<%# Bind("Categoria") %>' />
            <br />
            Reservar:
            <asp:TextBox ID="ReservarTextBox" runat="server" Text='<%# Bind("Reservar") %>' />
            <br />
            Dias de Reserva:
            <asp:TextBox ID="Dias_de_ReservaTextBox" runat="server" Text='<%# Bind("[Dias de Reserva]") %>' />
            <br />
            Imagen:
            <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("Imagen") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Promotor:
            <asp:TextBox ID="PromotorTextBox" runat="server" Text='<%# Bind("Promotor") %>' />
            <br />
            Evento:
            <asp:TextBox ID="EventoTextBox" runat="server" Text='<%# Bind("Evento") %>' />
            <br />
            Descripcion:
            <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
            <br />
            Ubicacion:
            <asp:TextBox ID="UbicacionTextBox" runat="server" Text='<%# Bind("Ubicacion") %>' />
            <br />
            Fecha:
            <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
            <br />
            Hora:
            <asp:TextBox ID="HoraTextBox" runat="server" Text='<%# Bind("Hora") %>' />
            <br />
            Categoria:
            <asp:TextBox ID="CategoriaTextBox" runat="server" Text='<%# Bind("Categoria") %>' />
            <br />
            Reservar:
            <asp:TextBox ID="ReservarTextBox" runat="server" Text='<%# Bind("Reservar") %>' />
            <br />
            Dias de Reserva:
            <asp:TextBox ID="Dias_de_ReservaTextBox" runat="server" Text='<%# Bind("[Dias de Reserva]") %>' />
            <br />
            Imagen:
            <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("Imagen") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="thumbnail">
                <asp:Image ID="Imagen" runat="server" CssClass="img-responsive" ImageUrl='<%# Bind("Imagen") %>'/>
                <div class="caption-full">
                    <h4 class="pull-right"><asp:Label ID="UbicacionLabel" runat="server" Text='<%# Bind("Ubicacion") %>' /></h4>
                    <h4><asp:Label ID="EventoLabel" runat="server" Text='<%# Bind("Evento") %>' /></h4>
                    <p><asp:Label ID="DescripcionLabel" runat="server" Text='<%# Bind("Descripcion") %>' /></p>
                    <div class="ratings">
                        <p>Hora: <asp:Label ID="Label1" runat="server" Text='<%# Bind("Hora") %>' /></p>
                        <p>Fecha: <asp:Label ID="Label2" runat="server" Text='<%# Bind("Fecha") %>' /></p>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
    <br />
    <div>
        <asp:GridView ID="gridBoletos" runat="server" CssClass="table-hover table table-striped" AutoGenerateColumns="False" DataSourceID="sqlBoletos" GridLines="None">
            <Columns>
                <asp:CommandField SelectText="Reservar" ShowSelectButton="True" />
                <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                <asp:BoundField DataField="Seccion" HeaderText="Seccion" SortExpression="Seccion" />
                <asp:BoundField DataField="Fila" HeaderText="Fila" SortExpression="Fila" />
                <asp:BoundField DataField="Costo" HeaderText="Costo" SortExpression="Costo" />
                <asp:BoundField DataField="Disponibles" HeaderText="Disponibles" ReadOnly="True" SortExpression="Disponibles" />
            </Columns>
            <EmptyDataTemplate>
                <div class="alert alert-danger" role="alert">
                    No hay <strong>Boletos</strong> disponibles.
                </div>
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
    </div>
    <asp:SqlDataSource ID="sqlEvento" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT p.Nombre AS Promotor, e.Nombre AS Evento, e.Descripcion, e.Ubicacion, e.Fecha, e.Hora, c.Nombre AS Categoria, e.Reservar, e.Tiempo_Reserva AS [Dias de Reserva], i.Imagen FROM Evento AS e INNER JOIN Categoria AS c ON e.Categoria = c.Id INNER JOIN Imagenes AS i ON e.Id = i.Id INNER JOIN Persona AS p ON e.Id_Persona = p.Id WHERE (e.Id = @Id)">
        <SelectParameters>
            <asp:CookieParameter CookieName="event" DefaultValue="" Name="Id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlBoletos" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT DISTINCT a.Descripcion AS Area, s.Descripcion AS Seccion, b.Fila, b.Costo, COUNT('b.*') AS Disponibles FROM Boleto AS b INNER JOIN Area AS a ON b.Id_Area = a.Id INNER JOIN Seccion AS s ON b.Id_Seccion = s.Id WHERE (b.Id_Evento = @evento) GROUP BY a.Descripcion, s.Descripcion, b.Fila, b.Costo, b.Tipo HAVING (b.Tipo = 1)">
        <SelectParameters>
            <asp:CookieParameter CookieName="event" Name="evento" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

