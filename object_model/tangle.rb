module Printable
  def print
    # ...
  end

  def prepare_cover
    # ...
  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
    # ...
  end

  def print
    # ...
  end
end

class Book
  include Document
  include Printable
  # ...
end
Book.ancestors


# 他ソースが下記となっている場合
#b = Book.new
#b.print_to_screen
# Document#printを呼び出す事はできない。なぜならprint_to_screen内のselfのメソッドと判別されたprintは、継承チェーンをBookから探索され、Bookの次に来るPrintableで発見されたPrintable#printを実行してしまうから。
# 解決策はPrintableとDocumentの順番を入れ替えること
class Book
  include Printable
  include Document
  # ...
end
Book.ancestors
