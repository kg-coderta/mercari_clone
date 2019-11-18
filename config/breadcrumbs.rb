crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
  parent :root
end

crumb :mypage_edit do
  link "プロフィール", edit_mypage_path
  parent :mypage
end

crumb :mypage_show do
  link "支払い方法", mypage_path
  parent :mypage
end

crumb :mypage_destroy do
  link "ログアウト", logout_mypages_path
  parent :mypage
end

crumb :address_edit do
  link "本人情報の登録", edit_address_path
  parent :mypage
end

crumb :items_show do |item|
  link "#{item.name}", item_path
  parent :root
end

crumb :items_status do
  link "出品した商品 - 出品中", new_item_path
  parent :mypage
end

crumb :items_detail do
  link '出品商品画面', detail_item_path
  parent :items_status
end

crumb :categories do
  link 'カテゴリー一覧', categories_path
  parent :root
end

crumb :category_show do |category|
  link "#{category.name}", category_path
  parent :categories
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