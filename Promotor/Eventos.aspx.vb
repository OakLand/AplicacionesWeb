
Partial Class Promotor_Eventos
    Inherits System.Web.UI.Page

    Protected Sub newEvent_Click(sender As Object, e As EventArgs) Handles newEvent.Click
        Response.Redirect("NuevoEvento.aspx")
    End Sub
End Class
