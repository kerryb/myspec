MySpec.describe "Equality assertion" do
  it "passes when the values are equal" do
    expect(2 + 2).to eq(4)
  end

  it "fails when the values are not equal" do
    expect(2 + 2).to eq(5)
  end

  xit "does not run examples preceded by x" do
    raise "This should not get executed"
  end

  it "passes when negated and the values are not equal" do
    expect(2 + 2).not_to eq(5)
  end

  it "fails when negated and the values are equal" do
    expect(2 + 2).not_to eq(4)
  end
end
