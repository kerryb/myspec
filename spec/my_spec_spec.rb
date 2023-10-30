MySpec.describe "Simple assertions" do
  it "checks a value is as expected" do
    expect(2 + 2).to eq(4)
  end

  it "fails if a value is not as expected" do
    expect(2 + 2).to eq(5)
  end
end
