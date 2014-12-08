
Partial Class Authentication_Login
    Inherits System.Web.UI.Page
    Private funciones As New Funciones()
    
    Protected Sub Register_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Not Request.Cookies("Tickets")("id") Is Nothing Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub

    Protected Sub Login_Click(sender As Object, e As EventArgs) Handles login.Click
        If funciones.Login(Me.inputUser.Text, funciones.MD5(Me.inputPassword.Text)) Then
            Dim vCookie As New HttpCookie("Tickets")
            vCookie.Values("usuario") = Me.inputUser.Text
            vCookie.Values("id") = funciones.getID_User(Me.inputUser.Text)
            vCookie.Values("tipo") = funciones.getTipo_User(Me.inputUser.Text)
            vCookie.Expires = DateTime.Now.AddDays(1)
            Response.Cookies.Add(vCookie)
            Response.Redirect("/Default.aspx")
        Else
            InputBox("", "", funciones.MD5(Me.inputPassword.Text))
            Me.inputPassword.Text = ""
            Me.inputPassword.Focus()
        End If
    End Sub

    Protected Sub register_Click(sender As Object, e As EventArgs) Handles register.Click
        Response.Redirect("Register.aspx")
    End Sub
End Class
