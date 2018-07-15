# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Musician.destroy_all
Band.destroy_all

musician_1 = Musician.create(name: "Roger Waters", username: "Roger", password: "roger", profile: "amazing guitarist and song writer", instrument: "guitar and vocals")

musician_2 = Musician.create(name: "Syd Barrett", username: "Syd", password: "syd", profile: "unfortunately, no longer with us", instrument: "guitars and vocal")

musician_3 = Musician.create(name: "Nick Mason", username: "Nick", password: "nick", profile: "drummer in the 90's, played 90's drums.", instrument: "drums")

Musician.create(name: "David Gilmour", username: "David", password: "david", profile: "I played the solo in comfortably numb, 'nuff said'", instrument: "guitar and vocals")

Musician.create(name: "Richard Wright", username: "Richard", password: "richard", profile: "bet you didn't know I was in the band, I play keyboards", instrument: "keyboard")

band_1 = musician_1.bands.create(name:"Blue Floyd", photo: "nothing", genre: "rock")

musician_1.bands.create(name:"Purple Sabbath", photo: "nothing", genre: "metal")

musician_2.bands.create(name:"Deep blurple", photo: "nothing", genre: "jazz funk hybrid")

musician_3.bands.create(name:"Fuzz", photo: "nothing", genre: "hip hop")

BandMusician.create(musician_id: musician_2.id, band_id: band_1.id)
