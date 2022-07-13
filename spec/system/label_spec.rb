require 'rails_helper'
RSpec.describe 'The function of label management', type: :system do

  describe 'the function of label' do
    let!(:user){ FactoryBot.create(:user) }
    let!(:label){ FactoryBot.create(:label) }
    let!(:second_label){ FactoryBot.create(:second_label) }
    let!(:third_label){ FactoryBot.create(:third_label) }
    context 'to submit with task' do
      before do
        visit new_session_path
        fill_in 'session[email]', with: user.email
        fill_in 'session[password]', with: user.password
        click_button 'ログイン'
        visit tasks_path
      end
      it 'is created when new task is created' do
        visit new_task_path
        fill_in 'task[name]', with: 'default title 1'
        fill_in 'task[content]', with: 'default content 1'
        fill_in 'task[deadline]', with: "2022/07/02 18:00"
        find('#task_status').find("option[value='not_yet']").select_option
        find('#task_priority').find("option[value='low']").select_option
        check 'label 1'
        click_button '登録'
        expect(page).to have_content 'label 1'
      end
      it 'is created when the task is updated' do
        【テストの処理（〇〇になることを期待する）】
      end
    end
  end
# context 'whether or not the label is displayed' do
  #   before do
  #     visit new_session_path
  #     fill_in 'session[email]', with: user.email
  #     fill_in 'session[password]', with: user.password
  #     click_button 'ログイン'
  #     visit tasks_path
  #     task = FactoryBot.create(:task, user: user, label: label)
  #   end
  #   it '一覧画面にそのタスクに紐づくラベルが表示される' do
  #     【テストの処理（〇〇になることを期待する）】
  #   end
  #   it '詳細画面にそのタスクに紐づくラベルが表示される' do
  #     【テストの処理（〇〇になることを期待する）】
  #   end
  # end

  # describe 'the function of search' do
  #   let!(:user){ FactoryBot.create(:user) }
  #   context 'search' do
  #     before do
  #       task = FactoryBot.create(:task, user: user, label: label)
  #       second_task = FactoryBot.create(:second_task, user: user, label: second_label)
  #       visit new_session_path
  #       fill_in 'session[email]', with: user.email
  #       fill_in 'session[password]', with: user.password
  #       click_button 'ログイン'
  #       visit tasks_path
  #     end
  #     it 'to execute exact match search by labels' do
  #       【テストの処理（〇〇になることを期待する）】
  #     end
  #   end
  # end
end