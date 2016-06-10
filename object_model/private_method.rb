class C
  def public_method
    # self.private_method
    # この状態だと下記エラーが出る
    # NoMethodError: private method `private_method' called for #<C:0x007fdeb398d7c8>
    # from object_model/private_method.rb:3:in `public_method'
    #    from object_model/private_method.rb:12
    #     from /usr/bin/irb:12:in `<main>'

    private_method
    # => nil 通った。
    # privateのメソッドにアクセスする際には暗黙的なレシーバselfに対するものでなければいけない
  end

  private

  def private_method
  end
end

C.new.public_method
