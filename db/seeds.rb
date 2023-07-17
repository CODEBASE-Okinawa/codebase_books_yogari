ActiveRecord::Base.transaction do
  10.times do
    Book.create!(
      title: Faker::Book.title,
<<<<<<< HEAD
      isbn: '479806775X'
=======
      isbn: SecureRandom.random_number(10**10).to_s.rjust(10, '0')
>>>>>>> main
    )
  end

  User.create!(
    name: "admin",
    email: "admin@example.com",
    password: "password",
    password_confirmation: "password",
    role: 0
  )

  3.times do |n|
    User.create!(
      name: "テストユーザー#{n + 1}",
      email: "test#{n + 1}@example.com",
      password: "password",
      password_confirmation: "password",
      role: 1
    )
  end

  user = User.find_by(email: "test1@example.com")

  3.times do |n|
    user.reservations.create!(
      book_id: n + 1,
      reservation_at: Time.now + (n + 1).days,
      return_at: Time.now + (n + 7).days
    )
  end

  5.times do |n|
    if n.even?
      user.lendings.create!(
        book_id: n + 4,
        return_at: Date.today.days_since(n)
      )
    else
      user.lendings.create!(
        book_id: n + 4,
        return_at: Date.today.days_ago(n),
        return_status: true
      )
    end
  end
  
  3.times do |n|
    RequestBook.create!(
      isbn: rand(1000000000..1111111111),
      title: Faker::Book.title,
      author: Faker::Name.name
    )
    RequestBook.create!(
      isbn: rand(1000000000..1111111111),
      title: Faker::Book.title,
      author: Faker::Name.name,
      status: false
    )
  end
end
