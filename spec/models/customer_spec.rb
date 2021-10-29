RSpec.describe "Customer", type: :model do
  it "メールアドレス、ニックネームがある場合、有効である" do
  Customer = Customer.new(
          email:  "pets@1",
          nickname: "pets",
  )
  expect(customer).to be_valid
  end
end