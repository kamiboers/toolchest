class Cart
  attr_reader :contents, :notice

  def initialize(session_contents)
    @contents = session_contents || {}
    # @notice = ""
  end

  def add_tool(tool_id)
    @contents[tool_id] ||= 0
    @contents[tool_id] += 1
  end

  def toolbag
    @toolbag ||= @contents.transform_keys { |key| Tool.find(key) }
  end

  def total
    toolbag.inject(0) do |sum, hash|
      sum += hash.first.price * hash.second
    end
  end

  def clear_contents
    @contents = {}
  end

  def quantity
    @contents.values.sum
  end

  def remove(tool_id)
    @contents.delete(tool_id)
  end

  def pluralize?
    quantity == 1 ? "Item" : "Items"
  end

  def update_quantity(new_data)
    if new_data[:quantity].to_i == 0
      @contents.delete(new_data[:tool_id])
    # flash alert "item removed"
    else
      @contents[new_data[:tool_id]] = new_data[:quantity].to_i
    end

  end

  def subtotal(tool_id)
    tool = Tool.find(tool_id)
    tool.price * @toolbag[tool]
  end
end
