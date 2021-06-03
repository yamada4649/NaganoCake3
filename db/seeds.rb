# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: "abbb@abbb",
   password: "aaaaaa"
    )
Genre.create!(
	name: "タルト",
	vail_flag: "true",
  image: open('./app/assets/images/taruto.jpg')

	)
Genre.create!(
  name: "チーズケーキ",
  vail_flag: "true",
  image: open('./app/assets/images/ti-zu.jpg')

  )
Genre.create!(
  name: "ミルフィーユ",
  vail_flag: "true",
  image: open('./app/assets/images/miru.png')

  )
Genre.create!(
  name: "モンブラン",
  vail_flag: "true",
  image: open('./app/assets/images/monnburann.jpg')

  )
Genre.create!(
  name: "チョコケーキ",
  vail_flag: "true",
  image: open('./app/assets/images/tyoko.jpg')

  )
Genre.create!(
  name: "焼き菓子",
  vail_flag: "true",
  image: open('./app/assets/images/yakigasi.jpg')

  )
Item.create!(
    name: "イチゴとホワイトチョコのタルト",
    genre_id: 1,
    notax_price: 1000
   )
Item.create!(
    name: "青森県産のブルーベリータルト",
    genre_id: 1,
    notax_price: 1000
   )
Item.create!(
    name: "バナナタルト",
    genre_id: 1,
    notax_price: 1200
   )
Image.create!(
  item_id: 1,
  profile_image: open('./app/assets/images/itigonamatyokp.jpg')
  )
Image.create!(
  item_id: 1,
  profile_image: open('./app/assets/images/burubery.jpg')
  )
Image.create!(
  item_id: 1,
  profile_image: open('./app/assets/images/banana.jpg')
  )
Genre.all.each do |genre|
genre.items.create!(
     name: "モンブラン",
     description: "いい感じ",
    sale_status: "true",
    notax_price: "1000",
    genre_id:"1",
    product_image: open('./app/assets/images/monburan.png')
	)
end