# README

## User model

| TH Column | TH Type |
| ------- | -------- |
| name | string |
| email | string |
| password_digest | string |

## Task model

| TH Column | TH Type |
| ------- | -------- |
| user_id | references |
| name | string |
| content | text |
| deadline | date |
| property | integer |
| status | string |

## TaskLabel model

| TH Column | TH Type |
| ------- | -------- |
| task_id | references |
| label_id | references |


## Label

| TH Column | TH Type |
| ------- | -------- |
| name | string |
