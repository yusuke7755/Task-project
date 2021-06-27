# 「FactoryBotを使用します」という記述
FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  #factory :task do
    #title { 'タイトル１' }
    #content { 'コンテント１' }
  #end
  # 作成するテストデータの名前を「second_task」とします
  #factory :second_task, class: Task do
    #title { 'タイトル２' }
    #content { 'コンテント２' }
  #end

      # 作成するテストデータの名前を「task」とします
    factory :task do
      title { 'タイトル１' }
      content { 'コンテント１' }
      status {'completed'}
      priority {'high'}
      deadline { DateTime.now }
    end
    # 作成するテストデータの名前を「second_task」とします
    factory :second_task, class: Task do
      title { 'タイトル２' }
      content { 'コンテント２' }
      status {'not_yet'}
      priority {'middle'}
      deadline { DateTime.tomorrow }
    end

    factory :third_task, class: Task do
      title { 'タイトル3' }
      content { 'コンテント3' }
      status {'in_progress'}
      priority {'low'}
      deadline { DateTime.now.since(5.days) }
    end  

end
