<% 
  Class User
    'Private, class member variable
    Private p_id
    Private p_displayName
    Private p_phone
    Private p_address



      ' getter and setter
    Public Property Get Id()
      Id = p_id
    End Property
    Public Property Let Id(value)
      id = value
    End Property

    

    ' getter and setter
    Public Property Get DisplayName()
      DisplayName = p_displayName
    End Property
    Public Property Let DisplayName(value)
      displayName = value
    End Property    ' getter and setter

    Public Property Get Phone()
      Phone = p_phone
    End Property
    Public Property Let Phone(value)
      phone = value
    End Property

    Public Property Get address()
      Address = p_address
    End Property
    Public Property Let Address(value)
      address = value
    End Property


  End Class
%>
