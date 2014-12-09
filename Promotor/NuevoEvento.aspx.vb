
Partial Class Promotor_NuevoEvento
    Inherits System.Web.UI.Page
    Private funciones As New Funciones
    
    Protected Sub NuevoEvento_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Request.Cookies("Tickets")("id") Is Nothing Or Request.Cookies("Tickets")("tipo") <> 2 Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub

    Protected Sub Insert_Click(sender As Object, e As EventArgs) Handles Insert.Click
        Dim id As Integer = funciones.getId("Evento")
        Dim id_Persona As Integer = Request.Cookies("Tickets")("id")
        Dim descripcion As String = Me.DescripcionTextBox.Text
        Dim ubicacion As String = Me.UbicacionTextBox.Text
        Dim fecha As String = Me.FechaTextBox.Text
        Dim hora As String = Me.HoraTextBox.Text
        Dim categoria As Integer = Me.CategoriaTextBox.SelectedValue
        Dim reservar As String = Me.ReservarTextBox.Text
    End Sub

    Protected Sub ReservarTextBox_SelectedIndexChanged1(sender As Object, e As EventArgs) Handles ReservarTextBox.SelectedIndexChanged
        MsgBox(ReservarTextBox.SelectedValue)
        If Me.ReservarTextBox.SelectedValue = 1 Then
            Me.Tiempo_ReservaTextBox.Enabled = True
        Else
            Me.Tiempo_ReservaTextBox.Enabled = False
        End If
    End Sub
End Class
