
Partial Class Master
    Inherits System.Web.UI.MasterPage

    Protected Sub Master_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Request.Cookies("Tickets") Is Nothing Then
            Dim vCookie As New HttpCookie("Tickets")
            vCookie.Expires = DateTime.Now.AddDays(1)
            Response.Cookies.Add(vCookie)
        End If
        If Not Request.Cookies("Tickets")("usuario") Is Nothing Then
            Me.user.Text = Request.Cookies("Tickets")("usuario")
        End If
    End Sub
End Class

