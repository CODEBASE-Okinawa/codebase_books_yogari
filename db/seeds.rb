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
  
  User.create!(email: "guest1@mail.com",
               name: "guest1",
               password: "password")
  User.create!(email: "guest2@mail.com",
               name: "guest2",
               password: "password")
  User.create!(email: "guest3@mail.com",
               name: "guest3",
               password: "password")
  User.create!(email: "guest4@mail.com",
               name: "guest4",
               password: "password")

  # reservations のサンプルデータ
  Reservation.create!(user_id: 1,
                      book_id: 1,
                      reservation_at: Time.now + 3.days,
                      return_at: Time.now + 4.days)
  Reservation.create!(user_id: 2,
                      book_id: 1,
                      reservation_at: Time.now + 5.days,
                      return_at: Time.now + 7.days)
  Reservation.create!(user_id: 3,
                      book_id: 1,
                      reservation_at: Time.now + 8.days,
                      return_at: Time.now + 10.days)
  Reservation.create!(user_id: 4,
                      book_id: 1,
                      reservation_at: Time.now - 6.days,
                      return_at: Time.now - 3.days)
  Reservation.create!(user_id: 1,
                      book_id: 1,
                      reservation_at: Time.now - 2.days,
                      return_at: Time.now + 2.days)
  Reservation.create!(user_id: 1,
                      book_id: 3,
                      reservation_at: Time.now + 3.days,
                      return_at: Time.now + 6.days)
  Reservation.create!(user_id: 2,
                      book_id: 3,
                      reservation_at: Time.now + 7.days,
                      return_at: Time.now + 10.days)


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
