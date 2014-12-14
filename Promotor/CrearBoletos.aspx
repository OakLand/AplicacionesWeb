<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="CrearBoletos.aspx.vb" Inherits="Promotor_CrearBoletos" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
            <div style="display: inline-block; float: left">
        Area:
        <asp:DropDownList ID="Id_AreaTextBox" runat="server" required="required" DataSourceID="sqlArea" DataTextField="Descripcion" DataValueField="Id" Width="123px">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="areaPlus" runat="server" Text="+" OnClick="areaPlus_Click" CausesValidation="False" UseSubmitBehavior="False" />
        <br />Seccion:
        <asp:DropDownList ID="Id_SeccionTextBox" runat="server" required="required" DataSourceID="sqlSeccion" DataTextField="Descripcion" DataValueField="Id" Width="126px">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="seccionPlus" runat="server" Text="+" OnClick="seccionPlus_Click" UseSubmitBehavior="False" />
        <br />Fila:
        <asp:TextBox ID="FilaTextBox" runat="server" required="required" />
        <br />No_Asiento: De
        <asp:TextBox ID="noAsientoDe" runat="server" required="required" Height="22px" Width="72px" TextMode="Number" />
        &nbsp;Hasta
        <asp:TextBox ID="noAsientoHasta" runat="server" required="required" Height="22px" Width="83px" TextMode="Number"></asp:TextBox>
        <br />Costo:
        <asp:TextBox ID="CostoTextBox" runat="server" required="required" />
        <br />Tipo:
        <asp:TextBox ID="TipoTextBox" runat="server" required="required" />
        <br />
        <br />&nbsp;&nbsp;&nbsp;
        <asp:Button ID="generate" runat="server" Text="Generar" />
&nbsp;
        <asp:Button ID="terminar" runat="server" Text="Terminar" UseSubmitBehavior="False" />
    </div>
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
        <%--</ContentTemplate>
        
    </asp:UpdatePanel>--%>
    <div style="clear:both;">
        <br />
        <br />
        
    </div>
</asp:Content>

