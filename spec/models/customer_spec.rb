require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let!(:other_customer) { create(:customer) }
    let(:customer) { build(:customer) }

    context 'nameカラム' do
      it '空欄でないこと' do
        customer.name = ''
        is_expected.to eq false
      end
    end
    context 'emailカラム' do
      it '空欄でないこと' do
        customer.email = ''
        is_expected.to eq false
      end
    end
    context 'passwordカラム' do
      it '空欄でないこと' do
        customer.password = ''
        is_expected.to eq false
      end
    end
    context 'nicknameカラム' do
      it '空欄でないこと' do
        customer.nickname = ''
        is_expected.to eq false
      end
    end
    context 'postalcodeカラム' do
      it '空欄でないこと' do
        customer.postalcode = ''
        is_expected.to eq false
      end
    end
    context 'prefecture_idカラム' do
      it '空欄でないこと' do
        customer.prefecture_id = ''
        is_expected.to eq false
      end
    end
    context 'cityカラム' do
      it '空欄でないこと' do
        customer.city = ''
        is_expected.to eq false
      end
    end
    context 'buildingカラム' do
      it '空欄でないこと' do
        customer.building = ''
        is_expected.to eq false
      end
    end
    context 'phoneカラム' do
      it '空欄でないこと' do
        customer.phone = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Petモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:pets).macro).to eq :has_many
      end
    end
  end
end
