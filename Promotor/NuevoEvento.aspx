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
    <h1 class="page-header">Nuevo Eventos</h1>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
        <div class="form-nuevo-evento" role="form">
            <h2 class="form-signin-heading">
                Ingrese la información del evento
            </h2>
            <div class="form-group">
            <label for="NombreTextBox" class="col-sm-2 control-label">Nombre</label>
                <div class="col-sm-12">
                    <asp:TextBox ID="NombreTextBox" class="form-control" required="required" runat="server" TextMode="MultiLine" autofocus="autofocus" ></asp:TextBox>
                </div>
            </div>
            
            <div class="form-group">
            <label for="DescripcionTextBox" class="col-sm-2 control-label">Descripción</label>
                <div class="col-sm-12">
                    <asp:TextBox ID="DescripcionTextBox" class="form-control" runat="server" required="required" TextMode="MultiLine" />
                    
                </div>
            </div>

            <div class="form-group">
            <label for="FechaTextBox" class="col-sm-2 control-label">Fecha</label>
                <div class="col-sm-12">
                    <asp:TextBox ID="FechaTextBox" class="form-control" runat="server" required="required" />
                    <asp:CalendarExtender ID="FechaTextBox_CalendarExtender" runat="server" Enabled="True" TargetControlID="FechaTextBox">
                    </asp:CalendarExtender>
                </div>
            </div>
            <div class="form-group">
            <label for="HoraTextBox" class="col-sm-2 control-label">Hora</label>
                <div class="col-sm-12">
                    <asp:TextBox ID="HoraTextBox" runat="server" required="required" TextMode="Time" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
            <label for="ReservarTextBox" class="col-sm-8 control-label">Habilitar Reservación</label>
                <div class="col-sm-12">
                     <asp:DropDownList ID="ReservarTextBox" class="reservar col-sm-4 form-control " runat="server" >
                                <asp:ListItem Value="1">Si</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                     </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
            <label for="Tiempo_ReservaTextBox" class="col-sm-8 control-label">Días de Reserva</label>
                <div class="col-sm-12">
                    <asp:TextBox ID="Tiempo_ReservaTextBox" class="form-control" runat="server"  required="required" TextMode="Number" />
                </div>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Tiempo_ReservaTextBox" ErrorMessage="Ingrese un valor mayor o igual que 0" MaximumValue="5000" MinimumValue="0"></asp:RangeValidator>
            </div>
            <div class="form-group">
            <label for="CategoriaTextBox" class="col-sm-2 control-label">Categoria</label>
                <div class="col-sm-12">
                    <asp:DropDownList ID="CategoriaTextBox" runat="server" CssClass="form-control" DataSourceID="sqlCategoria" DataTextField="Nombre" DataValueField="Id" required="required">
                   </asp:DropDownList>
                </div>
            </div>          
            <div class="form-group" >
            <label for="UbicacionTextBox" class="col-sm-2 control-label">Ubicación</label>
                <div class="col-sm-12">
                    <asp:TextBox ID="UbicacionTextBox" runat="server" class="form-control"  required="required" TextMode="MultiLine" />
                </div>
            </div>
            <div class="form-group" >
            <label for="fileImage" class="col-sm-2 control-label">Imagen</label>
                <div class="col-sm-12">
                    <asp:FileUpload ID="fileImage" runat="server" class="form-control"  required="required"  />
                </div>
            </div>
            <div style="float:right; padding-top:10px;">
                <asp:Button ID="Insert" class="btn btn-default" runat="server" Text="Crear" />
                &nbsp;&nbsp;
                <asp:linkButton ID="Cancel" runat="server" Text="Cancelar" PostBackUrl="~/Promotor/Eventos.aspx" />
            </div>
         </div>    

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

