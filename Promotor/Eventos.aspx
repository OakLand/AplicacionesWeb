<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Eventos.aspx.vb" Inherits="Promotor_Eventos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div style="text-align:center;"><asp:Label ID="Label1" Text="Mis Eventos" class="lead" runat="server" /></div>
    <br />
    <div id="contenedor">
        <div id="contenido">
            <div id="eventos">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sqlEventos" Width="100%" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:CommandField SelectText="Editar" ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" />
                        <asp:BoundField DataField="Persona" HeaderText="Persona" SortExpression="Persona" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                        <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                        <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                        <asp:TemplateField HeaderText="Categoria" SortExpression="Categoria">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sqlCategoria" DataTextField="Nombre" DataValueField="Nombre" Height="20px" SelectedValue='<%# Bind("Categoria") %>' Width="113px">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Categoria") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Reservar" HeaderText="Reservar" SortExpression="Reservar" />
                        <asp:BoundField DataField="Tiempo_Reserva" HeaderText="Tiempo_Reserva" SortExpression="Tiempo_Reserva" />
                    </Columns>
                    <EmptyDataTemplate>
                        No Hay Eventos Disponibles
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
    <br />
    <div id="buttons">
        <asp:Button ID="newEvent" runat="server" Text="Nuevo Evento" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="soliCat" runat="server" Text="Solicitar Categoría" />
    </div>
<br />
<asp:SqlDataSource ID="sqlEventos" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DataBase %>" DeleteCommand="DELETE FROM [Evento] WHERE [Id] = @original_Id AND [Id_Persona] = @original_Id_Persona AND [Descripcion] = @original_Descripcion AND [Ubicacion] = @original_Ubicacion AND [Fecha] = @original_Fecha AND [Hora] = @original_Hora AND [Categoria] = @original_Categoria AND [Reservar] = @original_Reservar AND (([Tiempo_Reserva] = @original_Tiempo_Reserva) OR ([Tiempo_Reserva] IS NULL AND @original_Tiempo_Reserva IS NULL))" InsertCommand="INSERT INTO [Evento] ([Id], [Id_Persona], [Descripcion], [Ubicacion], [Fecha], [Hora], [Categoria], [Reservar], [Tiempo_Reserva]) VALUES (@Id, @Id_Persona, @Descripcion, @Ubicacion, @Fecha, @Hora, @Categoria, @Reservar, @Tiempo_Reserva)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT E.Id, P.Nombre AS Persona, E.Descripcion, E.Ubicacion, E.Fecha, E.Hora, C.Nombre AS Categoria, E.Reservar, E.Tiempo_Reserva FROM Evento AS E INNER JOIN Categoria AS C ON E.Categoria = C.Id INNER JOIN Persona AS P ON E.Id_Persona = P.Id WHERE ([Id_Persona] = @Id_Persona)" UpdateCommand="UPDATE [Evento] SET [Descripcion] = @Descripcion, [Ubicacion] = @Ubicacion, [Fecha] = @Fecha, [Hora] = @Hora, [Categoria] = (Select Id from Categoria where Nombre = @Categoria), [Reservar] = @Reservar, [Tiempo_Reserva] = @Tiempo_Reserva WHERE [Id] = @original_Id">
    <SelectParameters>
        <asp:CookieParameter CookieName="Usuario" DefaultValue="" Name="Id_Persona" Type="Int32" />
    </SelectParameters>
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
        <asp:Parameter Name="Descripcion" Type="String" />
        <asp:Parameter Name="Ubicacion" Type="String" />
        <asp:Parameter DbType="Date" Name="Fecha" />
        <asp:Parameter Name="Hora" Type="String" />
        <asp:Parameter Name="Categoria" Type="Int32" />
        <asp:Parameter Name="Reservar" Type="Int32" />
        <asp:Parameter Name="Tiempo_Reserva" Type="Int32" />
        <asp:Parameter Name="original_Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT [Id], [Nombre] FROM [Categoria]"></asp:SqlDataSource>
</asp:Content>

