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

    Public Sub NewEvento(ByVal Id_Persona As Integer, ByVal Nombre As String, ByVal Descripcion As String, ByVal Ubicacion As String, ByVal fecha As String, ByVal Hora As String, ByVal Categoria As Integer, ByVal Reservar As Integer, ByVal Tiempo_Reserva As Integer, ByVal Imagen As String)
        Try
            Conectado()
            cmd = New SqlCommand("NewEvento")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@id_persona", Id_Persona)
            cmd.Parameters.AddWithValue("@nombre", Nombre)
            cmd.Parameters.AddWithValue("@descripcion", Descripcion)
            cmd.Parameters.AddWithValue("@ubicacion", Ubicacion)
            cmd.Parameters.AddWithValue("@fecha", fecha)
            cmd.Parameters.AddWithValue("@hora", Hora)
            cmd.Parameters.AddWithValue("@categoria", Categoria)
            cmd.Parameters.AddWithValue("@reservar", Reservar)
            cmd.Parameters.AddWithValue("@tiempo_reserva", Tiempo_Reserva)
            cmd.Parameters.AddWithValue("@imagen", Imagen)

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

    Public Function getEventoID() As Integer
        Try
            Conectado()
            cmd = New SqlCommand("getEventoId")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            If dr.HasRows = True Then
                For Each item As System.Data.Common.DbDataRecord In dr
                    Return item.GetInt32(0)
                Next
            End If
        Catch ex As Exception
            MsgBox("Error al obtener el ID: " & ex.Message)
        Finally
            Desconectado()
        End Try
        Return 0
    End Function

    Public Sub nuevaArea_Seccion(ByVal descripcion As String, ByVal tabla As String)
        Try
            Conectado()
            cmd = New SqlCommand("nuevaArea_Seccion")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@descripcion", descripcion)
            cmd.Parameters.AddWithValue("@tabla", tabla)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
        Catch ex As Exception
            MsgBox("Error al Crear el Area/Seccion: " & ex.Message)
        Finally
            Desconectado()
        End Try
    End Sub

    Public Sub generate_Tickets(ByVal persona As Integer, ByVal area As Integer, ByVal seccion As Integer, ByVal fila As Integer, ByVal costo As Decimal, ByVal evento As Integer, ByVal inicio As Integer, ByVal fin As Integer)
        Try
            Conectado()
            cmd = New SqlCommand("generateTickets")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@Id_Persona", persona)
            cmd.Parameters.AddWithValue("@Id_Area", area)
            cmd.Parameters.AddWithValue("@Id_Seccion", seccion)
            cmd.Parameters.AddWithValue("@Fila", fila)
            cmd.Parameters.AddWithValue("@Costo", costo)
            cmd.Parameters.AddWithValue("@Id_Evento", evento)
            cmd.Parameters.AddWithValue("@Inicio", inicio)
            cmd.Parameters.AddWithValue("@Fin", fin)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
        Catch ex As Exception
            MsgBox("Error al generar Boletos: " & ex.Message)
        Finally
            Desconectado()
        End Try
    End Sub

    Public Function GetEvento(ByVal Id As Integer) As ArrayList
        Dim evento As New ArrayList
        Try
            Conectado()
            cmd = New SqlCommand("GetEvento")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@id", Id)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            If dr.HasRows = True Then
                For Each item As System.Data.Common.DbDataRecord In dr
                    evento.Add(item.GetInt32(0))
                    evento.Add(item.GetInt32(1))
                    evento.Add(item.GetString(2))
                    evento.Add(item.GetString(3))
                    evento.Add(item.GetString(4))
                    evento.Add(item.GetDateTime(5))
                    evento.Add(item.GetString(6))
                    evento.Add(item.GetInt32(7))
                    evento.Add(item.GetInt32(8))
                    If Not IsNothing(item(9)) Then
                        evento.Add(item.GetInt32(9))
                    Else
                        evento.Add(0)
                    End If
                    If Not IsNothing(item(10)) Then
                        evento.Add(item.GetInt32(10))
                    Else
                        evento.Add(0)
                    End If
                Next
            End If
        Catch ex As Exception
            MsgBox("Error al Obtener Evento: " & ex.Message)
        Finally
            Desconectado()
        End Try
        Return evento
    End Function

    Public Sub UpdateEvento(ByVal Id As Integer, ByVal Id_Persona As Integer, ByVal Nombre As String, ByVal Descripcion As String, ByVal Ubicacion As String, ByVal fecha As String, ByVal Hora As String, ByVal Categoria As Integer, ByVal Reservar As Integer, ByVal Tiempo_Reserva As Integer, ByVal Imagen As String)
        Try
            Conectado()
            cmd = New SqlCommand("UpdateEvento")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@id", Id)
            cmd.Parameters.AddWithValue("@id_persona", Id_Persona)
            cmd.Parameters.AddWithValue("@nombre", Nombre)
            cmd.Parameters.AddWithValue("@descripcion", Descripcion)
            cmd.Parameters.AddWithValue("@ubicacion", Ubicacion)
            cmd.Parameters.AddWithValue("@fecha", fecha)
            cmd.Parameters.AddWithValue("@hora", Hora)
            cmd.Parameters.AddWithValue("@categoria", Categoria)
            cmd.Parameters.AddWithValue("@reservar", Reservar)
            cmd.Parameters.AddWithValue("@tiempo_reserva", Tiempo_Reserva)
            cmd.Parameters.AddWithValue("@imagen", Imagen)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
        Catch ex As Exception
            MsgBox("Error al Actualizar Evento: " & ex.Message)
        Finally
            Desconectado()
        End Try
    End Sub

    Public Function GetImage(ByVal Id As Integer) As String
        Try
            Conectado()
            cmd = New SqlCommand("GetImagen")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@id", Id)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            If dr.HasRows = True Then
                For Each item As System.Data.Common.DbDataRecord In dr
                    Return item.GetString(0)
                Next
            End If
        Catch ex As Exception
            MsgBox("Error al Obtener Imagen: " & ex.Message)
        Finally
            Desconectado()
        End Try
        Return ""
    End Function

    Public Function ComprarBoleto(ByVal persona As Integer, ByVal evento As Integer, ByVal area As String, ByVal seccion As String, ByVal fila As Integer) As Boolean
        Try
            Conectado()
            cmd = New SqlCommand("ComprarBoleto")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@id_persona", persona)
            cmd.Parameters.AddWithValue("@evento", evento)
            cmd.Parameters.AddWithValue("@area", area)
            cmd.Parameters.AddWithValue("@seccion", seccion)
            cmd.Parameters.AddWithValue("@fila", fila)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            Return dr.HasRows
        Catch ex As Exception
            MsgBox("Error al Comprar Boleto: " & ex.Message)
        Finally
            Desconectado()
        End Try
        Return False
    End Function
End Class
