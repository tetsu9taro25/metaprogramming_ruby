require "pry"
pry = Pry.new
pry.memory_size = 101
pry.memory_size # => 101
pry.quiet = true
Pry.memory_size # => 100
pry.reflesh(:memory_size => 99, :quiet => false)
pry.memory_size # => 99
pry.quiet # => false

#gems/pry-0.9.12.2/lib/pry/pry_instance.rb
def refresh(options={})
  defaults = {}
  attributes = [ :input, :output, :commands, :print, :quiet,
  :exception_handler, :hooks, :custom_completions,
  :prompt, :memory_size, :extra_sticky_locals ]

  attributes.each do |attribute|
    defaults[attribute] = Pry.send attribute
  end

  # ...

  defaults.merge!(options).each do |key, value|
    send("#{key}", value) if respond_to?("#{key}")
  end

  true
end

