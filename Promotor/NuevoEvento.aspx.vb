﻿Imports System.IO

Partial Class Promotor_NuevoEvento
    Inherits System.Web.UI.Page
    Private funciones As New Funciones
    Private tempPath As String = "~/assets/images/usuarios/"

    Protected Sub NuevoEvento_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Request.Cookies("Tickets")("id") Is Nothing Or Request.Cookies("Tickets")("tipo") <> 2 Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub

    Protected Sub Insert_Click(sender As Object, e As EventArgs) Handles Insert.Click
        Dim foto As String = ""
        Dim user As String = Request.Cookies("Tickets")("usuario")
        If Me.fileImage.HasFile Then
            Me.fileImage.SaveAs(Server.MapPath(Path.Combine(tempPath, user & "_" & Me.fileImage.FileName)))
            foto = Me.tempPath & user & "_" & Me.fileImage.FileName
        End If

        Dim id_Persona As Integer = Request.Cookies("Tickets")("id")
        Dim nombre As String = Me.NombreTextBox.Text
        Dim descripcion As String = Me.DescripcionTextBox.Text
        Dim ubicacion As String = Me.UbicacionTextBox.Text
        Dim fecha As String = Me.FechaTextBox.Text
        Dim hora As String = Me.HoraTextBox.Text
        Dim categoria As Integer = Me.CategoriaTextBox.SelectedValue
        Dim reservar As Integer = Me.ReservarTextBox.SelectedValue
        Dim tiempo_reserva As Integer = CType(Me.Tiempo_ReservaTextBox.Text, Integer)
        funciones.NewEvento(id_Persona, nombre, descripcion, ubicacion, fecha, hora, categoria, reservar, tiempo_reserva, foto)
        Dim vCookie As HttpCookie = Request.Cookies("Tickets")
        vCookie.Values("evento") = funciones.getEventoID()
        Response.Cookies.Add(vCookie)
        Response.Redirect("/Promotor/CrearBoletos.aspx")
    End Sub

    Protected Sub ReservarTextBox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ReservarTextBox.SelectedIndexChanged
        If Me.ReservarTextBox.SelectedValue = 1 Then
            Me.Tiempo_ReservaTextBox.Enabled = True
        Else
            Me.Tiempo_ReservaTextBox.Enabled = False
        End If
    End Sub
End Class
