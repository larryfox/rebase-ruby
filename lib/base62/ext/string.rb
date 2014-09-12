class String
  def to_i_62
    Base62.decode62(self)
  end
end
