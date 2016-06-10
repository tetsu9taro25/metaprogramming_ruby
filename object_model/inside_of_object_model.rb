##########################
# 2.2.1 オブジェクトの中身
##########################

class MyClass
  def my_method
    @v = 1
  end
end

obj = MyClass.new
obj.class # => MyClass

# インスタンス変数
obj.my_method
obj.instance_variables # => [:@v]

# メソッド
obj.methods.grep(/my/) # => [:my_method]
obj # => #<MyClass:0x007f911a919260 @v=1>

# my_methodはMyClassのインスタンスメソッドと呼ぶべき。
# クラスに着目しているときは「インスタンスメソッド」。オブジェクトに注目しているときは「メソッド」。
# 補足：オブジェクトのインスタンス変数はオブジェクトに住んでいる。そして、オブジェクトのメソッドはオブジェクトのクラスに住んでいる。同じクラスのオブジェクトでもインスタンス変数を共有しないのはこのため。

String.instance_methods == "abc".methods # => true
String.methods == "abc".methods # => false

# クラスの真相
# 「クラスはオブジェクト」

"hello".class # => String
String.class # => Class

# クラスのメソッドは、Classクラスのインスタンスメソッド
Class.instance_methods(false) # => [:allocate, :new, :superclass] (引数のfalseは、「継承したメソッドは無視せよ」という意味)
# allocateメソッドは、newメソッドを補助するもの。initializeを呼びださないでインスタンスを生成する。

# Rubyのクラスはスーパークラスを継承している。
Array.superclass # => Object
Object.superclass # => BasicObject
BasicObject.superclass # => nil

# Classのスーパークラスは??
Class.superclass # => Module
# 全てのクラスはモジュール！

# クラスの参照を保持できる
my_class = MyClass
# 左は変数,右は定数。クラスはオブジェクト。クラス名は定数。

# 定数 外側の定数と内側の定数は違う！！
module MyModule
  MyConstant = '外側の定数'

  class MyClass
    MyConstant = '内側の定数'
  end
end

# 定数のパス
module M
  class C
    X = 'あるていすう'
  end

  C::X # => "あるていすう"
end
M::C::X # => "あるていすう"

# 外部の定数を絶対パスで指定する。
Y = 'ルートレベルの定数'

module M
  Y = 'Mにある定数'
  Y # => "Mにある定数"
  ::Y # => "ルートレベルの定数"
end

# Moduleクラスに関するメソッド。インスタンスメソッドと、クラスメソッドを持っている。
# インスタンスメソッドのModule#constantsは現在のスコープの定数全てを返す。
# クラスメソッドのModule.constantsは、現在のプログラムのトップレベル定数を返す。
M.constants # => [:C, :Y]
Module.constants.include? :Object # => true
Module.constants.include? :Module # => true

# パスが必要であればModule.nesting
module M
  class C
    module M2
      Module.nesting # => [M::C::M2, M::C, M]
    end
  end
end

# 他のモジュール名とクラス名がかぶってしまう場合、クラスをネームスペースでラップすれば良い
module Bookworm
  class Text
  # ...
