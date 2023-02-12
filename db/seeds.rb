ActiveRecord::Base.transaction do
  # 追加のユーザーをまとめて生成する
  10.times do |_n|
    Book.create!(title: Faker::Book.title)
  end

  if Rails.env.development?
    AdminUser.create!(email: "admin@example.com", password: "password",
                      password_confirmation: "password")
  end
end
