
Partial Class Admin_EditarCategorias
    Inherits System.Web.UI.Page

    Protected Sub Form_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Request.Cookies("Tickets")("id") Is Nothing Or Request.Cookies("Tickets")("tipo") <> 3 Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub
End Class
