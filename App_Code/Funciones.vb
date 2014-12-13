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

    Public Sub NewUser(ByVal nombre As String, ByVal email As String, ByVal imagen As String, ByVal estado As Integer, ByVal tipo As Integer, ByVal user As String, ByVal pass As String)
        Try
            Conectado()
            cmd = New SqlCommand("NewUser")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@nombre", nombre)
            cmd.Parameters.AddWithValue("@email", email)
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

    Public Sub NewEvento(ByVal Id_Persona As Integer, ByVal Descripcion As String, ByVal Ubicacion As String, ByVal fecha As String, ByVal Hora As String, ByVal Categoria As Integer, ByVal Reservar As Integer, ByVal Tiempo_Reserva As Integer)
        Try
            Conectado()
            cmd = New SqlCommand("NewEvento")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@id_persona", Id_Persona)
            cmd.Parameters.AddWithValue("@descripcion", Descripcion)
            cmd.Parameters.AddWithValue("@ubicacion", Ubicacion)
            cmd.Parameters.AddWithValue("@fecha", fecha)
            cmd.Parameters.AddWithValue("@hora", Hora)
            cmd.Parameters.AddWithValue("@categoria", Categoria)
            cmd.Parameters.AddWithValue("@reservar", Reservar)
            cmd.Parameters.AddWithValue("@tiempo_reserva", Tiempo_Reserva)

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

    Public Sub cambioSolicitud(ByVal Id As Integer, ByVal Estado As Integer, ByVal Procedimiento As String)
        Try
            Conectado()
            cmd = New SqlCommand(Procedimiento)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@id", Id)
            cmd.Parameters.AddWithValue("@estado", Estado)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
        Catch ex As Exception
            MsgBox("Error al cambiar Estado: " & ex.Message)
        Finally
            Desconectado()
        End Try
    End Sub

    Public Sub nuevaSolicitudCategoria(ByVal id_persona As Integer, ByVal categoria As String, ByVal comentarios As String)
        Try
            Conectado()
            cmd = New SqlCommand("NewSolicitudCategoria")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@id_persona", id_persona)
            cmd.Parameters.AddWithValue("@categoria", categoria)
            cmd.Parameters.AddWithValue("@comentarios", comentarios)
            cmd.Parameters.AddWithValue("@estado", 2)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
        Catch ex As Exception
            MsgBox("Error al Crear la Solicitud: " & ex.Message)
        Finally
            Desconectado()
        End Try
    End Sub
End Class
