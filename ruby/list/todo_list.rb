class TodoList

  def initialize(list_array)
    @items = list_array
  end

  def get_items
    @items
  end

  def add_item(item)
    @items << item
    @items
  end

  def delete_item(item)
    @items.delete_at(@items.index("#{item}"))
    @items
  end

  def get_item(item_index)
    @items[item_index]
  end
end
