Book.create!(title: "Sample Book")

# 追加のユーザーをまとめて生成する
20.times do |_n|
  title = Faker::Book.title

  Book.create!(title:)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
