<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Authentication_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-register" role="form">
        <h2 class="form-signin-heading">
            Ingrese sus datos para registrarse
        </h2>
        <div class="form-group">
            <label for="NombreTextBox" class="col-sm-2 control-label">Nombre</label>
            <div class="col-sm-12">
                 <asp:TextBox Text='<%# Bind("Nombre") %>' class="form-control" runat="server" id="NombreTextBox" autofocus="autofocus" required="required" placeholder="Nombre completo"/>
            </div>
   
        </div>
        <div class="form-group">
            <label for="UserTextBox" class="col-sm-2 control-label">Usuario</label>
            <div class="col-sm-12">
                 <asp:TextBox ID="UserTextBox" type="user" class="form-control" runat="server" placeholder="Usuario" required="required"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="PassTextBox" class="col-sm-2 control-label">Contraseña</label>
            <div class="col-sm-12">
                 <asp:TextBox ID="PassTextBox" type="password" class="form-control" runat="server" placeholder="Contraseña" required="required"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="EmailTextBox" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-12">
                 <asp:TextBox Text='<%# Bind("Email") %>' class="form-control" runat="server" id="EmailTextBox" placeholder="Email" required="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="image" class="col-sm-2 control-label">Fotografía</label>
            <div class="col-sm-12">
                 <asp:FileUpload ID="image" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label for="image" class="col-sm-6 control-label">Tipo de usuario</label>
            <div class="col-sm-12">
                 <asp:DropDownList ID="Tipo" CssClass="form-control" runat="server">
                    <asp:ListItem Value="1">Comprador</asp:ListItem>
                    <asp:ListItem Value="2">Promotor</asp:ListItem>
                </asp:DropDownList> 
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">          
            <asp:Button ID="Guardar" runat="server" style="margin-top: 10px;" CssClass="btn-default btn btn-primary"  Text="Guardar" />
            <asp:LinkButton ID="Cancelar" style="margin-top: 10px;" runat="server" PostBackUrl="~/Default.aspx">Cancelar</asp:LinkButton>
            </div>
        </div>
        
    </div>
    <div>
        
        
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

