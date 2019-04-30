# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jeff = Owner.find_or_create_by(first_name: "Jeff", last_name: "Marks", age: 24, email: "jeff@jeff.com")
billy = Owner.find_or_create_by(first_name: "Billy", last_name: "Joe", age: 55, email: "billyjoe@jeff.com")
morton = Owner.find_or_create_by(first_name: "Morton", last_name: "Williams", age: 127, email: "morton@williams.com")

bennie = Pet.find_or_create_by(name: "Bennie", species: "dog")
tessa = Pet.find_or_create_by(name: "Tessa", species: "dog")
dob_bylan = Pet.find_or_create_by(name: "Dob Bylan", species: "turtle")
pusheen = Pet.find_or_create_by(name: "Pusheen", species: "cat")

bennie.owners << jeff
bennie.owners << billy
bennie.owners << morton

jeff.pets << tessa
jeff.pets << pusheen

dob_bylan.owners << billy
dob_bylan.owners << morton

billy.pets << tessa

morton.pets << pusheen
