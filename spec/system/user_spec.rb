require 'rails_helper'
RSpec.describe 'The function of user management', type: :system do
  describe 'The function about login and sessions' do
    context 'the function of user' do
      it 'can create new user' do
        visit new_user_path
        fill_in 'user[name]', with: "user"
        fill_in 'user[email]', with: "user@example.com"
        fill_in 'user[password]', with:"useruser"
        fill_in 'user[password_confirmation]', with:"useruser"
        click_on "登録"
        expect(page).to have_content "アカウント詳細"
      end

      it 'transition to login page when user try to visit tasks index without login' do
        visit tasks_path
        visit new_user_path
        expect(page).to have_content "新規登録"
      end
    end

    context 'the function about sessions' do
      let!(:user){ FactoryBot.create(:user) }
      before do
        visit new_session_path
        fill_in 'session[email]', with: user.email
        fill_in 'session[password]', with: user.password
        click_button 'ログイン'
      end

      it 'can log in' do
        expect(page).to have_content 'アカウント詳細'
      end

      it 'can visit my page' do
        expect(page).to have_content 'アカウント詳細'
      end

      it 'transition to tasks index page when general user try to visit other user\'s my page' do
        second_user = FactoryBot.create(:second_user)
        visit user_path(second_user)
        visit tasks_path
      end

      it 'can log out' do
        click_link "ログアウト"
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe 'the test about admin page' do
    context 'admin_user' do
      before do
        admin_user = FactoryBot.create(:admin_user)
        visit new_session_path
        fill_in 'session[email]', with: admin_user.email
        fill_in 'session[password]', with: admin_user.password
        click_button 'ログイン'
        visit admin_users_path
      end

      it 'can access to admin page' do
        expect(page).to have_content '管理画面のユーザー一覧画面'
      end

      it 'can create new user' do
        click_on "ユーザーの新規作成"
        fill_in 'user[name]', with: "user"
        fill_in 'user[email]', with: "user@example.com"
        fill_in 'user[password]', with:"useruser"
        fill_in 'user[password_confirmation]', with:"useruser"
        click_on "作成"
        expect(page).to have_content 'user'
      end

      it 'can access general user\'s my page' do
        user = FactoryBot.create(:user)
        visit admin_users_path
        page.all('.btn-outline-info')[2].click
        expect(page).to have_content 'アカウント詳細'
      end

      it 'can edit general user' do
        user = FactoryBot.create(:user)
        visit admin_users_path
        page.all('.btn-outline-warning')[2].click
        fill_in 'user[name]', with: "edited_user"
        fill_in 'user[email]', with: "user@example.com"
        fill_in 'user[password]', with:"useruser"
        fill_in 'user[password_confirmation]', with:"useruser"
        fill_in 'user[admin]', with: "false"
        click_on "作成"
        expect(page).to have_content 'edited_user'
      end

      it 'can delete user' do
        user = FactoryBot.create(:user, name: 'delete')
        visit admin_users_path
        page.all('.btn-outline-danger')[2].click
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'delete'
      end
    end
  end

  context 'general user' do
    before do
      general_user = FactoryBot.create(:admin_user)
      visit new_session_path
      fill_in 'session[email]', with: general_user.email
      fill_in 'session[password]', with: general_user.password
      click_button 'ログイン'
    end

    it 'can not access to admin page' do
      visit admin_users_path
      expect(page).to have_content 'タスク一覧'
    end
  end
end