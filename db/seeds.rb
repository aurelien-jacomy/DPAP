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
DeliveryPoint.destroy_all
FabricToOrder.destroy_all
Order.destroy_all


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

marco = User.create!(
	name: "Marco",
	email: "marco@gmail.com",
	password: "123456",
)

puts "Created #{User.count} users:"
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

puts "Company ##{Company.count} created"

chanel = Company.create!(
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

file = URI.open('https://i.pinimg.com/originals/38/55/d2/3855d23ea354607dd3e5ee916006a0d7.png')
chanel.logo.attach(io: file, filename: 'logo_company.png', content_type: 'image/png')

puts "Company ##{Company.count} created"

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
	owner: victor,
	cnpj: "55.836.677/0001-56"
)

file = URI.open('https://i.pinimg.com/474x/be/6c/2e/be6c2e31f300ce0a1f6b44738aa6f9e5--vector-icons-beauty-tips.jpg')
tecidou.logo.attach(io: file, filename: 'logo_company.jpg', content_type: 'image/jpg')

puts "Company ##{Company.count} created"

puts "Created #{Company.count} companies:"
Company.all.each do |company|
	puts "- #{company.name}"
end
puts "------------"

CompanyUser.create!(
	user: samuel,
	company: chanel,
	status: :active,
	role: :standard
)

CompanyUser.create!(
	user: jean,
	company: algodao,
	status: :active,
	role: :standard
)

CompanyUser.create!(
	user: marco,
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
	fabric_type: "Tecido",
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
	fabric_type: "Estampado",
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
	fabric_type: "Estampado",
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
tipos = ["Algodão", "Malha", "Linho", "Camurça", "Seda"]
black = ["https://image.freepik.com/free-photo/silk-fabric-cadi-black-color-artistic-layout_133187-6.jpg","https://image.freepik.com/free-photo/black-cloth-background-texture-grooved-black-fabric-abstract_3236-143.jpg","https://images.squarespace-cdn.com/content/v1/5b0228e275f9eeb6408abb72/1526932297281-65Y5KBF5DMD52TAGUP8R/ke17ZwdGBToddI8pDm48kL3VKmwKI3leYB51VJjLFB8UqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcgK5SGg9Ovb1yloBBOHcruw_mYLfAhRzzgArFCB07Dw0L8n4JypuoE5Tg6Wg5Oyvs/black-fabric-texture.jpg","https://image.freepik.com/free-photo/black-fabric-texture-background-wavy-fabric-slippery-black-color-luxury-satin-cloth-text_49947-84.jpg","https://images.squarespace-cdn.com/content/v1/5b0228e275f9eeb6408abb72/1526932297281-65Y5KBF5DMD52TAGUP8R/ke17ZwdGBToddI8pDm48kL3VKmwKI3leYB51VJjLFB8UqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcgK5SGg9Ovb1yloBBOHcruw_mYLfAhRzzgArFCB07Dw0L8n4JypuoE5Tg6Wg5Oyvs/black-fabric-texture.jpg","https://image.freepik.com/free-photo/black-cloth-background-texture-grooved-black-fabric-abstract_3236-143.jpg"]
white = ["https://image.freepik.com/free-photo/wrinkled-white-fabric-texture-cloth-texture-background_1962-1505.jpg","https://images.squarespace-cdn.com/content/v1/5579c243e4b011d2d5c571dd/1553146356450-URU2AJYN9MNEF12QFMHO/ke17ZwdGBToddI8pDm48kDEDYh4Y0JGhR6hzuwcJ44gUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcz6bs2FkMoqlrQIzq4g5ogDqXr_T7rMikH_TfPkEE4wwzGwe9KEhUq6A0DxOZf-75/IMG_3487.jpg","https://images.squarespace-cdn.com/content/v1/5b2397123e2d09f52245e9df/1546420092255-Z66WUONQ2RYACQBQJ9EV/ke17ZwdGBToddI8pDm48kDHPSfPanjkWqhH6pl6g5ph7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0mwONMR1ELp49Lyc52iWr5dNb1QJw9casjKdtTg1_-y4jz4ptJBmI9gQmbjSQnNGng/DSCF4405.JPG","https://i.pinimg.com/474x/8f/b1/6e/8fb16e883d4210f5caec03f149a9e676.jpg","https://sc01.alicdn.com/kf/HTB16D2CdDXYBeNkHFrdq6AiuVXaM/china-supplier-poplin-cotton-printed-fabric-cotton.jpg","https://images.squarespace-cdn.com/content/v1/538af0f9e4b042208abff466/1561636857925-B25QSDCL1OBIVRL5UFHO/ke17ZwdGBToddI8pDm48kNgFyjlEyNHlSWEjE-QCU1p7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UdLKTLgsLX9_T7LnpaostY9WYLb0IFNaX6bgMhY2dUNBWIB-7cQgYKo_bDpR6cEVkg/Minimal-1C.jpg","https://images.squarespace-cdn.com/content/v1/5599e377e4b0892edc019beb/1586028654776-4TVLMHJQGUPLC64T06MP/ke17ZwdGBToddI8pDm48kKAwwdAfKsTlKsCcElEApLR7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UegTYNQkRo-Jk4EWsyBNhwKrKLo5CceA1-Tdpfgyxoog5ck0MD3_q0rY3jFJjjoLbQ/_MG_8676.jpg","https://image.freepik.com/free-photo/white-silk-texture-luxurious-satin-abstract-background-beautiful-white-fabric-soft-focus_55716-1706.jpg","https://sc01.alicdn.com/kf/HTB13xVYd41YBuNjy1zcq6zNcXXas/Greige-White-100-Silk-Satin-Fabric.jpg_350x350.jpg"]
red = ["https://i.pinimg.com/originals/d7/bb/25/d7bb25ace8e3adec7ed4a37eee71c223.jpg","https://images.squarespace-cdn.com/content/v1/5b38f27be749408527257c50/1530485687686-8M5JD31M4OR00VKA0GAV/ke17ZwdGBToddI8pDm48kDEDYh4Y0JGhR6hzuwcJ44gUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcz6bs2FkMoqlrQIzq4g5ogDqXr_T7rMikH_TfPkEE4wwzGwe9KEhUq6A0DxOZf-75/MYSTIQUE-+VOLCANO.RED+.jpg","https://sc02.alicdn.com/kf/HTB1zooOd1kJL1JjSZFmq6Aw0XXa7/Mulinsen-Textile-Reactive-Dyeing-60s-Cotton-Voile.jpg_350x350.jpg","https://image.freepik.com/free-photo/red-silk-texture_1048-3963.jpg","https://image.freepik.com/free-photo/red-fabric-is-laid-out-waves-red-silk-fabric-background-texture_78899-156.jpg","https://image.freepik.com/free-photo/red-fabric-cloth-texture-background-silk-linen_38607-513.jpg","https://image.freepik.com/free-photo/silk-fabric-color-is-crimson-texture-background_133187-9.jpg","https://ae01.alicdn.com/kf/HTB129YWMXXXXXbYXXXXq6xXFXXXI/19-m-m-Red-285cm-Super-Wide-100-Pure-Silk-Charmeuse-Satin-Fabric.jpg","https://image.freepik.com/free-photo/red-fabric-texture_23-2147729333.jpg","https://image.freepik.com/free-photo/red-ornament-indoors-decor-fabric-material_23-2148516019.jpg","https://static.wixstatic.com/media/9ca1bf_7e83e944342c41e7a5a5f489e2af82e0~mv2.jpg"]
blue = ["https://image.freepik.com/free-photo/blue-fabric-texture_23-2147729331.jpg","https://img.freepik.com/free-photo/fabric-textured-background_53876-32109.jpg?size=626&ext=jpg","https://img.freepik.com/free-photo/blue-fabric_1122-374.jpg?size=626&ext=jpg","https://image.freepik.com/free-photo/blue-fabric-background-texture_3236-1266.jpg","https://image.freepik.com/free-photo/background-by-blue-fabric-wallpaper-texture-by-waving-textile-blue_33771-584.jpg","https://img.freepik.com/free-photo/colorful-fabric-material-texture_23-2148383710.jpg?size=626&ext=jpg","https://i.pinimg.com/originals/81/a0/9f/81a09fdbc229d4a50b934ea6a22aa8bd.jpg","https://sc01.alicdn.com/kf/HTB1sSLFea5s3KVjSZFNq6AD3FXaM/Home-Textile-Ues-Eco-Friendly-Dust-Proof.jpg_350x350.jpg","https://i.pinimg.com/originals/53/61/90/536190dfc6fe7c8915eb21fe0489f14c.jpg"]
yellow = ["https://images.squarespace-cdn.com/content/v1/57b718123e00be2170fe89e5/1585771995889-DZP9XRILLBQPVTZ0BY8H/ke17ZwdGBToddI8pDm48kIAxOFyGQR3Lx89o4DH4kswUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKccVw9oYjzdNAKyl2nw8EiYA_-bZsoRUccscCSfUNpRoZj40r_Ofp3h0Jx3uVLEzNf/Marble+by+Nutex+7.jpg","https://images.squarespace-cdn.com/content/v1/5dfee62b245deb77533a18be/1579546281192-QCFW7VRNZSCDWUGH98NG/ke17ZwdGBToddI8pDm48kKWuPA1gEhzfHDYA-kj4Cgt7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UZ5mX8RIOn3SgRDMa2U1OIKCGSwvEt_VG3UVUgaQlUuVy4esdQB3BRl8sZrbGldWOw/fabric-633594_1920.jpg","https://sc02.alicdn.com/kf/HTB184BCbCtYBeNjSspkq6zU8VXaN/200733617/HTB184BCbCtYBeNjSspkq6zU8VXaN.jpg","https://images.squarespace-cdn.com/content/v1/5460a1a9e4b068e8b9f3c0f2/1532428532913-3YC4AZEL95L9QJBLVXMJ/ke17ZwdGBToddI8pDm48kMjknoEHwaq2hBF3yrb2HRV7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0geeCvn1f36QDdcifB7yxGiXEuqY486Bx8LEQvr0fapIJWBUpOoWX3k3xE2w5Anr0w/Mini+Gingham+Yellow.jpg","https://image.freepik.com/free-photo/yellow-polo-shirt-texture-cotton-fabric_100655-287.jpg","https://image.freepik.com/free-photo/beautiful-orange-silk-texture-luxurious-satin-abstract-background-fabric-texture_55716-1518.jpg","https://image.freepik.com/free-photo/beautiful-cream-silk-texture-luxurious-satin-abstract-background-fabric-texture_55716-1433.jpg","https://olabela.pl/userdata/public/gfx/1142.jpg"]
green = ["https://image.freepik.com/free-photo/green-fabric-cloth-texture_23-2148383682.jpg","https://image.freepik.com/free-photo/flat-lay-green-fabric-carnival_23-2148389769.jpg","https://image.freepik.com/free-photo/green-fabric-texture_53876-94024.jpg","https://i.pinimg.com/originals/2d/e2/e0/2de2e006ccd7f6ffaaf7867a214310d9.jpg","https://image.freepik.com/free-photo/background-by-green-fabric-wallpaper-texture-by-waving-textile-green_33771-587.jpg","https://image.freepik.com/free-photo/olive-green-silk-satin-texture-green-cotton-fabric-background-silk-bedding-texture_38477-671.jpg","https://images.squarespace-cdn.com/content/v1/57709e316a4963e88038dff0/1516568353259-L4HDDXGFWEBZ6N4TKV79/ke17ZwdGBToddI8pDm48kAQURYLFB0unV7qwugezHxh7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UfZgsiTzFYKSD_vV_VUK8VsPKVzeuk_4_WONnQjjwVRabd_6_chhqv-nBOr8t60dZw/image5.JPG"]



10.times do

Fabric.create!(
	name: "#{tipos.sample} Amarelo",
	colour: "Amarelo",
	width: rand(100..200),
	gramatura: rand(100..200),
	fabric_type: tipos.sample,
	composition: "#{rand(50..100)}% #{tipos.sample}",
	company: Company.first,
	price: rand(1000..20000),
	shipment_time: rand(1..50),
	minimum_qty: rand(50..200)
)

3.times do 
file = URI.open(yellow.sample)
fabric = Fabric.last
fabric.photos.attach(io: file, filename: "fabrics#{rand(1...1000)}.jpg", content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"
end

puts "Photo ##{fabric.photos.count}"

puts "Fabric ##{Fabric.count} done"

puts "Created #{Fabric.count} fabrics:"

end

10.times do

Fabric.create!(
	name: "#{tipos.sample} Preto",
	colour: "Preto",
	width: rand(100..200),
	gramatura: rand(100..200),
	fabric_type: tipos.sample,
	composition: "#{rand(50..100)}% #{tipos.sample}",
	company: Company.second,
	price: rand(1000..20000),
	shipment_time: rand(1..50),
	minimum_qty: rand(50..200)
)

3.times do 
file = URI.open(black.sample)
fabric = Fabric.last
fabric.photos.attach(io: file, filename: "fabrics#{rand(1...1000)}.jpg", content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"
end

puts "Photo ##{fabric.photos.count}"

puts "Fabric ##{Fabric.count} done"

puts "Created #{Fabric.count} fabrics:"

end

10.times do

Fabric.create!(
	name: "#{tipos.sample} Preto",
	colour: "Preto",
	width: rand(100..200),
	gramatura: rand(100..200),
	fabric_type: tipos.sample,
	composition: "#{rand(50..100)}% #{tipos.sample}",
	company: Company.last,
	price: rand(1000..20000),
	shipment_time: rand(1..50),
	minimum_qty: rand(50..200)
)

3.times do 
file = URI.open(black.sample)
fabric = Fabric.last
fabric.photos.attach(io: file, filename: "fabrics#{rand(1...1000)}.jpg", content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"
end

puts "Photo ##{fabric.photos.count}"

puts "Fabric ##{Fabric.count} done"

puts "Created #{Fabric.count} fabrics:"

end

10.times do

Fabric.create!(
	name: "#{tipos.sample} Azul",
	colour: "Azul",
	width: rand(100..200),
	gramatura: rand(100..200),
	fabric_type: tipos.sample,
	composition: "#{rand(50..100)}% #{tipos.sample}",
	company: Company.second,
	price: rand(1000..20000),
	shipment_time: rand(1..50),
	minimum_qty: rand(50..200)
)

3.times do 
file = URI.open(blue.sample)
fabric = Fabric.last
fabric.photos.attach(io: file, filename: "fabrics#{rand(1...1000)}.jpg", content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"
end

puts "Photo ##{fabric.photos.count}"

puts "Fabric ##{Fabric.count} done"

puts "Created #{Fabric.count} fabrics:"

end

10.times do

Fabric.create!(
	name: "#{tipos.sample} Verde",
	colour: "Verde",
	width: rand(100..200),
	gramatura: rand(100..200),
	fabric_type: tipos.sample,
	composition: "#{rand(50..100)}% #{tipos.sample}",
	company: Company.last,
	price: rand(1000..20000),
	shipment_time: rand(1..50),
	minimum_qty: rand(50..200)
)

3.times do 
file = URI.open(green.sample)
fabric = Fabric.last
fabric.photos.attach(io: file, filename: "fabrics#{rand(1...1000)}.jpg", content_type: 'image/jpg')

puts "Photo ##{fabric.photos.count}"
end

puts "Photo ##{fabric.photos.count}"

puts "Fabric ##{Fabric.count} done"

puts "Created #{Fabric.count} fabrics:"

end

10.times do

Fabric.create!(
	name: "#{tipos.sample} Vermelho",
	colour: "Vermelho",
	width: rand(100..200),
	gramatura: rand(100..200),
	fabric_type: tipos.sample,
	composition: "#{rand(50..100)}% #{tipos.sample}",
	company: Company.first,
	price: rand(1000..20000),
	shipment_time: rand(1..50),
	minimum_qty: rand(50..200)
)

3.times do 
file = URI.open(red.sample)
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
	quantity: 200
)

FabricToCart.create!(
	user: User.first,
	fabric: Company.first.fabrics[1],
	quantity: 250
)

FabricToCart.create!(
	user: User.first,
	fabric: Fabric.last,
	quantity: 225
)

puts "Added #{FabricToCart.count} fabrics to user #{FabricToCart.first.user.name}"
puts "------------"

User.all.each do |user|
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
		user: user, 
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
		user: user,
	)

	puts "Created #{user.delivery_points.count} delivery points for #{user.name}"
end

puts "Created #{DeliveryPoint.count} Delivery Points"
puts "------------"

puts "Seed Done!!!"
