class String
  def integer?
    self == self.to_i.to_s
  end
end
