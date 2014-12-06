<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="NuevoEvento.aspx.vb" Inherits="Promotor_NuevoEvento" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #TextArea1 {
            height: 44px;
        }
        #descripcion {
            height: 42px;
        }
        #ubicacion {
            height: 41px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <br />
    <div  style="text-align:center;">
        <asp:Label ID="Label1" runat="server" class="lead" Text="Nuevo Evento"></asp:Label>
    </div>
    <br />
    <br />
    <div id="contenedor">
        <div id="contenido">
            <div id="Formulario">

                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="sqlEventos" DefaultMode="Insert">
                    <EditItemTemplate>
                        Id:
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        Id_Persona:
                        <asp:TextBox ID="Id_PersonaTextBox" runat="server" Text='<%# Bind("Id_Persona") %>' />
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
                        Tiempo_Reserva:
                        <asp:TextBox ID="Tiempo_ReservaTextBox" runat="server" Text='<%# Bind("Tiempo_Reserva") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div>
                            Id:
                            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                        </div>
                        <div class="new">
                            Id Persona:
                            <asp:DropDownList ID="Id_PersonaTextBox" runat="server" DataSourceID="sqlPersona" DataTextField="Nombre" DataValueField="Id" SelectedValue='<%# Bind("Id_Persona", "{0}") %>'>
                            </asp:DropDownList>
                            <br />
                            <br />
                            Descripcion:
                            <asp:TextBox ID="DescripcionTextBox" runat="server" Height="45px" Text='<%# Bind("Descripcion") %>' Width="162px" />
                            <br />
                            <br />
                            Fecha:
                            <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
                            <asp:CalendarExtender ID="FechaTextBox_CalendarExtender" runat="server" Enabled="True" TargetControlID="FechaTextBox">
                            </asp:CalendarExtender>
                            <br />
                            <br />
                            Reservar:
                            <asp:TextBox ID="ReservarTextBox" runat="server" Text='<%# Bind("Reservar") %>' />
                        </div>
                        <div class="new" style="float: right">
                            Categoria:
                            <asp:DropDownList ID="CategoriaTextBox" runat="server" DataSourceID="sqlCategoria" DataTextField="Nombre" DataValueField="Id" SelectedValue='<%# Bind("Categoria", "{0}") %>'>
                            </asp:DropDownList>
                            <br />
                            <br />
                            Ubicacion:
                            <asp:TextBox ID="UbicacionTextBox" runat="server" Height="45px" Text='<%# Bind("Ubicacion") %>' Width="155px" />
                            <br />
                            <br />
                            Hora:
                            <asp:TextBox ID="HoraTextBox" runat="server" Text='<%# Bind("Hora") %>' />
                            <br />
                            <br />
                            Tiempo_Reserva:
                            <asp:TextBox ID="Tiempo_ReservaTextBox" runat="server" Text='<%# Bind("Tiempo_Reserva", "{0}") %>' />
                        </div>
                        <div>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" PostBackUrl="~/Promotor/CrearBoletos.aspx" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" PostBackUrl="~/Promotor/Eventos.aspx" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Id:
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        Id_Persona:
                        <asp:Label ID="Id_PersonaLabel" runat="server" Text='<%# Bind("Id_Persona") %>' />
                        <br />
                        Descripcion:
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Bind("Descripcion") %>' />
                        <br />
                        Ubicacion:
                        <asp:Label ID="UbicacionLabel" runat="server" Text='<%# Bind("Ubicacion") %>' />
                        <br />
                        Fecha:
                        <asp:Label ID="FechaLabel" runat="server" Text='<%# Bind("Fecha") %>' />
                        <br />
                        Hora:
                        <asp:Label ID="HoraLabel" runat="server" Text='<%# Bind("Hora") %>' />
                        <br />
                        Categoria:
                        <asp:Label ID="CategoriaLabel" runat="server" Text='<%# Bind("Categoria") %>' />
                        <br />
                        Reservar:
                        <asp:Label ID="ReservarLabel" runat="server" Text='<%# Bind("Reservar") %>' />
                        <br />
                        Tiempo_Reserva:
                        <asp:Label ID="Tiempo_ReservaLabel" runat="server" Text='<%# Bind("Tiempo_Reserva") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
                    </ItemTemplate>
                </asp:FormView>

            </div>
        </div>
    </div>
    <br />
    <asp:SqlDataSource ID="sqlEventos" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DataBase %>" DeleteCommand="DELETE FROM [Evento] WHERE [Id] = @original_Id AND [Id_Persona] = @original_Id_Persona AND [Descripcion] = @original_Descripcion AND [Ubicacion] = @original_Ubicacion AND [Fecha] = @original_Fecha AND [Hora] = @original_Hora AND [Categoria] = @original_Categoria AND [Reservar] = @original_Reservar AND (([Tiempo_Reserva] = @original_Tiempo_Reserva) OR ([Tiempo_Reserva] IS NULL AND @original_Tiempo_Reserva IS NULL))" InsertCommand="INSERT INTO [Evento] ([Id], [Id_Persona], [Descripcion], [Ubicacion], [Fecha], [Hora], [Categoria], [Reservar], [Tiempo_Reserva]) VALUES (@Id, @Id_Persona, @Descripcion, @Ubicacion, @Fecha, @Hora, @Categoria, @Reservar, @Tiempo_Reserva)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Evento]" UpdateCommand="UPDATE [Evento] SET [Id_Persona] = @Id_Persona, [Descripcion] = @Descripcion, [Ubicacion] = @Ubicacion, [Fecha] = @Fecha, [Hora] = @Hora, [Categoria] = @Categoria, [Reservar] = @Reservar, [Tiempo_Reserva] = @Tiempo_Reserva WHERE [Id] = @original_Id AND [Id_Persona] = @original_Id_Persona AND [Descripcion] = @original_Descripcion AND [Ubicacion] = @original_Ubicacion AND [Fecha] = @original_Fecha AND [Hora] = @original_Hora AND [Categoria] = @original_Categoria AND [Reservar] = @original_Reservar AND (([Tiempo_Reserva] = @original_Tiempo_Reserva) OR ([Tiempo_Reserva] IS NULL AND @original_Tiempo_Reserva IS NULL))">
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
    <asp:SqlDataSource ID="sqlPersona" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT * FROM [Persona]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT * FROM [Categoria]"></asp:SqlDataSource>
</asp:Content>

