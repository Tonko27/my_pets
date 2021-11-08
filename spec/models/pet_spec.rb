require 'rails_helper'

RSpec.describe 'Petモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { pet.valid? }

    let(:customer) { create(:customer) }
    let!(:pet) { build(:pet, customer_id: customer.id) }

    # context '画像カラム' do
    #   it '空欄でないこと' do
    #     pet.image_id = ''
    #     is_expected.to eq false
    #   end
    # end

    context '性別カラム' do
      it '空欄でないこと' do
        pet.gender_id = ''
        is_expected.to eq false
      end
    end

    context 'カテゴリーカラム' do
      it '空欄でないこと' do
        pet.category_id = ''
        is_expected.to eq false
      end
    end

    context '品種カラム' do
      it '空欄でないこと' do
        pet.breed = ''
        is_expected.to eq false
      end
    end

    context '年齢カラム' do
      it '空欄でないこと' do
        pet.age_id = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Pet.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end