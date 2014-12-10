<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Authentication_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-register" role="form">
        <h2 class="form-signin-heading">
            Ingrese sus datos para registrarse

        </h2>
        <asp:TextBox Text='<%# Bind("Id") %>' runat="server" style="display:none;" id="IdTextBox" ReadOnly="True" />
        <label for="NombreTextBox" class="sr-only">Nombre completo</label>
        <asp:TextBox Text='<%# Bind("Nombre") %>' class="form-control" runat="server" id="NombreTextBox" autofocus="autofocus" required="required" placeholder="Nombre completo"/>
        <br />
        <label for="UserTextBox" class="sr-only">Usuario</label>
        <asp:TextBox ID="UserTextBox" type="user" class="form-control" runat="server" placeholder="Usuario" required="required"></asp:TextBox>
        <br />
        <label for="PassTextBox" class="sr-only">Contraseña</label>
        <asp:TextBox ID="PassTextBox" type="password" class="form-control" runat="server" placeholder="Contraseña" required="required"></asp:TextBox>
        <br />
        <label for="EmailTextBox" class="sr-only">Email</label>
        <asp:TextBox Text='<%# Bind("Email") %>' class="form-control" runat="server" id="EmailTextBox" placeholder="Email" required="required"/>
        <br />
        <label for="image" class="sr-only">Fotografía</label>
        <asp:FileUpload ID="image" runat="server" />      
    </div>
    <div>
        <asp:DropDownList ID="Tipo" runat="server">
            <asp:ListItem Value="1">Comprador</asp:ListItem>
            <asp:ListItem Value="2">Promotor</asp:ListItem>
        </asp:DropDownList>
        
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

