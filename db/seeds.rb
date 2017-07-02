# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a1 = Author.create first_name: "Stephen", last_name: "King"
a2 = Author.create first_name: "Dan", last_name: "Brown"
a3 = Author.create first_name: "William", last_name: "Shakespeare"

if a1
    Book.create title: "Carrie", author_id: a1.id
    Book.create title: "It", author_id: a1.id
    Book.create title: "The Shining", author_id: a1.id
    Book.create title: "Misery", author_id: a1.id
    Book.create title: "Cujo", author_id: a1.id
end

if a2
    Book.create title: "The Davinci Code", author_id: a2.id
    Book.create title: "Inferno", author_id: a2.id
end

if a3
    Book.create title: "Midsummer Night\'s Dream", author_id: a3.id
    Book.create title: "Romeo & Juliet", author_id: a3.id
    Book.create title: "Macbeth", author_id: a3.id
end
