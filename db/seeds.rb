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

  books = Book.all
  user = User.find_by(email: "test@example.com")
  books.each_with_index do |book, i|
    if i.even?
      book.lendings.create!( user_id: user.id,
                             return_at: Date.today.days_since(i))
    else
      book.lendings.create!( user_id: user.id,
                             return_at: Date.today.days_ago(i),
                             return_status: true )
    end
  end
end
