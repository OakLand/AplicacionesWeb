<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Eventos_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function crearCookie(id) {
            var num = id.substring(8);
            var d = new Date();
            d.setDate(d.getDate + 1);
            document.cookie = "event=" + num + "; expires=" + d;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">

        <asp:ListView ID="ListView1" runat="server" DataSourceID="sqlEventos" GroupItemCount="2">
            <AlternatingItemTemplate>
                <div id="Div1" runat="server" class="col-md-3 col-sm-6 hero-feature">
                    <div class="thumbnail">
                        <img src="http://placehold.it/800x500" alt="">
                        <div class="caption">
                            <h3>Titulo 2</h3>
                            <p><%# Eval("Descripcion") %></p>
                            <p><%# Eval("Ubicacion") %></p>
                            <p><%# Eval("Fecha") %></p>
                            <p><%# Eval("Hora") %></p>
                            <p>
                                <a href="#" class="btn btn-primary">Comprar!</a> <a href="#" class="btn btn-default">Más información</a>
                            </p>
                        </div>
                    </div>
                </div>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #FFCC66;color: #000080;">Promotor:
                    <asp:TextBox ID="PromotorTextBox" runat="server" Text='<%# Bind("Promotor") %>' />
                    <br />Descripcion:
                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    <br />Ubicacion:
                    <asp:TextBox ID="UbicacionTextBox" runat="server" Text='<%# Bind("Ubicacion") %>' />
                    <br />Fecha:
                    <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
                    <br />Hora:
                    <asp:TextBox ID="HoraTextBox" runat="server" Text='<%# Bind("Hora") %>' />
                    <br />Categoría:
                    <asp:TextBox ID="CategoríaTextBox" runat="server" Text='<%# Bind("Categoría") %>' />
                    <br />Reservar:
                    <asp:TextBox ID="ReservarTextBox" runat="server" Text='<%# Bind("Reservar") %>' />
                    <br />Tiempo_Reserva:
                    <asp:TextBox ID="Tiempo_ReservaTextBox" runat="server" Text='<%# Bind("Tiempo_Reserva") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    <br /></td>
            </EditItemTemplate>

            <EmptyDataTemplate>
                <table runat="server" style="width: 100%; background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td style="text-align: center">No hay Eventos Disponibles.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Promotor:
                    <asp:TextBox ID="PromotorTextBox" runat="server" Text='<%# Bind("Promotor") %>' />
                    <br />Descripcion:
                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    <br />Ubicacion:
                    <asp:TextBox ID="UbicacionTextBox" runat="server" Text='<%# Bind("Ubicacion") %>' />
                    <br />Fecha:
                    <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
                    <br />Hora:
                    <asp:TextBox ID="HoraTextBox" runat="server" Text='<%# Bind("Hora") %>' />
                    <br />Categoría:
                    <asp:TextBox ID="CategoríaTextBox" runat="server" Text='<%# Bind("Categoría") %>' />
                    <br />Reservar:
                    <asp:TextBox ID="ReservarTextBox" runat="server" Text='<%# Bind("Reservar") %>' />
                    <br />Tiempo_Reserva:
                    <asp:TextBox ID="Tiempo_ReservaTextBox" runat="server" Text='<%# Bind("Tiempo_Reserva") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <div runat="server" class="col-md-3 col-sm-6 hero-feature">
                    <div class="thumbnail">
                        <img src="<%# Eval("Imagen") %>" alt="" width="150" height="150">
                        <div class="caption">
                            <p style="display: none"><%# Eval("Id") %></p>
                            <h3><%# Eval("Nombre") %></h3>
                            <p><%# Eval("Descripcion") %></p>
                            <p><%# Eval("Ubicacion") %></p>
                            <p><%# Eval("Fecha") %></p>
                            <p><%# Eval("Hora") %></p>
                            <p>
                                <%--<asp:Button ID="btnComprar" Text="Comprar!" runat="server" CausesValidation="False" class="btn btn-primary" OnClientClick="crearCookie()" />
                                <asp:Button ID="btnCancelar" Text="Más información" runat="server" CausesValidation="False" class="btn btn-default" />--%>
                                <a id="Comprar_<%# Eval("Id") %>" onclick="crearCookie(this.id)" href="/Eventos/Comprar.aspx" class="boton btn btn-primary">Comprar!</a> 
                                <a id="Info_<%# Eval("Id") %>" onclick="crearCookie(this.id)" href="/Eventos/View.aspx" class="boton btn btn-default">Más información</a>
                            </p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
<<<<<<< HEAD
            <LayoutTemplate>
                <div class="row text-center" id="groupPlaceholderContainer" runat="server">
                    <div id="groupPlaceholder" runat="server"></div>
                </div> 
                
                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">Promotor:
                    <asp:Label ID="PromotorLabel" runat="server" Text='<%# Eval("Promotor") %>' />
                    <br />Descripcion:
                    <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                    <br />Ubicacion:
                    <asp:Label ID="UbicacionLabel" runat="server" Text='<%# Eval("Ubicacion") %>' />
                    <br />Fecha:
                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                    <br />Hora:
                    <asp:Label ID="HoraLabel" runat="server" Text='<%# Eval("Hora") %>' />
                    <br />Categoría:
                    <asp:Label ID="CategoríaLabel" runat="server" Text='<%# Eval("Categoría") %>' />
                    <br />Reservar:
                    <asp:Label ID="ReservarLabel" runat="server" Text='<%# Eval("Reservar") %>' />
                    <br />Tiempo_Reserva:
                    <asp:Label ID="Tiempo_ReservaLabel" runat="server" Text='<%# Eval("Tiempo_Reserva") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <asp:SqlDataSource ID="sqlEventos" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT p.Nombre AS Promotor, e.Descripcion, e.Ubicacion, e.Fecha, e.Hora, c.Nombre AS Categoría, e.Reservar, e.Tiempo_Reserva, e.Nombre, i.Imagen, e.Id FROM Evento AS e INNER JOIN Persona AS p ON e.Id_Persona = p.Id INNER JOIN Categoria AS c ON e.Categoria = c.Id INNER JOIN Imagenes AS i ON e.Id = i.Id"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlPersona" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT * FROM [Persona]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT * FROM [Categoria]"></asp:SqlDataSource>
    </div>
</asp:Content>

