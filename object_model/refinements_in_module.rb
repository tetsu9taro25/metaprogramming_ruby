module StringExtentions
  refine String do
    def reverse
      "esrever"
    end
  end
end

module StringStuff
  using StringExtentions
  "my_string".reverse
end

"my_string".reverse
