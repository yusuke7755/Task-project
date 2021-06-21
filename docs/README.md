# README
- User
  | Name            | Column  |
  |-----------------|---------|
  | user_id         | integer |
  | name            | string  |
  | email           | string  |
  | password_digest | string  |
  | company         | string  |
  | department      | string  |
  | admin           | string  |
  | gender          | integer |
  | birthday        | date    |

- Task
  | Name    | Column  |
  |---------|---------|
  | task_id | integer |
  | title   | string  |
  | status  | integer |
  | primary | integer |
  | content | text    |
  | enddate | date    |
  | user_id | integer |

- Label
  | Name       | Column  |
  |------------|---------|
  | label_id   | integer |
  | label_name | string  |

- Labeling
  | Name     | Column  |
  |----------|---------|
  | label_id | integer |
  | task_id  | integer |


- Herokuへのデプロイ設定
  - Heroku create を行う
  - git add .
  - git commit -m "coment"
  - git push heroku Step2:master
  - heroku open
  - rails assets:precompile RAILS_ENV=production
  - bundle install
  - git push heroku master
  - heroku run rails db:migrate
  - heroku config