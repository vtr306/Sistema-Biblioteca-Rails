# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
    Author.create!(name: Faker::Book.unique.author)
    Category.create!(name: Faker::Book.unique.genre)
    Client.create!(name: Faker::Name.unique.name)
    Librarian.create!(email: Faker::Internet.unique.email)
end

5.times do
    Book.create!(name: Faker::Book.unique.title, stock: Faker::Number.unique.between(from: 0, to: 10), author: Author.all.sample, category: Category.all.sample)
end

3.times do
    Reservation.create!(book: Book.all.sample, client: Client.all.sample, librarian: Librarian.all.sample)
end