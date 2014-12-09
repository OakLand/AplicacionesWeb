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
                        <div class="new">
                            Descripcion:
                            <asp:TextBox ID="DescripcionTextBox" runat="server" Height="45px" Width="162px" required="required" />
                            <br />
                            <br />
                            Fecha:
                            <asp:TextBox ID="FechaTextBox" runat="server" required="required" />
                            <asp:CalendarExtender ID="FechaTextBox_CalendarExtender" runat="server" Enabled="True" TargetControlID="FechaTextBox">
                            </asp:CalendarExtender>
                            <br />
                            <br />
                            Reservar:
                            <asp:DropDownList ID="ReservarTextBox" class="reservar" runat="server" Width="128px">
                                <asp:ListItem Value="1">Si</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                            Categoria:
                            <asp:DropDownList ID="CategoriaTextBox" runat="server" DataSourceID="sqlCategoria" DataTextField="Nombre" DataValueField="Id" required="required" Height="22px" Width="115px">
                            </asp:DropDownList>
                        </div>
                        <div class="new" style="float: right">
                            Ubicacion:
                            <asp:TextBox ID="UbicacionTextBox" runat="server" Height="45px"  Width="155px" required="required" />
                            <br />
                            <br />
                            Hora:
                            <asp:TextBox ID="HoraTextBox" runat="server" required="required" />
                            <br />
                            <br />
                            Días de Reserva:
                            <asp:TextBox ID="Tiempo_ReservaTextBox" class="reservar" runat="server" Width="60px" Height="30" Font-Size="Large" required="required" />
                            <asp:NumericUpDownExtender ID="Tiempo_ReservaTextBox_NumericUpDownExtender" runat="server" Enabled="True" Maximum="100" Minimum="0" RefValues="" ServiceDownMethod="" ServiceDownPath="" ServiceUpMethod="" Tag="" TargetButtonDownID="" TargetButtonUpID="" TargetControlID="Tiempo_ReservaTextBox" Width="100">
                            </asp:NumericUpDownExtender>
                            <br />
                            <br />
                            <br />
                            <div style="float:right">
                                <asp:Button ID="Insert" runat="server" Text="Crear" />
                                &nbsp;&nbsp;
                                <asp:linkButton ID="Cancel" runat="server" Text="Cancelar" PostBackUrl="~/Promotor/Eventos.aspx" />
                            </div>
                        </div>



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

