
Partial Class Promotor_Area
    Inherits System.Web.UI.Page
    Private fun As New Funciones

    Protected Sub btnCancelSeccion_Click(sender As Object, e As EventArgs) Handles btnCancelArea.Click
        Response.Redirect("/Promotor/CrearBoletos.aspx")
    End Sub

    Protected Sub InsertSeccion_Click(sender As Object, e As EventArgs) Handles InsertArea.Click
        fun.nuevaArea_Seccion(Me.DescripcionArea.Text, "Area")
        Response.Redirect("/Promotor/CrearBoletos.aspx")
    End Sub
End Class
