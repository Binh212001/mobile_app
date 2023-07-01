<% 
  Class Phone
    'Private, class member variable
    Private p_id
    Private p_name
    Private p_desc
    Private p_price
    Private p_iamge
    Private p_cat
    Private p_qty
    Private p_status

    

      ' getter and setter
    Public Property Get Id()
      Id = p_id
    End Property
    Public Property Let Id(value)
      p_id = value
    End Property

    ' getter and setter
    Public Property Get Name()
      Name = p_name
    End Property
    Public Property Let Name(value)
      p_name = value
    End Property

   ' getter and setter
    Public Property Get Desc()
      Desc = p_desc
    End Property

    Public Property Let Desc(value)
      p_desc = value
    End Property

    Public Property Get Price()
      Price = p_price
    End Property

    Public Property Let Price(value)
      p_price = value
    End Property
    
    Public Property Get Cat()
      Cat = p_cat
    End Property

    Public Property Let Cat(value)
      p_cat = value
    End Property

      Public Property Get Qty()
      Qty = p_qty
    End Property

    Public Property Let Qty(value)
      p_qty = value
    End Property
    
    Public Property Get Img()
      Img = p_iamge
    End Property

    Public Property Let Img(value)
      p_iamge = value
    End Property

    Public Property Get Status()
      Status = p_status
    End Property

    Public Property Let Status(value)
      p_status = value
    End Property
    
  End Class
%>
