# リファクタリング前のコード
def replace(array, original, replacement)
  array.map {|e| e == original ? replacement : e}
end

def test_replace
  original = ['one', 'two', 'one', 'three']
  replaced = replace(original, 'one', 'zero')
  assert_equal ['zero', 'two', 'zero', 'three'], replaced
end

# リファクタリング後のコード
class Array
  def replace(original, replacement)
    self.map {|e| e == original ? replacement : e}
  end
end

def test_replace
  original = ['one', 'two', 'one', 'three']
  replaced = original.replace('one', 'zero')
  assert_equal ['zero', 'two', 'zero', 'three'], replaced
end

# Ruby標準クラスのメソッド一覧
[].methods.grep /^re/ # => [:reverse_each, :reverse, :reverse!, :reject, :reject!, :replace, :repeated_permutation, :repeated_combination, :reduce, :remove_instance_variable, :respond_to?]
