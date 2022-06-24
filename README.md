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

## Herokuでデプロイする

1. ログインする　＄heroic login

2. herokuアプリを作成　$ heroku create

3. rubyのbuildpackerを設定　$ heroku buildpacks:set heroku/ruby

4. nodejsのbuildpackerを設定　$ heroku buildpacks:add --index 1 heroku/nodejs

5. M1チップに対応していないため、x86_64-linuxプラットフォームを追加する。　$ bundle lock --add-platform x86_64-linux

6. 変更を追加　$ git add .

7. 変更をコミット　$ git commit -m "Gemfile.lock fix"

8. デプロイ　$ git push heroku (ブランチ名):master
