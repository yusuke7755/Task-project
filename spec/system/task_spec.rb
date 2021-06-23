require 'rails_helper'
describe 'タスク管理機能', type: :system do

  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
  
  before do
    # 「一覧画面に遷移した場合」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
    visit tasks_path
  end

  describe '一覧表示機能' do
    #context '一覧画面に遷移した場合' do
      #it '作成済みのタスク一覧が表示される' do
        # テストで使用するためのタスクを作成
        #task = FactoryBot.create(:task, title: 'task')
        # タスク一覧ページに遷移
       # visit tasks_path
        # タスク一覧ページに遷移できているかを確認
       # current_path
        # タスクがデータベースに作成されているかを確認
       # Task.count
        # 表示するHTMLにタスク情報が入っているかを確認
       # page.html
       # expect(page).to have_content 'task'
      #end
    #end

      # テスト内容を追加で記載する
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        # タスク一覧を配列として取得するため、View側でidを振っておく
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'タイトル２'
        expect(task_list[1]).to have_content 'タイトル１'
      end
    end

  end

end
