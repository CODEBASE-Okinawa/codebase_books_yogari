ActiveRecord::Base.transaction do
  # 追加のユーザーをまとめて生成する
  books = []
  10.times do
    books << Faker::Book.title
  end
  books.uniq.each do |book|
    Book.create!(title: book)
  end

  if Rails.env.development?
    AdminUser.create!(email: "admin@example.com", password: "password",
                      password_confirmation: "password")
  end
end
