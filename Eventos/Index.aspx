<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Eventos_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="sqlEventos" GroupItemCount="2">
            <AlternatingItemTemplate>
                <td runat="server" style="text-align:center; background-color: #FAFAD2;color: #284775;">Promotor:
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
                <td runat="server" style="background-color: #FFFBD6;color: #333333;">Promotor:
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
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" style="width: 90%; text-align:center;">
                    <tr runat="server" style="width:50%; text-align: center;">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
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
        <asp:SqlDataSource ID="sqlEventos" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="Select p.Nombre as Promotor, e.Descripcion, e.Ubicacion, e.Fecha, e.Hora, c.Nombre as Categoría, e.Reservar, e.Tiempo_Reserva from dbo.Evento e inner join dbo.Persona p on e.Id_Persona = p.Id inner join dbo.Categoria c on e.Categoria = c.Id"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlPersona" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT * FROM [Persona]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:DataBase %>" SelectCommand="SELECT * FROM [Categoria]"></asp:SqlDataSource>
    </div>
</asp:Content>

