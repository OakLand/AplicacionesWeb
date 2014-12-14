
Partial Class Promotor_EditarEvento
    Inherits System.Web.UI.Page
    Private fun As New Funciones
    Private evento As New ArrayList

    Protected Sub Form_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If IsNothing(Request.Cookies("Evento")) Then
            Response.Redirect("/Default.aspx")
        End If
        Dim eve As Integer = CType(Request.Cookies("Evento").Value, Integer)
        If eve < 1 Then
            Response.Redirect("/Default.aspx")
        End If
        evento = fun.GetEvento(eve)
        Me.NombreTextBox.Text = evento.Item(2)
        Me.DescripcionTextBox.Text = evento.Item(3)
        Me.UbicacionTextBox.Text = evento.Item(4)
        Me.FechaTextBox.Text = evento.Item(5)
        Me.HoraTextBox.Text = evento.Item(6)
        Me.CategoriaTextBox.Text = evento.Item(7)
        Me.ReservarTextBox.SelectedValue = evento.Item(8)
        Me.Tiempo_ReservaTextBox.Text = evento.Item(9)
        Dim image As Integer = evento.Item(10)
        If image > 0 Then
            Dim url As String = fun.GetImage(image)
            Me.image.ImageUrl = url
        End If
    End Sub

    Protected Sub Insert_Click(sender As Object, e As EventArgs) Handles Insert.Click
        Dim foto As String = ""
        If Me.fileImage.HasFile() Then
            foto = "/assets/images/usuarios/" & Request.Cookies("Tickets")("usuario") & "_" & Me.fileImage.FileName
            'Else
            '    If evento.Item(10) <> Me.DropDownImage.SelectedValue Then

            '    End If
        End If
        Dim nombre As String = Me.NombreTextBox.Text
        Dim descripcion As String = Me.DescripcionTextBox.Text
        Dim fecha As String = Me.FechaTextBox.Text
        Dim reservar As String = Me.ReservarTextBox.SelectedValue
        Dim ubicacion As String = Me.UbicacionTextBox.Text
        Dim categoria As String = Me.CategoriaTextBox.SelectedValue
        Dim hora As String = Me.HoraTextBox.Text
        Dim dias As Integer = CType(Me.Tiempo_ReservaTextBox.Text, Integer)
    End Sub

    Protected Sub Cancel_Click(sender As Object, e As EventArgs) Handles Cancel.Click
        Response.Redirect("/Promotor/Eventos.aspx")
    End Sub

    Protected Sub DropDownImage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownImage.SelectedIndexChanged
        Dim url As String = fun.GetImage(Me.DropDownImage.SelectedValue)
        Me.image.ImageUrl = url
    End Sub
End Class
