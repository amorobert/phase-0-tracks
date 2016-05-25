require_relative 'grocery_list'

describe 'grocery_list' do
  # let(:list) { {"carrots" => 1, "apples" => 1, "cereal" => 1, "pizza" => 1} }

  it "creates a new list" do
    expect(create_list("carrots apples cereal pizza")).to eq( {"carrots" => 1, "apples" => 1, "cereal" => 1, "pizza" => 1} )
  end

  it "adds an item to the list" do
    expect(add_item("bagels 6")).to eq ( {"carrots" => 1, "apples" => 1, "cereal" => 1, "pizza" => 1, "bagels" => 6 } )
  end

  it "removes an item from the list" do
    expect(remove_item("cereal")).to eq ( {"carrots" => 1, "apples" => 1, "pizza" => 1, "bagels" => 6 } )
  end

  it "updates the quantity of an item on the list" do
    expect(update_quantity("pizza 2")).to eq ( {"carrots" => 1, "apples" => 1, "pizza" => 2, "bagels" => 6 } )
  end

  it "prints out the list" do
    expect(print_list).to eq ( {"carrots" => 1, "apples" => 1, "pizza" => 2, "bagels" => 6 } )
  end
end
