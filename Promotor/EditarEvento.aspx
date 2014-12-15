<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="EditarEvento.aspx.vb" Inherits="Promotor_EditarEvento" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>   
    <br />
    <div  style="text-align:center;">
        <asp:Label ID="Label1" runat="server" class="lead" Text="Nuevo Evento"></asp:Label>
    </div>
    <br />
    <br />
    <div id="contenedor">
        <div id="contenido" style="padding: 0px 15%">
            <div id="Formulario" style="display:inline-block; width:50%">
                        <div class="new">
                            Nombre:
                            <asp:TextBox ID="NombreTextBox" required="required" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            Descripcion:
                            <asp:TextBox ID="DescripcionTextBox" runat="server" Height="45px" Width="162px" required="required" TextMode="MultiLine" />
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
                            <div style="float:right">
                                <asp:Button ID="Insert" runat="server" Text="Crear" />
                                &nbsp;&nbsp;
                                <asp:linkButton ID="Cancel" runat="server" Text="Cancelar" PostBackUrl="~/Promotor/Eventos.aspx" />
                            </div>
                        </div>
                        <div class="new" style="float: right">
                            Categoria:
                            <asp:DropDownList ID="CategoriaTextBox" runat="server" DataSourceID="sqlCategoria" DataTextField="Nombre" DataValueField="Id" required="required" Height="22px" Width="115px">
                            </asp:DropDownList>
                            <br /><br />
                            Ubicacion:
                            <asp:TextBox ID="UbicacionTextBox" runat="server" Height="45px"  Width="155px" required="required" TextMode="MultiLine" />
                            <br />
                            <br />
                            Hora:
                            <asp:TextBox ID="HoraTextBox" runat="server" required="required" TextMode="Time" />
                            <br />
                            <br />
                            Días de Reserva:
                            <asp:TextBox ID="Tiempo_ReservaTextBox" class="reservar" runat="server" Width="60px" Height="30" Font-Size="Large" required="required" />
                            <asp:NumericUpDownExtender ID="Tiempo_ReservaTextBox_NumericUpDownExtender" runat="server" Enabled="True" Maximum="100" Minimum="0" RefValues="" ServiceDownMethod="" ServiceDownPath="" ServiceUpMethod="" Tag="" TargetButtonDownID="" TargetButtonUpID="" TargetControlID="Tiempo_ReservaTextBox" Width="100">
                            </asp:NumericUpDownExtender>
                            <br />
                            
                        </div>

                <asp:SqlDataSource ID="sqlCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Categoria]">
                        </asp:SqlDataSource>

            </div>
            <div style="display: inline; float: right; margin:30px 0px">
                Imagen:
                <asp:Image ID="image" runat="server" Height="200px" ImageAlign="Middle" Width="200px" />
                <br /><br />
                <asp:DropDownList ID="DropDownImage" runat="server" Height="20px" Width="122px" DataSourceID="sqlImage" DataTextField="Imagen" DataValueField="Id"></asp:DropDownList>
                <br /><br />
                <asp:FileUpload ID="fileImage" runat="server" />
            </div>
            <asp:SqlDataSource ID="sqlImage" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT * FROM [Imagenes] WHERE ([Id_Persona] = @Id_Persona)">
                <SelectParameters>
                    <asp:CookieParameter CookieName="Evento" DefaultValue="" Name="Id_Persona" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <br />
</asp:Content>

