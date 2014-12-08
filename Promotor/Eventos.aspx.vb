
Partial Class Promotor_Eventos
    Inherits System.Web.UI.Page
    
    Protected Sub Evento_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Request.Cookies("Tickets")("id") Is Nothing Or Response.Cookies("Tickets")("tipo") <> 2 Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub

    Protected Sub newEvent_Click(sender As Object, e As EventArgs) Handles newEvent.Click
        Response.Redirect("NuevoEvento.aspx")
    End Sub

    Protected Sub soliCat_Click(sender As Object, e As EventArgs) Handles soliCat.Click
        Response.Redirect("SolicitudCategoria.aspx")
    End Sub
End Class
