
Partial Class Promotor_SolicitudCategoria
    Inherits System.Web.UI.Page
    Private fun As New Funciones
    
    Protected Sub Solicitud_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Request.Cookies("Tickets")("id") Is Nothing Or Request.Cookies("Tickets")("tipo") <> 2 Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Dim id_Persona As Integer = Request.Cookies("Tickets")("id")
        Dim categoria As String = Me.CategoriaTextBox.Text
        Dim comentarios As String = Me.ComentariosTextBox.Text
        fun.nuevaSolicitudCategoria(id_Persona, categoria, comentarios)
        Response.Redirect("/Promotor/Eventos.aspx")
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("/Promotor/Eventos.aspx")
    End Sub
End Class
