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
        visit new_task_path
        fill_in 'task[name]', with: 'default title 1'
        fill_in 'task[content]', with: 'default content 1'
        fill_in 'task[deadline]', with: "002022-07-02-18-00"
        find('#task_status').find("option[value='not_yet']").select_option
        find('#task_priority').find("option[value='low']").select_option
        check 'label_0'
        click_button '登録'
      end

      it 'is created when new task is created' do
        expect(page).to have_content 'label 1'
      end

      it 'is created when the task is updated' do
        visit tasks_path
        page.all('.btn-outline-warning')[0].click
        check 'label_1'
        click_button '登録'
        expect(page).to have_content 'label 2'
      end
    end
    context 'whether or not the label is displayed' do
      before do
        visit new_session_path
        fill_in 'session[email]', with: user.email
        fill_in 'session[password]', with: user.password
        click_button 'ログイン'
        visit tasks_path
        visit new_task_path
        fill_in 'task[name]', with: 'default title 1'
        fill_in 'task[content]', with: 'default content 1'
        fill_in 'task[deadline]', with: "002022-07-02-18-00"
        find('#task_status').find("option[value='not_yet']").select_option
        find('#task_priority').find("option[value='low']").select_option
        check 'label_0'
        click_button '登録'
        visit new_task_path
        fill_in 'task[name]', with: 'default title 2'
        fill_in 'task[content]', with: 'default content 2'
        fill_in 'task[deadline]', with: "002022-07-03-18-00"
        find('#task_status').find("option[value='not_yet']").select_option
        find('#task_priority').find("option[value='low']").select_option
        check 'label_1'
        click_button '登録'
      end
      it 'is shown label in index page' do
        visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content('label 2')
        expect(task_list[1]).to have_content('label 1')
      end
      it 'is shown label in show page' do
        visit tasks_path
        page.all('.btn-outline-info')[0].click
        expect(page).to have_content('label 2')
      end
    end
  end
  

  describe 'the function of search' do
    let!(:user){ FactoryBot.create(:user) }
    let!(:label){ FactoryBot.create(:label) }
    let!(:second_label){ FactoryBot.create(:second_label) }
    let!(:third_label){ FactoryBot.create(:third_label) }

    context 'search' do
      before do
        visit new_session_path
        fill_in 'session[email]', with: user.email
        fill_in 'session[password]', with: user.password
        click_button 'ログイン'
        visit tasks_path
        visit new_task_path
        fill_in 'task[name]', with: 'default title 1'
        fill_in 'task[content]', with: 'default content 1'
        fill_in 'task[deadline]', with: "002022-07-02-18-00"
        find('#task_status').find("option[value='not_yet']").select_option
        find('#task_priority').find("option[value='low']").select_option
        check 'label_0'
        click_button '登録'
        visit new_task_path
        fill_in 'task[name]', with: 'default title 2'
        fill_in 'task[content]', with: 'default content 2'
        fill_in 'task[deadline]', with: "002022-07-03-18-00"
        find('#task_status').find("option[value='not_yet']").select_option
        find('#task_priority').find("option[value='low']").select_option
        check 'label_1'
        click_button '登録'
        visit tasks_path
      end
      
      it 'to execute exact match search by labels' do
        select "label 1", from: "label_search"
        click_button "Search"
        expect(page).to have_content 'label 1'
      end
    end
  end
end