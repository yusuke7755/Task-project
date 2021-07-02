require 'rails_helper'

RSpec.describe 'ユーザ登録・ログイン・ログアウト機能・管理画面テスト', type: :system do

  describe 'ユーザ登録のテスト' do

      context 'ユーザ新規登録' do
          it '自身の名が入ったページへアクセスできる' do
            visit new_user_path
            fill_in 'user_name', with: 'usertest111'
            fill_in 'user_email', with: 'usertest111@gmail.com'
            fill_in 'user_password', with: 'password'
            fill_in 'user_password_confirmation', with: 'password'
            click_on 'アカウント作成'
            expect(page).to have_content 'usertest001'
          end
      end
      context 'ログインなしでタスク一覧にアクセス' do
          it '​ログインしていない時はログイン画面に飛ぶテスト​' do
            visit tasks_path
            expect(current_path).to eq new_session_path
          end
      end

  end

  describe 'セッション機能テスト' do

    # before do

    #   @user = FactoryBot.create(:user)
    #   @second_user = FactoryBot.create(:second_user)

    # end

    context "ログインしていない状態でユーザデータがある場合" do

      it 'ログインできること' do
        visit new_session_path
        fill_in 'session_email', with: @user.email
        fill_in 'session_password', with: @user.password

        click_on 'create_tag'

      end

      #context "ログインしていない状態でユーザデータがある場合" do
      it 'ログインして詳細画面に飛べること' do
        visit new_session_path
        fill_in 'session_email', with: @user.email
        fill_in 'session_password', with: @user.password

        click_on 'create_tag'
        binding.irb
        expect(current_path).to eq user_path(@user.id)
        expect(page).to have_content 'usertest01のマイページ'
      end

      it "他人の詳細画面に飛ぶとタスク一覧ページに遷移すること" do
        visit user_path(@second_user.id)
        expect(page).to have_content "タスク一覧"
      end

    end
    context 'ログアウトした場合' do
      it "ログイン画面に戻る" do
        visit user_path(id: @user.id)
        click_link "ログアウト"
        expect(page).to have_content "ログイン"
      end
    end
  end

end
