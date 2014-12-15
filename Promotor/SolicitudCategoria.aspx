<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="SolicitudCategoria.aspx.vb" Inherits="Promotor_SolicitudCategoria" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../assets/css/promotor.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="page-header">Solicitud Categoria</h1>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div id="formSolicitud" class="well">
        <h4>Categoria</h4>
        <div class="input-group solicitudCat-Cat">
            <asp:TextBox ID="CategoriaTextBox" CssClass="form-control" rows="5" runat="server" required="required" TextMode="MultiLine" />
        </div>
        <h4>Comentarios</h4>
        <div class="input-group solicitudCat-Comm">
            <asp:TextBox ID="ComentariosTextBox" CssClass="form-control" rows="5" runat="server" TextMode="MultiLine" />
        </div>
        <asp:Button ID="btnEnviar" runat="server"  CssClass="btn btn-default" Text="Enviar" />
        <asp:Button ID="btnCancelar" runat="server" CssClass="btn-danger btn" Text="Cancelar" />
    </div>


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

