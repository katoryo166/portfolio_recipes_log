crumb :root do
  link "トップページ", root_path
end
##ユーザー
crumb :homes_about do
  link "About", homes_about_path
  parent :root
end

crumb :post_recipes do
  link "投稿一覧", post_recipes_path
  parent :root
end

crumb :post_recipe do
  link "投稿詳細", post_recipe_path
  parent :post_recipes
end

crumb :edit_post_recipe do
  link "投稿編集", edit_post_recipe_path
  parent :post_recipe
end

crumb :new_user_session do
  link "新規登録" ,new_user_session_path
  parent :root
end

crumb :user_session do
  link "ログイン" ,user_session_path
  parent :root
end

crumb :user do
  link "マイページ" ,user_session_path
  parent :user_session
end

crumb :edit_user do
  link "情報編集" ,edit_user_path
  parent :user
end

crumb :favorite_lists_users do
  link "いいねした投稿" ,edit_user_path
  parent :user
end

crumb :new_post_recipe do
  link "投稿フォーム" ,user_session_path
  parent :user
end

##管理者
crumb :admin_session do
  link "管理者ログイン" ,admin_session_path
  parent :root
end

crumb :admin_post_recipes do
  link "投稿一覧", admin_post_recipes_path
  parent :admin_session
end

crumb :admin_post_recipe do
  link "投稿詳細", admin_post_recipe_path
  parent :admin_post_recipes
end

crumb :edit_admin_post_recipe do
  link "投稿編集", edit_admin_post_recipe_path
  parent :admin_post_recipe
end

crumb :admin_users do
  link "アカウント一覧", admin_users_path
  parent :admin_session
end

crumb :admin_user do
  link "アカウント詳細", admin_user_path
  parent :admin_users
end

crumb :edit_admin_user do
  link "アカウント編集", edit_admin_user_path
  parent :admin_user
end

crumb :admin_genres do
  link "ジャンル一覧", admin_genres_path
  parent :admin_session
end

crumb :edit_admin_genre do
  link "ジャンル編集", edit_admin_genre_path
  parent :admin_genres
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).