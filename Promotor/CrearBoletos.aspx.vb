
Partial Class Promotor_CrearBoletos
    Inherits System.Web.UI.Page

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
End Class
