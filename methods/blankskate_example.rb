class Blankslate
  # Hide the method name +name+ in the BlankSlate class. Don't
  # hide +instance_eval+ or any method beginning with "__".
  def self.hide(name)
    # ...
    if instance_methods.include?(name._blankslate_as_name) &&
      name !~ /^(__|instance_eval$)/
      undef_method name
    end
    # ...

    instance_methods.each { |m| hide(m) }
  end
end
