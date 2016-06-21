class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name)
    super if !@data_source.respond_to?("get_#{name}_info")
    info = @data_source.send("get_#{name}_info", @id)
    price = @data_source.send("get_#{name}_price", @id)
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end

my_computer = Computer.new(42, DS.new)
my_computer.cpu # => *Cpu 2.9Ghz quad-core ($120)
my_computer.respond_to?(:cpu) # => false


####################################
# respond_to_missingのオーバーライド
####################################

class Computer
  # ...

  def responed_to_missing?(method, include_private = false)
    @data_source.respond_to?("get_#{method}_info") || super
  end
end

my_computer = Computer.new(42, DS.new)
my_computer.respond_to?(:cpu) # => true
