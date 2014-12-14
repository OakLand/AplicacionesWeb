
Partial Class Promotor_Seccion
    Inherits System.Web.UI.Page
    Private fun As New Funciones

    Protected Sub btnCancelSeccion_Click(sender As Object, e As EventArgs) Handles btnCancelSeccion.Click
        Response.Redirect("/Promotor/CrearBoletos.aspx")
    End Sub

    Protected Sub InsertSeccion_Click(sender As Object, e As EventArgs) Handles InsertSeccion.Click
        fun.nuevaArea_Seccion(Me.DescripcionSeccion.Text, "Seccion")
        Response.Redirect("/Promotor/CrearBoletos.aspx")
    End Sub
End Class
