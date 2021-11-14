require 'rails_helper'

describe '[STEP1] 会員のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'トップ画面(root_path)にペット一覧へのリンクが表示されているか' do
        expect(page).to have_link "ペット閲覧"
      end
      it 'トップ画面(root_path)に新規登録へのリンクが表示されているか' do
        expect(page).to have_link "新規登録"
      end
      it 'トップ画面(root_path)にログインへのリンクが表示されているか' do
        expect(page).to have_link "ログイン"
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/about'
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_customer_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/customers/sign_up'
      end
      it '「新規登録」と表示される' do
        expect(page).to have_content '新規登録'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'customer[name]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'customer[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'customer[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'customer[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'customer[name]', with: "test1"
        fill_in 'customer[nickname]', with: "test1"
        fill_in 'customer[email]', with: "pet@test"
        fill_in 'customer[postalcode]', with: "123-4567"
        select '北海道', from: 'customer[prefecture_id]'
        fill_in 'customer[city]', with: "test"
        fill_in 'customer[building]', with: "test"
        fill_in 'customer[phone]', with: "123-456-789"
        fill_in 'customer[password]', with: 'mypets'
        fill_in 'customer[password_confirmation]', with: 'mypets'
      end

      it '正しく新規登録される' do
        expect { click_button '登録' }.to change(Customer.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、新規登録できたユーザの詳細画面になっている' do
        click_button '登録'
        expect(current_path).to eq '/'
      end
    end
  end

#   describe 'ユーザログイン' do
#     let(:customer) { create(:customer) }

#     before do
#       visit new_customer_session_path
#     end

#     context '表示内容の確認' do
#       it 'URLが正しい' do
#         expect(current_path).to eq '/customers/sign_in'
#       end
#       it '「ログイン」と表示される' do
#         expect(page).to have_content 'ログイン'
#       end
#       it 'emailフォームが表示される' do
#         expect(page).to have_field 'customer[email]'
#       end
#       it 'passwordフォームが表示される' do
#         expect(page).to have_field 'customer[password]'
#       end
#       it '登録ボタンが表示される' do
#         expect(page).to have_button '登録'
#       end
#       it 'emailフォームは表示されない' do
#         expect(page).not_to have_field 'customer[email]'
#       end
#     end

#     context 'ログイン成功のテスト' do
#       before do
#         fill_in 'customer[name]', with: customer.name
#         fill_in 'customer[password]', with: customer.password
#         click_button 'ログイン'
#       end

#       it 'ログイン後のリダイレクト先が、ログインしたユーザの詳細画面になっている' do
#         expect(current_path).to eq '/customer/' + customer.id.to_s
#       end
#     end

#     context 'ログイン失敗のテスト' do
#       before do
#         fill_in 'customer[email]', with: ''
#         fill_in 'customer[password]', with: ''
#         click_button 'ログイン'
#       end

#       it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
#         expect(current_path).to eq '/customers/sign_in'
#       end
#     end
#   end

#   describe 'ヘッダーのテスト: ログインしている場合' do
#     let(:customer) { create(:customer) }

#     before do
#       visit new_user_session_path
#       fill_in 'customer[name]', with: customer.name
#       fill_in 'customer[password]', with: customer.password
#       click_button 'ログイン'
#     end

#     context 'ヘッダーの表示を確認' do
#       it 'タイトルが表示される' do
#         expect(page).to have_content 'my_pets'
#       end
#       it 'Homeリンクが表示される' do
#         home_link = find_all('a')[1].native.inner_text
#         expect(home_link).to match(/home/i)
#       end
#       it 'Usersリンクが表示される' do
#         users_link = find_all('a')[2].native.inner_text
#         expect(users_link).to match(/users/i)
#       end
#       it 'Booksリンクが表示される' do
#         books_link = find_all('a')[3].native.inner_text
#         expect(books_link).to match(/books/i)
#       end
#       it 'log outリンクが表示される' do
#         logout_link = find_all('a')[4].native.inner_text
#         expect(logout_link).to match(/logout/i)
#       end
#     end
#   end

#   describe 'ユーザログアウトのテスト' do
#     let(:customer) { create(:customer) }

#     before do
#       visit new_customer_session_path
#       fill_in 'customer[name]', with: customer.name
#       fill_in 'customer[password]', with: customer.password
#       click_button 'ログイン'
#       logout_link = find_all('a')[4].native.inner_text
#       logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
#       click_link logout_link
#     end

#     context 'ログアウト機能のテスト' do
#       it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
#         expect(page).to have_link '', href: '/home/about'
#       end
#       it 'ログアウト後のリダイレクト先が、トップになっている' do
#         expect(current_path).to eq '/'
#       end
#     end
#   end
 end