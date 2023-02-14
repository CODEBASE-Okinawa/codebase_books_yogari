ActiveRecord::Base.transaction do
  # 追加のユーザーをまとめて生成する
  10.times do
    Book.create!(title: Faker::Book.title)
  end

  User.create!(
    name: "admin",
    email: "admin@example.com",
    password: "password",
    password_confirmation: "password",
    role: 0
  )

  User.create!(
    name: "テストユーザー",
    email: "test@example.com",
    password: "password",
    password_confirmation: "password",
    role: 1
  )
end
