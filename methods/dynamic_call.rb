class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
end

obj = MyClass.new
obj.my_method(3) # => 6

# もしくは、Object#send を使ってMyClass#my_methodを呼び出す方法もある
obj.send(:my_method, 3) # => 6
