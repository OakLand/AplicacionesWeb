
Partial Class Promotor_SolicitudCategoria
    Inherits System.Web.UI.Page
    
    Protected Sub Solicitud_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Request.Cookies("Tickets")("id") Is Nothing Or Response.Cookies("Tickets")("tipo") <> 2 Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub
End Class
