<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="EditarCategorias.aspx.vb" Inherits="Admin_EditarCategorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table table-striped" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sqlCategorias" GridLines="None">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Categoria_Padre" HeaderText="Categoria Padre" SortExpression="Categoria_Padre" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqlCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" DeleteCommand="DELETE FROM [Categoria] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Categoria] ([Nombre], [Categoria_Padre]) VALUES (@Nombre, @Categoria_Padre)" SelectCommand="SELECT * FROM [Categoria] WHERE Id != 1" UpdateCommand="UPDATE [Categoria] SET [Nombre] = @Nombre, [Categoria_Padre] = @Categoria_Padre WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Categoria_Padre" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Categoria_Padre" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

