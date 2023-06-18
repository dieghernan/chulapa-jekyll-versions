module Jekyll
  module TagFilters
    def group_by_tags(input)
      return input unless groupable?(input)

      groups = input.group_by { |item| item_property(item, "tags") }
      groups.each_with_object([]) do |item, array|
        array << {
          "name"  => item.first.uniq.first,
          "items" => item.last,
          "size"  => item.last.size,
        }
      end
    end
  end
end