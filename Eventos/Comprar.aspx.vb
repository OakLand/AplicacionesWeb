Imports iTextSharp
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports WebService
Imports System.IO
Imports iTextSharp.text.html.simpleparser

'Imports cData

Partial Class Eventos_Comprar
    Inherits System.Web.UI.Page
    Private pagos As New WebService()
    Private fun As New Funciones()
    Private FilePath As String = "C:\temp\Boleto.pdf"

    Protected Sub gridBoletos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridBoletos.SelectedIndexChanged
        Dim pago As Decimal = CType(InputBox("Efectivo", "Ingrese el moto pagado"), Decimal)
        If pagos.Pago(CType(gridBoletos.SelectedRow().Cells.Item(4).Text, Decimal), pago) Then
            'Dim vDocumento As New iTextSharp.text.Document(iTextSharp.text.PageSize.A4, 88.0F, 88.0F, 10.0F, 10.0F)
            'Dim vStream As New System.IO.MemoryStream()
            'Dim vPDFWriter As iTextSharp.text.pdf.PdfWriter = iTextSharp.text.pdf.PdfWriter.GetInstance(vDocumento, vStream)
            'Dim vCelda As iTextSharp.text.pdf.PdfPCell = Nothing
            'Dim vTabla As iTextSharp.text.pdf.PdfPTable = Nothing

            'vDocumento.Open()
            'vTabla = New iTextSharp.text.pdf.PdfPTable(3)
            'vTabla.TotalWidth = 500
            'vTabla.LockedWidth = True
            'vTabla.SetWidths(New Single() {0.2, 0.6, 0.2})


            Dim vDocumento As New iTextSharp.text.Document(iTextSharp.text.PageSize.A4, 88.0F, 88.0F, 10.0F, 10.0F)
            Dim vStream As New System.IO.MemoryStream()
            Dim vPDFWriter As iTextSharp.text.pdf.PdfWriter = iTextSharp.text.pdf.PdfWriter.GetInstance(vDocumento, vStream)
            Dim vCelda As iTextSharp.text.pdf.PdfPCell = Nothing
            Dim vTabla As iTextSharp.text.pdf.PdfPTable = Nothing

            vDocumento.Open()
            vTabla = New iTextSharp.text.pdf.PdfPTable(3)
            vTabla.TotalWidth = 500
            vTabla.LockedWidth = True
            vTabla.SetWidths(New Single() {0.2, 0.6, 0.2})

            'insertar una imagen en una de las celdas.
            Dim vImagen As iTextSharp.text.Image
            vImagen = iTextSharp.text.Image.GetInstance(MapPath(fun.GetEventImage(CType(Request.Cookies("event").Value, Integer))))
            vImagen.ScalePercent(20.0)
            vCelda = New PdfPCell(vImagen)
            vCelda.VerticalAlignment = PdfPCell.ALIGN_TOP
            vCelda.HorizontalAlignment = PdfPCell.ALIGN_CENTER
            vTabla.AddCell(vCelda)

            'insertar texto
            Dim texto As String = "Boleto Comprado" & vbCrLf
            Dim texto2 As String = "ID Evento: " & Request.Cookies("event").Value & vbCrLf
            Dim texto3 As String = "Ubicacion: " '& Me.FormView1.Row.Cells(4).Text & vbCrLf
            vDocumento.Add(New Paragraph(texto & texto2 & texto3, FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL)))

            vDocumento.AddTitle("Boleto Comprado")

            vDocumento.Close()

            Dim vArregloBytes As Byte() = vStream.ToArray()

            'Escribe fisicamente el archivo
            Dim vFS As FileStream
            If Not My.Computer.FileSystem.DirectoryExists("C:\temp") Then
                My.Computer.FileSystem.CreateDirectory("C:\temp")
            ElseIf System.IO.File.Exists(FilePath) Then
                System.IO.File.Delete(FilePath)
            End If

            vFS = New FileStream(FilePath, FileMode.CreateNew)
            vFS.Write(vArregloBytes, 0, vArregloBytes.Length)
            vFS.Flush()
            vFS.Close()


            vStream.Close()

            Dim correo As New System.Net.Mail.MailMessage()
            Dim vTexto As String

            correo.From = New System.Net.Mail.MailAddress("webapp.ceutec.2014@gmail.com")
            correo.To.Add(fun.GetEmail(Request.Cookies("Tickets")("id")))
            correo.Subject = "Calculo Impuesto Sobre la Renta"
            vTexto = "Archivo Adjunto" & vbCrLf & vbCrLf & _
                            "Fecha y hora GMT: " & _
                            DateTime.Now.ToUniversalTime.ToString("dd/MM/yyyy HH:mm:ss")
            correo.Body = vTexto
            Dim fichero As String = FilePath
            correo.Attachments.Add(New System.Net.Mail.Attachment(fichero))

            correo.IsBodyHtml = False
            correo.Priority = System.Net.Mail.MailPriority.Normal

            Dim smtp As New System.Net.Mail.SmtpClient()

            'Credenciales smtp para @gmail.com
            smtp.Host = "smtp.gmail.com"
            smtp.Port = 587
            smtp.UseDefaultCredentials = False
            smtp.Credentials = New System.Net.NetworkCredential("webapp.ceutec.2014@gmail.com", "autenticacion")
            smtp.EnableSsl = True
            '
            Try
                smtp.Send(correo)
            Catch ex As Exception
                MsgBox("Error al enviar boleto: " & ex.Message)
            End Try

            fun.ComprarBoleto(CType(Request.Cookies("Tickets")("id"), Integer), CType(Request.Cookies("event").Value, Integer), gridBoletos.SelectedRow().Cells.Item(1).Text, gridBoletos.SelectedRow().Cells.Item(2).Text, CType(gridBoletos.SelectedRow().Cells.Item(3).Text, Integer))
            Response.Redirect("/Eventos/Comprar.aspx")
        End If
    End Sub
End Class
