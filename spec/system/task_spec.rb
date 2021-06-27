require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  describe '新規作成機能' do

    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'Title', with: 'task_title'
        fill_in 'Content', with: 'task_content'
        fill_in 'Deadline', with: '2021/06/25'
        select '未着手', from: 'Status'
        click_button '登録する'
        visit tasks_path
        expect(page).to have_content '未着手'
      end
    end
    
  end

  describe '検索機能' do

    before do

      DatabaseCleaner.clean
      # 必要に応じて、テストデータの内容を変更して構わない
      FactoryBot.create(:task, title: "task", status: 2 )
      FactoryBot.create(:second_task, title: "sample", status: 1)
    end

    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        # タスクの検索欄に検索ワードを入力する (例: task)
        fill_in "search_word", with: 'tas'
        # 検索ボタンを押す
        click_on '検索'
        page.html
        expect(page).to have_content 'task'
      end
    end

    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        # ここに実装する
        visit tasks_path
        # プルダウンを選択する「select」について調べてみること
        select '着手中' , from: 'search_status'
        click_on '検索'

        expect(all('.task_list')).to have_content 
      end
    end

      context 'タイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          # ここに実装する
          FactoryBot.create(:task, title:'sam', status: 1 )
          FactoryBot.create(:task, title:'sample', status: 2)
          visit tasks_path
          fill_in "search_word", with: 'sam'
          select '着手中', from: 'search_status'
          click_on 'search'
          p Task.count
          expect(all('.task').size).to eq 2
        end
      end
  

  end
  describe '一覧表示機能' do

    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, title: 'task')
        task = FactoryBot.create(:second_task, title: 'task2')
        task = FactoryBot.create(:third_task, title: 'task3')
        visit tasks_path
        task_list= all('.task_list')
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        expect(page).to have_content 'task'
        expect(page).to_not have_content 'コンテント3'
        expect(page).to have_content 'コンテント２'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される                
      end
    end

    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        visit tasks_path
        task_list= all('.task_list')
        save_and_open_page
        expect(task_list[0]).to have_content 'task3'
        expect(task_list[1]).to have_content 'task2'
        expect(task_list[2]).to have_content 'task'     
      end
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

