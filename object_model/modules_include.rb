module M1
  def my_method
    'my_method'
  end
end

class C
  include M1
end

class D < C
end

D.ancestors # => [D, C, M1, Object, Kernel, BasicObject]

class C2
  prepend M1
end

class D2 < C2
end

D2.ancestors # => [D2, M1, C2, Object, Kernel, BasicObject]
