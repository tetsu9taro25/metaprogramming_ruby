class MyClass
  def testing_self
    @var = 10   # selfのインスタンス変数
    my_method   # self.my_methodと同じ
    self
  end

  def my_method
    @var = @var + 1
  end
end

obj = MyClass.new
obj.testing_self # => #<MyClass:0x007feb53a21908 @var=11>
