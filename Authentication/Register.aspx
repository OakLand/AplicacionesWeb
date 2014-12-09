<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Authentication_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <br />
        <br />Nombre:
        <asp:TextBox Text='<%# Bind("Nombre") %>' required="required" runat="server" id="NombreTextBox" />
        <br />Email:
        <asp:TextBox Text='<%# Bind("Email") %>' required="required" runat="server" id="EmailTextBox" />
        <br />Fotografia:
        <asp:FileUpload ID="image" runat="server" />
        <br />Tipo:
        <asp:DropDownList ID="Tipo" runat="server">
            <asp:ListItem Value="1">Comprador</asp:ListItem>
            <asp:ListItem Value="2">Promotor</asp:ListItem>
        </asp:DropDownList>
        <br />
        Usuario:
        <asp:TextBox ID="UserTextBox" required="required" runat="server"></asp:TextBox>
        <br />
        Contraseña:
        <asp:TextBox ID="PassTextBox" type="password" required="required" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Guardar" runat="server" Text="Guardar" />
        <asp:LinkButton ID="Cancelar" runat="server" PostBackUrl="~/Default.aspx">Cancelar</asp:LinkButton>
    </div>
    <br />
    <asp:SqlDataSource ID="sqlPersona" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DataBase %>" DeleteCommand="DELETE FROM [Persona] WHERE [Id] = @original_Id AND [Nombre] = @original_Nombre AND [Email] = @original_Email AND [Fotografia] = @original_Fotografia AND [Estado] = @original_Estado AND [Tipo] = @original_Tipo" InsertCommand="INSERT INTO [Persona] ([Id], [Nombre], [Email], [Fotografia], [Estado], [Tipo]) VALUES (@Id, @Nombre, @Email, @Fotografia, @Estado, @Tipo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Persona]" UpdateCommand="UPDATE [Persona] SET [Nombre] = @Nombre, [Email] = @Email, [Fotografia] = @Fotografia, [Estado] = @Estado, [Tipo] = @Tipo WHERE [Id] = @original_Id AND [Nombre] = @original_Nombre AND [Email] = @original_Email AND [Fotografia] = @original_Fotografia AND [Estado] = @original_Estado AND [Tipo] = @original_Tipo">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Nombre" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Fotografia" Type="Int32" />
            <asp:Parameter Name="original_Estado" Type="Int32" />
            <asp:Parameter Name="original_Tipo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Fotografia" Type="Int32" />
            <asp:Parameter Name="Estado" Type="Int32" />
            <asp:Parameter Name="Tipo" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Fotografia" Type="Int32" />
            <asp:Parameter Name="Estado" Type="Int32" />
            <asp:Parameter Name="Tipo" Type="Int32" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Nombre" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Fotografia" Type="Int32" />
            <asp:Parameter Name="original_Estado" Type="Int32" />
            <asp:Parameter Name="original_Tipo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>    
</asp:Content>

