ActiveRecord::Base.transaction do
  # 追加のユーザーをまとめて生成する
  10.times do
    Book.create!(title: Faker::Book.title)
  end
end
