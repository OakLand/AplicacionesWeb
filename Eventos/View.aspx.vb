
Partial Class Eventos_View
    Inherits System.Web.UI.Page
    Shadows user As Integer = 1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.Cookies("WebApp") Is Nothing Then
            user = Server.HtmlEncode(Request.Cookies("Ticket")("user"))
        End If
        'Me.sqlEvento.ConnectionString = "ConnectionStrings:DataBase"
        Me.sqlEvento.SelectCommand = "SELECT Persona.Nombre AS Promotor, Evento.Descripcion AS Descripción, Evento.Ubicacion AS Ubicación, Categoria.Nombre AS Categoría, Evento.Fecha, Evento.Hora, Evento.Reservar, Evento.Tiempo_Reserva AS [Tiempo de Reserva], (SELECT COUNT(*) AS Expr1 FROM Boleto) AS Cantidad FROM Evento INNER JOIN Persona ON Evento.Id_Persona = Persona.Id INNER JOIN Categoria ON Evento.Categoria = Categoria.Id WHERE (Persona.Id = " & Me.user & ")"
        'Dim sqlcommand As New SqlDataSource(connectionString:="DataBase", selectCommand:="SELECT Persona.Nombre AS Promotor, Evento.Descripcion AS Descripción, Evento.Ubicacion AS Ubicación, Categoria.Nombre AS Categoría, Evento.Fecha, Evento.Hora, Evento.Reservar, Evento.Tiempo_Reserva AS [Tiempo de Reserva], (SELECT COUNT(*) AS Expr1 FROM Boleto) AS Cantidad FROM Evento INNER JOIN Persona ON Evento.Id_Persona = Persona.Id INNER JOIN Categoria ON Evento.Categoria = Categoria.Id WHERE (Persona.Id = " & Me.user & ")")
    End Sub
End Class
