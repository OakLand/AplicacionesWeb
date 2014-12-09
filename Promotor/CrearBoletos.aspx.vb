
Partial Class Promotor_CrearBoletos
    Inherits System.Web.UI.Page
    
    Protected Sub CrearBoletos_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Request.Cookies("Tickets")("id") Is Nothing Or Request.Cookies("Tickets")("tipo") <> 2 Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub

    Protected Sub areaPlus_Click(sender As Object, e As EventArgs)
        Me.formArea.Visible = True
    End Sub

    Protected Sub seccionPlus_Click(sender As Object, e As EventArgs)
        Me.formSeccion.Visible = True
    End Sub

    Protected Sub InsertButton_Click(sender As Object, e As EventArgs)
        Me.formArea.Visible = False
    End Sub

    Protected Sub InsertButton_Click1(sender As Object, e As EventArgs)
        Me.formSeccion.Visible = False
    End Sub

    Protected Sub terminar_Click(sender As Object, e As EventArgs)
        Response.Redirect("Eventos.aspx")
    End Sub

    Protected Sub generate_Click(sender As Object, e As EventArgs) Handles generate.Click
        Try
            Dim persona As Integer = Request.Cookies("Tickets")("id")
            Dim area As Integer = Integer.Parse(Me.Id_AreaTextBox.Text)
            Dim seccion As Integer = Integer.Parse(Me.Id_SeccionTextBox.Text)
            Dim fila As Integer = Integer.Parse(Me.FilaTextBox.Text)
            Dim no_asiento_de As Integer = Integer.Parse(Me.noAsientoDe.Text)
            Dim no_asiento_hasta As Integer = Integer.Parse(Me.noAsientoHasta.Text)
            Dim costo As Integer = Integer.Parse(Me.CostoTextBox.Text)
            Dim tipo As String = Me.TipoTextBox.Text
            Dim evento As Integer = Integer.Parse(Me.Id_EventoTextBox.Text)
            If no_asiento_hasta < no_asiento_de Then
                MsgBox("Ingrese un rango correcto")
                Me.noAsientoDe.Text = ""
                Me.noAsientoHasta.Text = ""
                Exit Sub
            End If
            For i As Integer = no_asiento_de To no_asiento_hasta
                'se guarda la info
            Next
        Catch ex As Exception

        End Try
    End Sub
End Class
