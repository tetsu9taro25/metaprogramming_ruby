module StringExtentions
  refine String do
    def to_alphanumeric
      gsub(/[^\w\s]/, '')
    end
  end
end

using StringExtentions # これがないと動かない

"my *1st* refinement!".to_alphanumeric
