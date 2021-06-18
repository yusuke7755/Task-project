# README
User
user_id          integer
name             string
email            string
password_digest  string
company          string
department       string
gender           integer
birthday         date

Task
task_id  integer
title    string
status   integer
primary  integer
content  text
enddate  date
user_id  integer

Label
label_id    integer
label_name  string

Labeling
label_id  integer
task_id   integer


