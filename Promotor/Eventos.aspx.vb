
Partial Class Promotor_Eventos
    Inherits System.Web.UI.Page
    
    Protected Sub Evento_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'MsgBox(Response.Cookies("Tickets")("tipo"))
        If Request.Cookies("Tickets")("id") Is Nothing Or Request.Cookies("Tickets")("tipo") <> 2 Then
            Response.Redirect("/Default.aspx")
        End If
        Dim vCookie As New HttpCookie("Usuario")
        vCookie.Value = Request.Cookies("Tickets")("id")
        vCookie.Expires = DateTime.Now.AddDays(1)
        Response.Cookies.Add(vCookie)
    End Sub

    Protected Sub newEvent_Click(sender As Object, e As EventArgs) Handles newEvent.Click
        Response.Redirect("NuevoEvento.aspx")
    End Sub

    Protected Sub soliCat_Click(sender As Object, e As EventArgs) Handles soliCat.Click
        Response.Redirect("SolicitudCategoria.aspx")
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim id As Integer = CType(GridView1.SelectedRow().Cells.Item(1).Text, Integer)
        Dim vCookie As New HttpCookie("Evento")
        vCookie.Value = id
        vCookie.Expires = DateTime.Now.AddDays(1)
        Response.Cookies.Add(vCookie)
        Response.Redirect("/Promotor/EditarEvento.aspx")
    End Sub
End Class
