require 'rails_helper'

describe '[STEP2] ログイン後のテスト' do
  let(:customer) { create(:customer) }
  let(:pet) { create(:pet) }

  before do
    visit new_customer_session_path
    fill_in 'customer[email]', with: customer.email
    fill_in 'customer[password]', with: customer.password
    click_button 'ログイン'
  end

  describe 'ペット一覧画面のテスト' do
    before do
      visit pets_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/pets'
      end
      it 'ペット情報が表示される' do
        expect(page).to have_content pet.gender.name
        expect(page).to have_content pet.category.name
        expect(page).to have_content pet.breed
        expect(page).to have_content pet.age.name
      end
    end
  end
  describe 'ペット投稿画面のテスト' do
    before do
      visit new_pet_path
    end

    context '投稿成功のテスト' do
      it 'URLが正しい' do
        expect(current_path).to eq '/pets/new'
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿'
      end
    end
  end

  describe '自分の投稿詳細画面のテスト' do
    before do
      visit pet_path(pet)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/pets/' + pet.id.to_s
      end
      it 'ユーザ名・名前のリンク先が正しい' do
        expect(page).to have_link pet.customer.name, href: customer_path(pet.customer)
      end
      it '投稿の性別が表示される' do
        expect(page).to have_content pet.gender.name
      end
      it '投稿のカテゴリーが表示される' do
        expect(page).to have_content pet.category.name
      end
      it '投稿の品種が表示される' do
        expect(page).to have_content pet.breed
      end
      it '投稿の年齢が表示される' do
        expect(page).to have_content pet.age.name
      end
    end
  end

  describe '自分の投稿編集画面のテスト' do
    before do
      visit edit_pet_path(pet)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/pets/' + pet.id.to_s + '/edit'
      end
      it '「ペット編集」と表示される' do
        expect(page).to have_content 'ペット編集'
      end
      it '性格編集フォームが表示される' do
        expect(page).to have_field 'pet[character]', with: pet.character
      end
      it '経緯編集フォームが表示される' do
        expect(page).to have_field 'pet[reason]', with: pet.reason
      end
      it '変更を保存ボタンが表示される' do
        expect(page).to have_button '変更を保存'
      end
    end
  end

  describe '自分のユーザ詳細画面のテスト' do
    before do
      visit customer_path(customer)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/customers/' + customer.id.to_s
      end
      it '投稿一覧のユーザ画像のリンク先が正しい' do
        expect(page).to have_link '', href: customer_path(customer)
      end
      it 'ニックネームが表示される' do
        expect(page).to have_content customer.nickname
      end
      it '氏名が表示される' do
        expect(page).to have_content customer.name
      end
      it '郵便番号が表示される' do
        expect(page).to have_content customer.postalcode
      end
      it '都道府県が表示される' do
        expect(page).to have_content customer.prefecture.name
      end
      it '市町村が表示される' do
        expect(page).to have_content customer.city
      end
      it '建物が表示される' do
        expect(page).to have_content customer.building
      end
      it '電話番号が表示される' do
        expect(page).to have_content customer.phone
      end
    end
  end
end