class Computer < BasicObject
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name, *args)
    super if !@data_source.respond_to("get_#{name}_info")
    info = @data_source.send "get_#{name}_info", @id
    peice = @data_source.send "get_#{name}_peice", @id
    result = "#{name.capiterize}: #{info} ($#{price})"
    return "* #{result}" if peice >= 100
    result
  end
end
