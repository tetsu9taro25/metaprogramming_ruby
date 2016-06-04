class Entity
  attr_reader :table, :indent

  def initialize(table, indent)
    @table = table
    @indent = indent
    Database.sql "INSERT INTO #{@table} (id) VALUES (#{@indent})"
  end

  def set(col, val)
    Database.sql "UPDATE #{@table} SET #{col}='#{val}' WHERE id=#{@indent}"
  end

  def get(col)
    Database.sql("SELECT #{col} FROM #{@table} WHERE id=#{@indent}")[0][0]
  end
end

class Movie < Entity
  def initialize(indent)
    super "movies", indent
    # このsuperはEnityクラスのinitializeメソッドを、引数"movies",indentとして呼び出している。
    # superは継承階層の上位の同名メソッドを呼び出すもの。
  end

  def title
    get "title"
  end

  def title=(value)
    set "title", value
  end

  def director
    get "director"
  end

  def director=(value)
    set "director", value
  end
end

# 実行コマンド
movie = Movie.new(1)
movie.title = "博士の異常な愛情"
movie.director = "スタンリー・キューブリック"


###################################################################################
# Active Record(オブジェクトとデータベースのマッピングを行うRubyライブラリ)を使うと
###################################################################################

class Movie < ActiveRecord::Base
end

# 実行コマンド
movie = Movie.create
movie.title = "博士の異常な愛情"
movie.title # => "博士の異常な愛情"

