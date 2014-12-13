<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="SolicitudCategoria.aspx.vb" Inherits="Promotor_SolicitudCategoria" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div id="formSolicitud" >
        Categoria:
        <asp:TextBox ID="CategoriaTextBox" runat="server" />
        <br />
        Comentarios:
        <asp:TextBox ID="ComentariosTextBox" runat="server" Height="54px" Width="126px" TextMode="MultiLine" />
        <br />
        <br />
        <asp:Button ID="btnEnviar" runat="server" Text="Enviar" />
&nbsp;&nbsp;
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
        <br />
    </div>
    <br />
    <asp:SqlDataSource ID="sqlSolicitudCategoria" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DataBase %>" DeleteCommand="DELETE FROM [Solicitud_Categoria] WHERE [Id] = @original_Id AND [Id_Persona] = @original_Id_Persona AND [Categoria] = @original_Categoria AND (([Comentarios] = @original_Comentarios) OR ([Comentarios] IS NULL AND @original_Comentarios IS NULL)) AND [estado] = @original_estado AND (([fecha] = @original_fecha) OR ([fecha] IS NULL AND @original_fecha IS NULL))" InsertCommand="INSERT INTO [Solicitud_Categoria] ([Id], [Id_Persona], [Categoria], [Comentarios], [estado], [fecha]) VALUES (@Id, @Id_Persona, @Categoria, @Comentarios, @estado, @fecha)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Solicitud_Categoria]" UpdateCommand="UPDATE [Solicitud_Categoria] SET [Id_Persona] = @Id_Persona, [Categoria] = @Categoria, [Comentarios] = @Comentarios, [estado] = @estado, [fecha] = @fecha WHERE [Id] = @original_Id AND [Id_Persona] = @original_Id_Persona AND [Categoria] = @original_Categoria AND (([Comentarios] = @original_Comentarios) OR ([Comentarios] IS NULL AND @original_Comentarios IS NULL)) AND [estado] = @original_estado AND (([fecha] = @original_fecha) OR ([fecha] IS NULL AND @original_fecha IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Id_Persona" Type="Int32" />
            <asp:Parameter Name="original_Categoria" Type="String" />
            <asp:Parameter Name="original_Comentarios" Type="String" />
            <asp:Parameter Name="original_estado" Type="Int32" />
            <asp:Parameter Name="original_fecha" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Id_Persona" Type="Int32" />
            <asp:Parameter Name="Categoria" Type="String" />
            <asp:Parameter Name="Comentarios" Type="String" />
            <asp:Parameter Name="estado" Type="Int32" />
            <asp:Parameter Name="fecha" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id_Persona" Type="Int32" />
            <asp:Parameter Name="Categoria" Type="String" />
            <asp:Parameter Name="Comentarios" Type="String" />
            <asp:Parameter Name="estado" Type="Int32" />
            <asp:Parameter Name="fecha" Type="DateTime" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Id_Persona" Type="Int32" />
            <asp:Parameter Name="original_Categoria" Type="String" />
            <asp:Parameter Name="original_Comentarios" Type="String" />
            <asp:Parameter Name="original_estado" Type="Int32" />
            <asp:Parameter Name="original_fecha" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

