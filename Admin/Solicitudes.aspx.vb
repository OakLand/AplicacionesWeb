Imports System.Windows.Forms

Partial Class Admin_Solicitudes
    Inherits System.Web.UI.Page
    Private fun As New Funciones

    Protected Sub Form_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Request.Cookies("Tickets")("id") Is Nothing Or Request.Cookies("Tickets")("tipo") <> 3 Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub

    Protected Sub gridSolicitudes_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridSolicitudes.SelectedIndexChanged
        Dim estado As Integer = CType(gridSolicitudes.SelectedRow().Cells.Item(3).Text, Integer)
        Dim id As Integer = CType(gridSolicitudes.SelectedRow().Cells.Item(1).Text, Integer)
        Dim nombre As String = gridSolicitudes.SelectedRow().Cells.Item(2).Text
        Me.lblId.Text = id
        If estado = 2 Or estado = 0 Then
            Me.cmdAceptar.Visible = True
        End If
        If estado = 2 Then
            Me.cmdRechazar.Visible = True
        End If
    End Sub

    Protected Sub cmdAceptar_Click(sender As Object, e As EventArgs) Handles cmdAceptar.Click
        If Not IsNothing(Me.lblId.Text) And Not Me.lblId.Text.Equals("") Then
            fun.cambioSolicitud(CType(Me.lblId.Text, Integer), 1, "cambioSolicitud")
        End If
        Response.Redirect("/Admin/Solicitudes.aspx")
    End Sub

    Protected Sub cmdRechazar_Click(sender As Object, e As EventArgs) Handles cmdRechazar.Click
        If Not IsNothing(Me.lblId.Text) And Not Me.lblId.Text.Equals("") Then
            fun.cambioSolicitud(CType(Me.lblId.Text, Integer), 0, "cambioSolicitud")
        End If
        Response.Redirect("/Admin/Solicitudes.aspx")
    End Sub
End Class
