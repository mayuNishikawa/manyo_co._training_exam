require 'rails_helper'
RSpec.describe 'The function of task management', type: :system do

  describe 'the function of to create task' do
    context 'creating task' do
      it 'is shown at index' do
        task = FactoryBot.create(:task)
        visit tasks_path
        expect(page).to have_content '未着手'
      end
    end
  end

  describe 'to display index.html' do

    before do
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
      FactoryBot.create(:third_task)
      visit tasks_path
    end

    context 'visiting index page' do
      it 'is shown all created tasks' do
        expect(page).to have_content 'title 1'
        expect(page).to have_content 'title 2'
        expect(page).to have_content 'title 3'
      end
    end

    context 'tasks are arranged in descending created order' do
      it 'shows newest task on top' do
        task_list = all('.task_row')
        expect(task_list[0]).to have_content('title 3')
        expect(task_list[1]).to have_content('title 2')
        expect(task_list[2]).to have_content('title 1')
      end
    end

    context 'when the link for sorting by deadline is clicked' do
      it 'shows that tasks are arranged in descending' do
        click_link I18n.t('view.deadline')
        sleep 1
        task_list = all('.task_row')
        expect(task_list[0]).to have_content('title 3')
        expect(task_list[1]).to have_content('title 1')
        expect(task_list[2]).to have_content('title 2')
      end
    end

    context 'when the link for sorting by priority is clicked' do
      it 'shows that tasks are arranged in ascending' do
        click_link I18n.t('view.priority')
        sleep 1
        task_list = all('.task_row')
        expect(task_list[0]).to have_content('title 3')
        expect(task_list[1]).to have_content('title 2')
        expect(task_list[2]).to have_content('title 1')
      end
    end
  end

  describe 'to display show.html' do
    context 'visiting one page' do
      it 'is shown that page' do
        task = FactoryBot.create(:second_task, name: 'aaaaa')
        visit task_path(task)
        expect(page).to have_content 'aaaaa'
      end
    end
  end

  describe 'the function of search' do
    before do
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
      FactoryBot.create(:third_task, name: 'aaaaa')
      visit tasks_path
    end

    context 'to execute ambiguous search by names' do
      it "is shown the tasks which include search keyword" do
        fill_in 'task[name]', with: 'title'
        click_button I18n.t('view.search_button')
        expect(page).to have_content 'title 1'
        expect(page).to have_content 'title 2'
      end
    end
    context 'to execute exact match search by status' do
      it "is shown the tasks which match exactly" do
        select "未着手", from: "task[status]"
        click_button I18n.t('view.search_button')
        expect(page).to have_content 'title 1'
      end
    end
    context 'to execute ambiguous search by names and exact match search by status' do
      it "is shown the tasks which include search keyword and the tasks which match exactly" do
        select "未着手", from: "task[status]"
        fill_in 'task[name]', with: 'title'
        click_button I18n.t('view.search_button')
        expect(page).to have_content 'title 1'
      end
    end
  end
end