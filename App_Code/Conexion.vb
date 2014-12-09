Imports System.Data.Sql
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Imports System.Data

Public Class Conexion
    Public Shared cnn As New SqlConnection

    Public Shared Function Conectado() As Boolean
        Try
            cnn = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Luis\Desktop\Repos\AplicacionesWeb\App_Data\AplicacionesWebDB.mdf;Integrated Security=True")
            cnn.Open()
            Return True
        Catch ex As Exception
            MsgBox("Error de Conexión: " + ex.Message)
            Return False
        End Try

    End Function

    Public Shared Function Desconectado() As Boolean
        Try
            If cnn.State = ConnectionState.Open Then
                cnn.Close()
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            MsgBox("Error de Conexión: " + ex.Message)
            Return False
        End Try
    End Function
End Class
