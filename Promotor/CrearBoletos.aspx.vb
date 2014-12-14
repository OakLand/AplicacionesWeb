
Partial Class Promotor_CrearBoletos
    Inherits System.Web.UI.Page
    Private fun As New Funciones
    
    Protected Sub CrearBoletos_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Request.Cookies("Tickets")("id") Is Nothing Or Request.Cookies("Tickets")("tipo") <> 2 Then
            Response.Redirect("/Default.aspx")
        End If
    End Sub

    Protected Sub areaPlus_Click(sender As Object, e As EventArgs) Handles areaPlus.Click
        Response.Redirect("/Promotor/Area.aspx")
    End Sub

    Protected Sub seccionPlus_Click(sender As Object, e As EventArgs) Handles seccionPlus.Click
        Response.Redirect("/Promotor/Seccion.aspx")
    End Sub

    Protected Sub generate_Click(sender As Object, e As EventArgs) Handles generate.Click
        Try
            Dim persona As Integer = Request.Cookies("Tickets")("id")
            Dim evento As Integer = Request.Cookies("Tickets")("evento")
            Dim area As Integer = Integer.Parse(Me.Id_AreaTextBox.SelectedValue)
            Dim seccion As Integer = Integer.Parse(Me.Id_SeccionTextBox.SelectedValue)
            Dim fila As Integer = Integer.Parse(Me.FilaTextBox.Text)
            Dim no_asiento_de As Integer = Integer.Parse(Me.noAsientoDe.Text)
            Dim no_asiento_hasta As Integer = Integer.Parse(Me.noAsientoHasta.Text)
            Dim costo As Decimal = Decimal.Parse(Me.CostoTextBox.Text)
            If no_asiento_hasta < no_asiento_de Then
                MsgBox("Ingrese un rango correcto")
                Me.noAsientoDe.Text = ""
                Me.noAsientoHasta.Text = ""
                Exit Sub
            End If
            fun.generate_Tickets(persona, area, seccion, fila, costo, evento, no_asiento_de, no_asiento_hasta)
            Me.Id_SeccionTextBox.ClearSelection()
            Me.Id_AreaTextBox.ClearSelection()
            Me.FilaTextBox.Text = ""
            Me.noAsientoDe.Text = ""
            Me.noAsientoHasta.Text = ""
            Me.CostoTextBox.Text = ""
        Catch ex As Exception
            MsgBox("Error al crear Boletos")
        End Try
    End Sub

    Protected Sub terminar_Click(sender As Object, e As EventArgs) Handles terminar.Click
        Response.Redirect("/Promotor/Eventos.aspx")
    End Sub
End Class
