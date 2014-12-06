<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="SolicitudCategoria.aspx.vb" Inherits="Promotor_SolicitudCategoria" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:FormView ID="formSolicitud" runat="server" DataKeyNames="Id" DataSourceID="sqlSolicitudCategoria" DefaultMode="Insert">
        <EditItemTemplate>
            Id:
            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            Id_Persona:
            <asp:TextBox ID="Id_PersonaTextBox" runat="server" Text='<%# Bind("Id_Persona") %>' />
            <br />
            Categoria:
            <asp:TextBox ID="CategoriaTextBox" runat="server" Text='<%# Bind("Categoria") %>' />
            <br />
            Comentarios:
            <asp:TextBox ID="ComentariosTextBox" runat="server" Text='<%# Bind("Comentarios") %>' />
            <br />
            estado:
            <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
            <br />
            fecha:
            <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <HeaderTemplate>
            Llene el formulario para la solicitar la creación de la categoría
        </HeaderTemplate>
        <InsertItemTemplate>
            Id:
            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
            <br />
            Id_Persona:
            <asp:TextBox ID="Id_PersonaTextBox" runat="server" Text='<%# Bind("Id_Persona") %>' />
            <br />
            Categoria:
            <asp:TextBox ID="CategoriaTextBox" runat="server" Text='<%# Bind("Categoria") %>' />
            <br />
            Comentarios:
            <asp:TextBox ID="ComentariosTextBox" runat="server" Text='<%# Bind("Comentarios") %>' />
            <br />
            estado:
            <asp:TextBox ID="estadoTextBox" runat="server" ReadOnly="True" Text="2" />
            <br />
            fecha:
            <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha", "{0:G}")%>' />
            <asp:CalendarExtender ID="fechaTextBox_CalendarExtender" runat="server" Enabled="True" TargetControlID="fechaTextBox">
            </asp:CalendarExtender>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" PostBackUrl="~/Promotor/Eventos.aspx" Text="Enviar" />
            &nbsp;
        </InsertItemTemplate>
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            Id_Persona:
            <asp:Label ID="Id_PersonaLabel" runat="server" Text='<%# Bind("Id_Persona") %>' />
            <br />
            Categoria:
            <asp:Label ID="CategoriaLabel" runat="server" Text='<%# Bind("Categoria") %>' />
            <br />
            Comentarios:
            <asp:Label ID="ComentariosLabel" runat="server" Text='<%# Bind("Comentarios") %>' />
            <br />
            estado:
            <asp:Label ID="estadoLabel" runat="server" Text='<%# Bind("estado") %>' />
            <br />
            fecha:
            <asp:Label ID="fechaLabel" runat="server" Text='<%# Bind("fecha") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
        </ItemTemplate>
    </asp:FormView>
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

