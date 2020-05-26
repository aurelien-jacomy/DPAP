# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "Cleaning Database"
Company.destroy_all
Label.destroy_all
puts "Database empty"

puts "Creating MVP Elements"
puts "------------"

aurelien = User.create!(
	name: "Aurelien Jacomy",
	email: "jacomya@gmail.com",
	password: "123456",
)



gabriel = User.create!(
	name: "Gabriel Antonini",
	email: "gabriel.antonini@gmail.com",
	password: "123456",
)

victor = User.create!(
	name: "Victor Albanezi",
	email: "victor.albanezi@gmail.com",
	password: "123456",
)

samuel = User.create!(
	name: "Samuel",
	email: "samuel@gmail.com",
	password: "123456",
)
puts "Created 3 users:"
User.all.each do |user|
	puts "  - #{user.name}"
end
puts "------------"

algodao = Company.create!(
	name: "Sou de Algodão",
	billing_address: "Rua Groenlândia 808 Sao Paulo",
	cep: "01415-000",
	description: "Fabricante de tecídos 100% algodão, com algodão orgânico produzido no Brasil",
	owner: aurelien
)

tecidou = Company.create!(
	name: "Tecidou",
	billing_address: "Largo do Arouche 270 Sao Paulo",
	cep: "01219-010",
	description: "Produzimos roupas a partir de algodão orgânico do Brasil",
	owner: gabriel
)

puts "Created 2 companies: #{Company.first.name} and #{Company.last.name}"
puts "------------"

CompanyUser.create!(
	user: samuel,
	company: tecidou,
	status: :active,
	role: :standard

)

CompanyUser.create!(
	user: victor,
	company: tecidou,
	status: :active,
	role: :standard

)



puts "Creating Fabrics: image download can take some time..."

Fabric.create!(
	name: "Edelweiss",
	colour: "Branco",
	width: 140,
	gramatura: 125,
	fabric_type: "Tecido plano",
	composition: "100% algodão",
	company: Company.first,
	price: 10000,
	shipment_time: 2,
	minimum_qty: 50
)

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/08/splendor.jpg')
fabric = Fabric.last
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

Fabric.create!(
	name: "Red Tulip",
	colour: "Vermelho",
	width: 180,
	gramatura: 255,
	fabric_type: "Malha",
	composition: "100% algodão",
	company: Company.first,
	price: 20000,
	shipment_time: 5,
	minimum_qty: 100
)

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/ASPEN.jpeg')
fabric = Fabric.last
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

Fabric.create!(
	name: "Black Velvet",
	colour: "Preto",
	width: 110,
	gramatura: 185,
	fabric_type: "Tecido plano estampado",
	composition: "100% algodão",
	company: Company.first,
	price: 20000,
	shipment_time: 5,
	minimum_qty: 100
)

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/AGNES.jpeg')
fabric = Fabric.last
fabric.photos.attach(io: file, filename: 'black_velvet.jpg', content_type: 'image/jpg')

Fabric.create!(
	name: "Green Hornet",
	colour: "Verde",
	width: 110,
	gramatura: 185,
	fabric_type: "Tecido plano estampado",
	composition: "100% algodão",
	company: Company.last,
	price: 20000,
	shipment_time: 5,
	minimum_qty: 100
)

file = URI.open('https://d26lpennugtm8s.cloudfront.net/stores/994/149/products/artigo-marselha1-832ca871874872cf0e15886905775436-320-0.jpeg')
fabric = Fabric.last
fabric.photos.attach(io: file, filename: 'green_hornet.jpg', content_type: 'image/jpg')


puts "Created #{Fabric.count} fabrics:"
Fabric.all.each do |item|
	puts "  - #{item.name}"
end
puts "------------"


Label.create!(
	name: "Orgânicos do Brasil"
)

Label.create!(
	name: "Fair Trade"
)

puts "Created 2 labels:"
Label.all.each do |item|
	puts "  - #{item.name}"
end
puts "------------"

FabricToCart.create!(
	user: User.first,
	fabric: Company.first.fabrics[0],
	quantity: 60
)

FabricToCart.create!(
	user: User.first,
	fabric: Company.first.fabrics[1],
	quantity: 60
)

FabricToCart.create!(
	user: User.first,
	fabric: Fabric.last,
	quantity: 100
)

puts "Added #{FabricToCart.count} fabrics to user #{FabricToCart.first.user.name}"
