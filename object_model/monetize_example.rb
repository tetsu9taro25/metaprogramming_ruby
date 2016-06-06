# 数値からMonetオブジェクトを生成する方法
require "monetize"

bargain_price = Monetize.from_numeric(99, "USD")
bargain_price.format # => "$99.00"

# 上記の別方法

standard_price = 100.to_money("USD")
standard_price.format # => "$100.00"

# Monetizeのgemライブラリのソースは、実際下記のようにオープンクラスを行っている

class Numeric
  def to_money(currency = nil)
    Monetize.from_numeric(self, currency || Money.default_currency)
  end
end
