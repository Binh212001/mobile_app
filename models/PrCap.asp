<% 
  Class PrCap
    'Private, class member variable
    Private CId
    Private PId

    ' getter and setter
    Public Property Get PrCap()
      PrCap = CId
    End Property
    Public Property Let PrCap(value)
      CId = value
    End Property
    ' getter and setter
    Public Property Get ProductId()
      ProductId = PId
    End Property
    Public Property Let ProductId(value)
      PId = value
    End Property
  End Class
%>
