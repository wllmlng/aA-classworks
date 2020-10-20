class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    value = self[0] % self.length
    value.hash
    # length = self.length
    # object_id = self.object_id
    # (length + object_id).hash
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end