MySpec.describe "Equality assertion" do
  it "passes when the value is as expected" do
    expect(2 + 2).to eq(4)
  end

  it "fails when the value is not as expected" do
    expect(2 + 2).to eq(5)
  end
end
