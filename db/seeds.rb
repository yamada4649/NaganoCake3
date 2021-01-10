# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: "abb@abb",
   password: "aaaaaa"
    )
Genre.create!(
	name: "ケーキ",
	vail_flag: "true"

	)
Genre.all.each do |genre|
genre.items.create!(
     name: "モンブラン",
     description: "いい感じ",
    sale_status: "true",
    notax_price: "1000",
    genre_id:"0",
    product_image: open('./app/assets/images/monburan.png')
	)
end