<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="CrearBoletos.aspx.vb" Inherits="Promotor_CrearBoletos" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    <br />
    <div style="display: inline-block; float: left">
        Id_Persona:
        <asp:TextBox ID="Id_PersonaTextBox" runat="server" Text='<%# Bind("Id_Persona") %>' />
        <br __designer:mapid="1d" />Id_Area:
        <asp:DropDownList ID="Id_AreaTextBox" runat="server" DataSourceID="sqlArea" DataTextField="Descripcion" DataValueField="Id" SelectedValue='<%# Bind("Id_Area") %>' Width="123px">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="areaPlus" runat="server" Text="+" OnClick="areaPlus_Click" />
        <br __designer:mapid="20" />Id_Seccion:
        <asp:DropDownList ID="Id_SeccionTextBox" runat="server" DataSourceID="sqlSeccion" DataTextField="Descripcion" DataValueField="Id" SelectedValue='<%# Bind("Id_Seccion") %>' Width="126px">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="seccionPlus" runat="server" Text="+" OnClick="seccionPlus_Click" />
        <br __designer:mapid="23" />Fila:
        <asp:TextBox ID="FilaTextBox" runat="server" Text='<%# Bind("Fila") %>' />
        <br __designer:mapid="25" />No_Asiento: De
        <asp:TextBox ID="noAsientoDe" runat="server" Height="22px" Width="72px" />
        &nbsp;Hasta
        <asp:TextBox ID="noAsientoHasta" runat="server" Height="22px" Width="83px"></asp:TextBox>
        <br __designer:mapid="28" />Costo:
        <asp:TextBox ID="CostoTextBox" runat="server" Text='<%# Bind("Costo") %>' />
        <br __designer:mapid="2a" />Tipo:
        <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
        <br __designer:mapid="2c" />Id_Evento:
        <asp:DropDownList ID="Id_EventoTextBox" runat="server" DataSourceID="sqlEvento" DataTextField="Descripcion" DataValueField="Id" Height="22px" SelectedValue='<%# Bind("Id_Evento") %>' Width="132px">
        </asp:DropDownList>
        <br __designer:mapid="2e" />&nbsp;&nbsp;&nbsp;
        <asp:Button ID="generate" runat="server" OnClick="generate_Click" Text="Generar" />
&nbsp;
        <asp:Button ID="terminar" runat="server" OnClick="terminar_Click" Text="Terminar" />
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="float: left; width: 50%;">
        <ContentTemplate>
            <asp:FormView Visible="false" ID="formArea" runat="server" DataKeyNames="Id" DataSourceID="sqlArea" DefaultMode="Insert">
                <EditItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    Descripcion:
                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Nueva Área"></asp:Label>
                    <br />
                    Id:
                    <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                    <br />
                    Descripcion:
                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Guardar" OnClick="InsertButton_Click" />
                    &nbsp;
                </InsertItemTemplate>
                <ItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    Descripcion:
                    <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Bind("Descripcion") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
                </ItemTemplate>
            </asp:FormView>
            <asp:FormView Visible="false" ID="formSeccion" runat="server" DataKeyNames="Id" DataSourceID="sqlSeccion" DefaultMode="Insert">
                <EditItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    Descripcion:
                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="Nueva Sección"></asp:Label>
                    <br />
                    Id:
                    <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                    <br />
                    Descripcion:
                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Guardar" OnClick="InsertButton_Click1" />
                    &nbsp;
                </InsertItemTemplate>
                <ItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    Descripcion:
                    <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Bind("Descripcion") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
                </ItemTemplate>
            </asp:FormView>
            <br />
        </ContentTemplate>
        
    </asp:UpdatePanel>
    <div style="clear:both;">
        <br />
        <br />
        <asp:SqlDataSource ID="sqlBoleto" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DataBase %>" DeleteCommand="DELETE FROM [Boleto] WHERE [Id] = @original_Id AND (([Id_Persona] = @original_Id_Persona) OR ([Id_Persona] IS NULL AND @original_Id_Persona IS NULL)) AND [Id_Area] = @original_Id_Area AND [Id_Seccion] = @original_Id_Seccion AND (([Fila] = @original_Fila) OR ([Fila] IS NULL AND @original_Fila IS NULL)) AND (([No_Asiento] = @original_No_Asiento) OR ([No_Asiento] IS NULL AND @original_No_Asiento IS NULL)) AND [Costo] = @original_Costo AND [Tipo] = @original_Tipo AND (([Fecha_Reserva] = @original_Fecha_Reserva) OR ([Fecha_Reserva] IS NULL AND @original_Fecha_Reserva IS NULL)) AND (([Fecha_Pago] = @original_Fecha_Pago) OR ([Fecha_Pago] IS NULL AND @original_Fecha_Pago IS NULL)) AND [Id_Evento] = @original_Id_Evento" InsertCommand="INSERT INTO [Boleto] ([Id], [Id_Persona], [Id_Area], [Id_Seccion], [Fila], [No_Asiento], [Costo], [Tipo], [Fecha_Reserva], [Fecha_Pago], [Id_Evento]) VALUES (@Id, @Id_Persona, @Id_Area, @Id_Seccion, @Fila, @No_Asiento, @Costo, @Tipo, @Fecha_Reserva, @Fecha_Pago, @Id_Evento)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Boleto]" UpdateCommand="UPDATE [Boleto] SET [Id_Persona] = @Id_Persona, [Id_Area] = @Id_Area, [Id_Seccion] = @Id_Seccion, [Fila] = @Fila, [No_Asiento] = @No_Asiento, [Costo] = @Costo, [Tipo] = @Tipo, [Fecha_Reserva] = @Fecha_Reserva, [Fecha_Pago] = @Fecha_Pago, [Id_Evento] = @Id_Evento WHERE [Id] = @original_Id AND (([Id_Persona] = @original_Id_Persona) OR ([Id_Persona] IS NULL AND @original_Id_Persona IS NULL)) AND [Id_Area] = @original_Id_Area AND [Id_Seccion] = @original_Id_Seccion AND (([Fila] = @original_Fila) OR ([Fila] IS NULL AND @original_Fila IS NULL)) AND (([No_Asiento] = @original_No_Asiento) OR ([No_Asiento] IS NULL AND @original_No_Asiento IS NULL)) AND [Costo] = @original_Costo AND [Tipo] = @original_Tipo AND (([Fecha_Reserva] = @original_Fecha_Reserva) OR ([Fecha_Reserva] IS NULL AND @original_Fecha_Reserva IS NULL)) AND (([Fecha_Pago] = @original_Fecha_Pago) OR ([Fecha_Pago] IS NULL AND @original_Fecha_Pago IS NULL)) AND [Id_Evento] = @original_Id_Evento">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Id_Persona" Type="Int32" />
                <asp:Parameter Name="original_Id_Area" Type="Int32" />
                <asp:Parameter Name="original_Id_Seccion" Type="Int32" />
                <asp:Parameter Name="original_Fila" Type="Int32" />
                <asp:Parameter Name="original_No_Asiento" Type="Int32" />
                <asp:Parameter Name="original_Costo" Type="Decimal" />
                <asp:Parameter Name="original_Tipo" Type="Int32" />
                <asp:Parameter Name="original_Fecha_Reserva" Type="DateTime" />
                <asp:Parameter Name="original_Fecha_Pago" Type="DateTime" />
                <asp:Parameter Name="original_Id_Evento" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="Id_Persona" Type="Int32" />
                <asp:Parameter Name="Id_Area" Type="Int32" />
                <asp:Parameter Name="Id_Seccion" Type="Int32" />
                <asp:Parameter Name="Fila" Type="Int32" />
                <asp:Parameter Name="No_Asiento" Type="Int32" />
                <asp:Parameter Name="Costo" Type="Decimal" />
                <asp:Parameter Name="Tipo" Type="Int32" />
                <asp:Parameter Name="Fecha_Reserva" Type="DateTime" />
                <asp:Parameter Name="Fecha_Pago" Type="DateTime" />
                <asp:Parameter Name="Id_Evento" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id_Persona" Type="Int32" />
                <asp:Parameter Name="Id_Area" Type="Int32" />
                <asp:Parameter Name="Id_Seccion" Type="Int32" />
                <asp:Parameter Name="Fila" Type="Int32" />
                <asp:Parameter Name="No_Asiento" Type="Int32" />
                <asp:Parameter Name="Costo" Type="Decimal" />
                <asp:Parameter Name="Tipo" Type="Int32" />
                <asp:Parameter Name="Fecha_Reserva" Type="DateTime" />
                <asp:Parameter Name="Fecha_Pago" Type="DateTime" />
                <asp:Parameter Name="Id_Evento" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Id_Persona" Type="Int32" />
                <asp:Parameter Name="original_Id_Area" Type="Int32" />
                <asp:Parameter Name="original_Id_Seccion" Type="Int32" />
                <asp:Parameter Name="original_Fila" Type="Int32" />
                <asp:Parameter Name="original_No_Asiento" Type="Int32" />
                <asp:Parameter Name="original_Costo" Type="Decimal" />
                <asp:Parameter Name="original_Tipo" Type="Int32" />
                <asp:Parameter Name="original_Fecha_Reserva" Type="DateTime" />
                <asp:Parameter Name="original_Fecha_Pago" Type="DateTime" />
                <asp:Parameter Name="original_Id_Evento" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlSeccion" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DataBase %>" DeleteCommand="DELETE FROM [Seccion] WHERE [Id] = @original_Id AND [Descripcion] = @original_Descripcion" InsertCommand="INSERT INTO [Seccion] ([Id], [Descripcion]) VALUES (@Id, @Descripcion)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Seccion]" UpdateCommand="UPDATE [Seccion] SET [Descripcion] = @Descripcion WHERE [Id] = @original_Id AND [Descripcion] = @original_Descripcion">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Descripcion" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="Descripcion" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Descripcion" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlArea" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DataBase %>" DeleteCommand="DELETE FROM [Area] WHERE [Id] = @original_Id AND [Descripcion] = @original_Descripcion" InsertCommand="INSERT INTO [Area] ([Id], [Descripcion]) VALUES (@Id, @Descripcion)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Area]" UpdateCommand="UPDATE [Area] SET [Descripcion] = @Descripcion WHERE [Id] = @original_Id AND [Descripcion] = @original_Descripcion">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Descripcion" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="Descripcion" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Descripcion" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlEvento" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT * FROM [Evento]"></asp:SqlDataSource>
    </div>
</asp:Content>

