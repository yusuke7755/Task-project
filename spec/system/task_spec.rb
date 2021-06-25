require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do



  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, name: 'task')
        task = FactoryBot.create(:second_task, name: 'task2')
        visit tasks_path
        task_list= all('.task_list')
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        expect(page).to have_content 'task'
        expect(page).to_not have_content 'Factoryで作ったデフォルトのコンテント3'
        expect(page).to have_content 'Factoryで作ったデフォルトのコンテント２'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される                
      end
    end
    #テストで内容を追加 issues#2
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task = FactoryBot.create(:task, name: 'task')
        task = FactoryBot.create(:second_task, name: 'task2')
        task = FactoryBot.create(:third_task, name: 'task3')
        visit tasks_path
        task_list= all('.task_list')
        save_and_open_page
        expect(task_list[0]).to have_content 'task3'
        expect(task_list[1]).to have_content 'task2'
        expect(task_list[2]).to have_content 'task'     
      end
    end


  #describe '一覧表示機能' do

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
    #context 'タスクが作成日時の降順に並んでいる場合' do
      #it '新しいタスクが一番上に表示される' do
        # タスク一覧を配列として取得するため、View側でidを振っておく
        #task_list = all('.task_row')
        #expect(task_list[0]).to have_content 'タイトル２'
        #expect(task_list[1]).to have_content 'タイトル１'
      #end
    #end

  #end

end
