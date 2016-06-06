def to_alphanumeric(s)
  s.gsub(/[^\w\s]/, '')
end

require 'test/unit'

class ToAlphanumericTest < Test::Unit::TestCase
  def test_strips_non_alphanumeric_characters
    assert_equal '3 the Magic Number', to_alphanumeric('#3, the *Magic, Number*?')
  end
end

##############################################
# 上記をリファクタリングするメタプログラミング
##############################################

class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end

require 'test/unit'

class StringExtensionsTest < Test::Unit::TestCase
  def test_strip_non_alphanumeric_characters
    assert_equal '3 the Magic Number', '#3, the *Magic, Number*?'.to_alphanumeric
  end
end

##########################################
# クラス定義の中に好きなコードを配置できる
##########################################

3.times do
  class C
    puts "Hello"
  end
end

# => Hello
#    Hello
#    Hello


##########################################
# オープンクラス
##########################################

class D
  def x; 'x'; end
end

class D
  def y; 'y'; end
end

obj = D.new
obj.x # => "x"
obj.y # => "y"

