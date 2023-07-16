ActiveRecord::Base.transaction do
  10.times do
    Book.create!(
      title: Faker::Book.title,
      isbn: '1111111111'
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
end
