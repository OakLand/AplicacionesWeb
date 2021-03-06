﻿Imports System.IO

Partial Class Authentication_Register
    Inherits System.Web.UI.Page
    Private funciones As New Funciones()
    Private tempPath As String = "~/assets/images/usuarios/"

    Protected Sub Register_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Not Request.Cookies("Tickets")("id") Is Nothing Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub

    Protected Sub Guardar_Click(sender As Object, e As EventArgs) Handles Guardar.Click
        Dim usuario As String = Me.UserTextBox.Text
        If (Not Me.funciones.userExists(usuario)) Then
            Dim foto As String = ""
            Dim tipo As Integer = CType(Me.Tipo.SelectedValue(), Integer)
            If (Not Me.image.HasFile And tipo <> 2) Then
                Exit Sub
            End If
            If Me.image.HasFile Then
                Me.image.SaveAs(Server.MapPath(Path.Combine(tempPath, Me.UserTextBox.Text & "_" & Me.image.FileName)))
                foto = Me.tempPath & Me.UserTextBox.Text & "_" & Me.image.FileName
            End If
            Dim estado As Integer = 1
            If tipo <> 1 Then
                estado = 2
            End If
            Dim nombre As String = Me.NombreTextBox.Text
            Dim email As String = Me.EmailTextBox.Text
            Dim user As String = Me.UserTextBox.Text
            Dim pass As String = funciones.MD5(Me.PassTextBox.Text)
            Me.funciones.NewUser(nombre, email, foto, estado, tipo, user, pass)
            Dim vCookie As New HttpCookie("Tickets")
            If tipo = 1 Then
                vCookie.Values("usuario") = user
                vCookie.Values("id") = ID
                vCookie.Values("tipo") = tipo
            End If
            vCookie.Expires = DateTime.Now.AddDays(1)
            Response.Cookies.Add(vCookie)
            Response.Redirect("/Default.aspx")
        End If
    End Sub

    Protected Sub Cancelar_Click(sender As Object, e As EventArgs) Handles Cancelar.Click
        Response.Redirect("/Default.aspx")
    End Sub
End Class
