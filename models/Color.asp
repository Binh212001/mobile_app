<% 
  Class Color
    'Private, class member variable
    Private p_color
      Private p_id

      ' getter and setter
    Public Property Get Id()
      Id = p_id
    End Property
    Public Property Let Id(value)
      p_id = value
    End Property

    

    ' getter and setter
    Public Property Get Color()
      Color = p_color
    End Property
    Public Property Let Color(value)
      p_color = value
    End Property


  End Class
%>
