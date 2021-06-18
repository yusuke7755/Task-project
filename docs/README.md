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
  | gender          | integer |
  | birthday        | date    |
 

- Task
  |---------|---------|
  | Name    | Column  |
  |---------|---------|
  | task_id | integer |
  |---------|---------|
  | title   | string  |
  |---------|---------|
  | status  | integer |
  |---------|---------|
  | primary | integer |
  |---------|---------|
  | content | text    |
  |---------|---------|
  | enddate | date    |
  |---------|---------|
  | user_id | integer |
  |---------|---------|

- Label
  |------------|---------|
  | Name       | Column  |
  |------------|---------|
  | label_id   | integer |
  |------------|---------|
  | label_name | string  |
  |------------|---------|

- Labeling
  |----------|---------|
  | Name     | Column  |
  |----------|---------|
  | label_id | integer |
  |----------|---------|
  | task_id  | integer |
  |----------|---------|


