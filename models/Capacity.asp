<% 
  Class Capacity
    'Private, class member variable
    Private p_rom
    Private p_ram
    Private p_id

      ' getter and setter
    Public Property Get Id()
      Id = p_id
    End Property
    Public Property Let Id(value)
      p_id = value
    End Property

    ' getter and setter
    Public Property Get Rom()
      Rom = p_rom
    End Property
    Public Property Let Rom(value)
      p_rom = value
    End Property

   ' getter and setter
    Public Property Get Ram()
      Ram = p_ram
    End Property

    Public Property Let Ram(value)
      p_ram = value
    End Property
    
  End Class
%>
