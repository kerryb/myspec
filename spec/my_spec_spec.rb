MySpec.describe "Equality assertion" do
  it "checks a value is as expected" do
    expect(2 + 2).to eq(4)
  end

  it "fails if a value is not as expected" do
    expect(2 + 2).to eq(5)
  end

  it "allows negated matching" do
    expect(2 + 2).not_to eq(5)
  end

  it "fails if a value is what it’s not expected to be" do
    expect(2 + 2).not_to eq(4)
  end
end

MySpec.describe "Nil assertion" do
  it "checks a value is nil" do
    expect(nil).to be_nil
  end

  it "fails if a value is not nil" do
    expect("").to be_nil
  end

  it "allows negated matching" do
    expect(2 + 2).not_to be_nil
  end

  it "fails if a value is nil when expected not to be" do
    expect(nil).not_to be_nil
  end
end
