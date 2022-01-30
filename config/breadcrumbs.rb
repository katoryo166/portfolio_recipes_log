crumb :root do
  link "トップページ", root_path
end

crumb :homes_about do
  link "About", homes_about_path
  parent :root
end

crumb :post_recipes do
  link "投稿一覧", post_recipes_path
  parent :root
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

crumb :new_post_recipe do
  link "投稿フォーム" ,user_session_path
  parent :user
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