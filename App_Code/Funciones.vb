Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography

Public Class Funciones
    Inherits Conexion
    Dim cmd As New SqlCommand()

    Public Function Login(ByVal user As String, ByVal password As String) As Boolean
        Try
            Conectado()
            cmd = New SqlCommand("Login")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@user", user)
            cmd.Parameters.AddWithValue("@password", password)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            If dr.HasRows = True Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            MsgBox("Error al Validar: " & ex.Message)
            Return False
        Finally
            Desconectado()
        End Try
    End Function

    Public Function getId(ByVal tabla As String) As Integer
        Try
            Conectado()
            cmd = New SqlCommand("getID")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@tabla", tabla)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            If dr.HasRows = True Then
                For Each item As System.Data.Common.DbDataRecord In dr
                    Return item.GetInt32(0)
                Next
            Else
                Return 1
            End If
        Catch ex As Exception
            MsgBox("Error al obtener ID: " & ex.Message)
            Return False
        Finally
            Desconectado()
        End Try
        Return Nothing
    End Function

    Public Sub NewUser(ByVal id As Integer, ByVal id_user As Integer, ByVal nombre As String, ByVal email As String, ByVal id_imagen As Integer, ByVal imagen As String, ByVal estado As Integer, ByVal tipo As Integer, ByVal user As String, ByVal pass As String)
        Try
            Conectado()
            cmd = New SqlCommand("NewUser")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@id", id)
            cmd.Parameters.AddWithValue("@id_user", id_user)
            cmd.Parameters.AddWithValue("@nombre", nombre)
            cmd.Parameters.AddWithValue("@email", email)
            cmd.Parameters.AddWithValue("@id_imagen", id_imagen)
            cmd.Parameters.AddWithValue("@foto", imagen)
            cmd.Parameters.AddWithValue("@estado", estado)
            cmd.Parameters.AddWithValue("@tipo", tipo)
            cmd.Parameters.AddWithValue("@user", user)
            cmd.Parameters.AddWithValue("@pass", pass)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
        Catch ex As Exception
            MsgBox("Error al Crear Usuario: " & ex.Message)
        Finally
            Desconectado()
        End Try
    End Sub

    Public Function MD5(ByVal texto As String) As String
        Dim encryt As String = ""
        Try
            Dim _md5 As MD5CryptoServiceProvider
            Dim bytValue As Byte()
            Dim bytHash As Byte()
            Dim i As Integer

            _md5 = New MD5CryptoServiceProvider
            bytValue = System.Text.Encoding.UTF8.GetBytes(texto)
            bytHash = _md5.ComputeHash(bytValue)
            _md5.Clear()

            For i = 0 To bytHash.Length - 1
                encryt &= bytHash(i).ToString("x").PadLeft(2, "0")
            Next
        Catch ex As Exception
            MsgBox("Error al encriptar en MD5: " & ex.ToString)
        End Try
        Return encryt
    End Function

    Public Function getID_User(ByVal Usuario As String) As Integer
        Dim id As Integer = 0
        Try
            Conectado()
            cmd = New SqlCommand("getId_User")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@user", Usuario)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            If dr.HasRows = True Then
                For Each item As System.Data.Common.DbDataRecord In dr
                    Return item.GetInt32(0)
                Next
            Else
                Return 0
            End If
        Catch ex As Exception
            MsgBox("Error al encriptar en MD5: " & ex.ToString)
        End Try
        Return id
    End Function

    Public Function getTipo_User(ByVal Usuario As String) As Integer
        Dim id As Integer = 0
        Try
            Conectado()
            cmd = New SqlCommand("getTipo_User")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@user", Usuario)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            If dr.HasRows = True Then
                For Each item As System.Data.Common.DbDataRecord In dr
                    Return item.GetInt32(0)
                Next
            Else
                Return 0
            End If
        Catch ex As Exception
            MsgBox("Error al encriptar en MD5: " & ex.ToString)
        End Try
        Return id
    End Function
End Class
