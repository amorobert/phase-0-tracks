require_relative 'grocery_list'

describe Electronic_grocery_list do
  let(:list) { {"carrots" => 1, "apples" => 1, "cereal" => 1, "pizza" => 1} }


  it "creates a new list" do
    list = {}
    expect(list.create_list("carrots apples cereal pizza")).to eq {"carrots" => 1, "apples" => 1, "cereal" => 1, "pizza" => 1}
  end

  it "adds an item to the list" do
    expect(list.add item("bagels 6")).to eq {"carrots" => 1, "apples" => 1, "cereal" => 1, "pizza" => 1, "bagels" => 6 }
  end

  it "removes an item from the list" do
    expect(list.remove_item("cereal")).to eq {"carrots" => 1, "apples" => 1, "pizza" => 1}
  end

  it "updates the quantity of an item on the list" do
    expect(list.update_quantity("pizza 2")).to eq {"carrots" => 1, "apples" => 1, "cereal" => 1, "pizza" => 2}
  end

  it "prints out the list" do
    expect(list.print_list).to eq {"carrots" => 1, "apples" => 1, "cereal" => 1, "pizza" => 1}
  end
end
