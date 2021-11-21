# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

p '#1 - Cleanring all tables......'
Transaction.destroy_all
Subcategory.destroy_all
Category.destroy_all
Account.destroy_all
Ledger.destroy_all

# p '#2 - Creating new users.....'
# User.create!(email: 'nico@mail.com', password: 123456, password_confirmation: 123456)

p '#3 - Creating new ledgers.....'
Ledger.create!(name: 'Gastos', description: 'nice description')

p '#4 - Creating new accounts.....'
Account.create!(name: 'BBVA', ledger: Ledger.first)

p '#5 - Creating new categories.....'
Category.create!(name: 'Food', ledger: Ledger.first)
Category.create!(name: 'Transportation', ledger: Ledger.first)
Category.create!(name: 'Income', ledger: Ledger.first)

p '#6 - Creating new subcategories.....'
Subcategory.create!(name: 'Supermercado', category: Category.first)
Subcategory.create!(name: 'Almuerzo/Cena', category: Category.first)
Subcategory.create!(name: 'Bus ticket', category: Category.second)
Subcategory.create!(name: 'Bicing', category: Category.second)
Subcategory.create!(name: 'Sueldo', category: Category.third)

p '#7 - Creating new transactions.....'
# 10.times {
#   Transaction.create!(ledger: Ledger.first, account: Account.first, date: Date.today, info: 'some info', subcategory: Subcategory.find(rand(1..4)), ttype: rand(0...1), value: rand(-20..20), cleared: true)
# }
Transaction.create!(ledger: Ledger.first, account: Account.first, date: Date.today, info: 'some info', subcategory: Subcategory.first, ttype: true, value: 60, cleared: true)
Transaction.create!(ledger: Ledger.first, account: Account.first, date: Date.today, info: 'some info', subcategory: Subcategory.second, ttype: true, value: 3, cleared: false)
Transaction.create!(ledger: Ledger.first, account: Account.first, date: Date.yesterday, info: 'some info', subcategory: Subcategory.second, ttype: true, value: 5, cleared: false)
Transaction.create!(ledger: Ledger.first, account: Account.first, date: Date.tomorrow, info: 'some info', subcategory: Subcategory.second, ttype: true, value: 2, cleared: false)
Transaction.create!(ledger: Ledger.first, account: Account.first, date: Date.tomorrow, info: 'some info', subcategory: Subcategory.fifth, ttype: false, value: 2500, cleared: true)

p 'Everything done!'
