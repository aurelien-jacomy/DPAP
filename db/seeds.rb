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
User.destroy_all
LabelToFabric.destroy_all
CompanyUser.destroy_all
FabricToCart.destroy_all
Fabric.destroy_all

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

jean = User.create!(
	name: "Jean",
	email: "jean@gmail.com",
	password: "123456",
)

puts "Created 5 users:"
User.all.each do |user|
	puts "  - #{user.name}"
end

puts "Creating Companies: logo download can take some time..."
puts "------------"

algodao = Company.create!(
	name: "Sou de Algodão",
	cep: "01434-000",
	description: "Fabricante de tecídos 100% Algodão, com Algodão orgânico produzido no Brasil",
	uf: "SP",
	cidade: "São Paulo",
	bairro: "Jardim America",
	rua: "Rua Groenlândia",
	numero: "808",
	complemento: "Casa",
	owner: gabriel,
	cnpj: "31.100.900/0001-34"
)

file = URI.open('https://i.pinimg.com/474x/06/14/a1/0614a1ec120f36cdc42a90c2d241e799--bespoke-boutiques.jpg')
algodao.logo.attach(io: file, filename: 'logo_company.jpg', content_type: 'image/jpg')

tecidou = Company.create!(
	name: "Chanel",
	cep: "01219-010",
	description: "Produzimos roupas a partir de Algodão orgânico do Brasil",
	uf: "SP",
	cidade: "São Paulo",
	bairro: "Santa Cecilia",
	rua: "Largo do Arouche",
	numero: "270",
	complemento: "Condomínio Edif Barão de Alfenas",
	owner: aurelien,
	cnpj: "55.836.677/0001-56"
)

tecidou = Company.create!(
	name: "Tecidou",
	cep: "01219-010",
	description: "Produzimos tecidos a partir de Algodão orgânico do Brasil",
	uf: "SP",
	cidade: "São Paulo",
	bairro: "Santa Cecilia",
	rua: "Largo do Arouche",
	numero: "270",
	complemento: "Condomínio Edif Barão de Alfenas",
	owner: jean,
	cnpj: "55.836.677/0001-56"
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
	composition: "100% Algodão",
	company: Company.last,
	price: 10000,
	shipment_time: 2,
	minimum_qty: 50
)

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/08/splendor.jpg')
fabric = Fabric.last
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/08/liana-cel.jpg')
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/08/soli%C3%AA.jpg')
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/08/GR%C3%83OS.jpg')
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

puts "Fabric ##{Fabric.count} done"

Fabric.create!(
	name: "Red Tulip",
	colour: "Vermelho",
	width: 180,
	gramatura: 255,
	fabric_type: "Malha",
	composition: "100% Algodão",
	company: Company.last,
	price: 20000,
	shipment_time: 5,
	minimum_qty: 100
)

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/ASPEN.jpeg')
fabric = Fabric.last
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/BRI%C3%81TICO-VERMELHO.jpg')
fabric.photos.attach(io: file, filename: 'black_velvet.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/GRANADA.jpeg')
fabric.photos.attach(io: file, filename: 'black_velvet.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/POLINESIA.jpeg')
fabric.photos.attach(io: file, filename: 'black_velvet.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/06/VALENTINE-5.jpeg')
fabric.photos.attach(io: file, filename: 'black_velvet.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

puts "Fabric ##{Fabric.count} done"

Fabric.create!(
	name: "Black Velvet",
	colour: "Preto",
	width: 110,
	gramatura: 185,
	fabric_type: "Tecido plano estampado",
	composition: "100% Algodão",
	company: Company.last,
	price: 20000,
	shipment_time: 5,
	minimum_qty: 100
)

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/AGNES.jpeg')
fabric = Fabric.last
fabric.photos.attach(io: file, filename: 'black_velvet.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/VERSUS-PRETO.jpg')
fabric.photos.attach(io: file, filename: 'green_hornet.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/06/YVES-COLOR-2.jpeg')
fabric.photos.attach(io: file, filename: 'green_hornet.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/08/LUMIN%C3%8A.jpg')
fabric.photos.attach(io: file, filename: 'green_hornet.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/06/GRANADA-MESCLA-2.jpeg')
fabric.photos.attach(io: file, filename: 'green_hornet.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

puts "Fabric ##{Fabric.count} done"

Fabric.create!(
	name: "Green Hornet",
	colour: "Verde",
	width: 110,
	gramatura: 185,
	fabric_type: "Tecido plano estampado",
	composition: "100% Algodão",
	company: Company.last,
	price: 20000,
	shipment_time: 5,
	minimum_qty: 100
)

file = URI.open('https://d26lpennugtm8s.cloudfront.net/stores/994/149/products/artigo-marselha1-832ca871874872cf0e15886905775436-320-0.jpeg')
fabric = Fabric.last
fabric.photos.attach(io: file, filename: 'green_hornet.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/LINDISSIMA.jpeg')
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/08/movimento.jpg')
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/08/isabela.jpg')
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/08/achmea.jpg')
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

file = URI.open('https://gvallone.com.br/wp-content/uploads/2019/05/JULIETTE.jpeg')
fabric.photos.attach(io: file, filename: 'edelweiss.jpg', content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"

puts "Fabric ##{Fabric.count} done"


# "RANDOM SEED"
cores = ["Preto", "Branco", "Azul", "Amarelo", "Roxo", "Vinho", "Laranja"]
tipos = ["Algodão", "Malha", "Linho", "Camurça", "Seda"]
urls = ["https://source.unsplash.com/collection/1194592/#{rand(1..280)}","https://source.unsplash.com/collection/2452979/#{rand(1..280)}","https://source.unsplash.com/collection/9851829/#{rand(1..280)}"]

30.times do

Fabric.create!(
	name: "#{cores.sample} #{tipos.sample}",
	colour: cores.sample,
	width: rand(100..200),
	gramatura: rand(100..200),
	fabric_type: tipos.sample,
	composition: "#{rand(50..100)}% #{tipos.sample}",
	company: Company.first,
	price: rand(10000..200000),
	shipment_time: rand(1..50),
	minimum_qty: rand(50..200)
)

3.times do 
file = URI.open(urls.sample)
fabric = Fabric.last
fabric.photos.attach(io: file, filename: "fabrics#{rand(1...1000)}.jpg", content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"
end

puts "Photo ##{fabric.photos.count}"

puts "Fabric ##{Fabric.count} done"

puts "Created #{Fabric.count} fabrics:"

end
# END OF RANDOM SEED

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
	quantity: 100
)

FabricToCart.create!(
	user: User.first,
	fabric: Company.first.fabrics[1],
	quantity: 150
)

FabricToCart.create!(
	user: User.first,
	fabric: Fabric.last,
	quantity: 125
)

puts "Added #{FabricToCart.count} fabrics to user #{FabricToCart.first.user.name}"

DeliveryPoint.create!(
	name: "Alinha Costureiras",
	uf: "SP",
	bairro: "Jardim Paulista",
	cidade: "Sâo Paulo",
	rua:"Rua Bela Cintra",
	numero: "408",
	cep: "01415-000",
	contact: "Eliuma",
	comment: "2° andar, entregar em mãos próprias",
	favourite: true, 
	user: User.first 
)

DeliveryPoint.create!(
	name: "Escritório",
	uf: "SP",
	bairro: "Jardim Paulista",
	cidade: "Sâo Paulo",
	rua:"Rua Bela Cintra",
	numero: "408",
	cep: "01415-000",
	contact: "Aurélien",
	comment: "deixar na recepção",
	favourite: false, 
	user: User.first 
)

puts "Created #{DeliveryPoint.count} for #{User.first.name}"

puts "Seed Done!"
