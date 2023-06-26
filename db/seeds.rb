# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者の初期登録
Admin.create!(
  email: 'abc@abc',
  password: '100000',
  )

# 顧客の初期登録
Customer.create!(
  name: '山田太郎',
  email: 'e@gmail.com',
  password: '111111',
  introduction: 'よろしくお願いします。',
  )

Customer.create!(
  name: '佐藤次郎',
  email: 'f@gmail.com',
  password: '222222',
  introduction: 'よろしくお願いします。',
  )

Customer.create!(
  name: '田中三郎',
  email: 'g@gmail.com',
  password: '333333',
  introduction: 'よろしくお願いします。',
  )

Customer.create!(
  name: '高橋四郎',
  email: 'h@gmail.com',
  password: '444444',
  introduction: 'よろしくお願いします。',
  )

Customer.create!(
  name: '鈴木五郎',
  email: 'i@gmail.com',
  password: '555555',
  introduction: 'よろしくお願いします。',
  )

Customer.create!(
  name: '伊藤六郎',
  email: 'j@gmail.com',
  password: '666666',
  introduction: 'よろしくお願いします。',
  )
