MySpec.describe "Equality assertion" do
  it "checks a value is as expected" do
    expect(2 + 2).to eq(4)
  end

  it "fails if a value is not as expected" do
    expect(2 + 2).to eq(5)
  end
end

MySpec.describe "Nil assertion" do
  it "checks a value is nil" do
    expect(nil).to be_nil
  end

  it "fails if a value is not nil" do
    expect("").to be_nil
  end
end
