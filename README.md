# README

## User model

+ id

+ name: string

+ email: string

+password_digest: string

## Task model

+ id

+ user_id

+ name: string

+ content: text

+ deadline: date

+ priority:integer

+ status: string

## TaskLabel model

+ id

+ task_id

+label_id

## Label

+id

+name
