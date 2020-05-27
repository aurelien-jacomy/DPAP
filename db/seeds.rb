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

puts "Creating Companies: logo download can take some time..."
puts "------------"

algodao = Company.create!(
	name: "Sou de Algodão",
	billing_address: "Rua Groenlândia 808 Sao Paulo",
	cep: "01415-000",
	description: "Fabricante de tecídos 100% algodão, com algodão orgânico produzido no Brasil",
	owner: aurelien
)

file = URI.open('https://i.pinimg.com/474x/06/14/a1/0614a1ec120f36cdc42a90c2d241e799--bespoke-boutiques.jpg')
algodao.logo.attach(io: file, filename: 'logo_company.jpg', content_type: 'image/jpg')

tecidou = Company.create!(
	name: "Tecidou",
	billing_address: "Largo do Arouche 270 Sao Paulo",
	cep: "01219-010",
	description: "Produzimos roupas a partir de algodão orgânico do Brasil",
	owner: gabriel
)

file = URI.open('https://i.pinimg.com/474x/be/6c/2e/be6c2e31f300ce0a1f6b44738aa6f9e5--vector-icons-beauty-tips.jpg')
tecidou.logo.attach(io: file, filename: 'logo_company.jpg', content_type: 'image/jpg')

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

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/08/liana-cel.jpg')
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Fabric ##{Fabric.count} done"

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

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/BRI%C3%81TICO-VERMELHO.jpg')
fabric.photos.attach(io: file, filename: 'black_velvet.jpg', content_type: 'image/jpg')

puts "Fabric ##{Fabric.count} done"

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

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/VERSUS-PRETO.jpg')
fabric.photos.attach(io: file, filename: 'green_hornet.jpg', content_type: 'image/jpg')

puts "Fabric ##{Fabric.count} done"

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

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/LINDISSIMA.jpeg')
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Fabric ##{Fabric.count} done"

puts "Created #{Fabric.count} fabrics:"
Fabric.all.each do |item|
	puts "  - #{item.name}"
end
puts "------------"

puts "Creating Labels: image download can take some time..."

Label.create!(
	name: "Orgânicos do Brasil"
)

file = URI.open('https://www.portaldofranchising.com.br/wp-content/uploads/2017/07/selo-verde-216x300.jpg')
label = Label.last
label.photo.attach(io: file, filename: 'label.jpg', content_type: 'image/jpg')

puts "Label ##{Label.count} done"

Label.create!(
	name: "Fair Trade"
)

file = URI.open('https://institutooxford.com.br/wp-content/uploads/2016/12/selo-empresa-amiga-meio-ambiente-1.png')
label = Label.last
label.photo.attach(io: file, filename: 'label.png', content_type: 'image/png')

puts "Label ##{Label.count} done"

Label.create!(
	name: "Ecolabel"
)

file = URI.open('https://www.lesnouvellesdelaboulangerie.fr/sites/default/files/ckfinder/userfiles/images/web-NF-environnement.jpg')
label = Label.last
label.photo.attach(io: file, filename: 'label.jpg', content_type: 'image/jpg')

puts "Label ##{Label.count} done"

puts "Created #{Label.count} labels:"
Label.all.each do |item|
	puts "  - #{item.name}"
end

puts 'Creating Label To Fabric'

Fabric.all.each do |fabric|
	2.times do
		label_to_fabric = LabelToFabric.new
		label_to_fabric.fabric = fabric
		labels_count = Label.count
		label_to_fabric.label = Label.all.sample
		label_to_fabric.save!
	end
end

puts "Linked #{LabelToFabric.count} Labels to Fabrics"
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
