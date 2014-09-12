class Fixnum
  def to_s_62
    Base62.encode62(self)
  end
end
