Imports WebService

Partial Class Eventos_View
    Inherits System.Web.UI.Page
    Private pagos As New WebService
    Private fun As New Funciones

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridBoletos.SelectedIndexChanged
        'Dim pago As Decimal = CType(InputBox("Efectivo", "Ingrese el moto pagado"), Decimal)
        'If pagos.Pago(CType(gridBoletos.SelectedRow().Cells.Item(4).Text, Decimal), pago) Then
        fun.ReservarBoleto(CType(Request.Cookies("Tickets")("id"), Integer), CType(Request.Cookies("event").Value, Integer), gridBoletos.SelectedRow().Cells.Item(1).Text, gridBoletos.SelectedRow().Cells.Item(2).Text, CType(gridBoletos.SelectedRow().Cells.Item(3).Text, Integer))
        Response.Redirect("/Eventos/View.aspx")
        'End If
    End Sub
End Class
