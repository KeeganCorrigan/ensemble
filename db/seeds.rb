# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Musician.destroy_all
Band.destroy_all
BandMusician.destroy_all

musician_1 = Musician.create(name: "Roger Waters", username: "roger", password: "roger", profile: "amazing guitarist and song writer", instrument: "guitar and vocals")

musician_2 = Musician.create(name: "Syd Barrett", username: "Syd", password: "syd", profile: "unfortunately, no longer with us", instrument: "guitars and vocal")

musician_3 = Musician.create(name: "Nick Mason", username: "Nick", password: "nick", profile: "drummer in the 90's, played 90's drums.", instrument: "drums")

musician_4 = Musician.create(name: "David Gilmour", username: "David", password: "david", profile: "I played the solo in comfortably numb, 'nuff said'", instrument: "guitar and vocals")

musician_5 = Musician.create(name: "Richard Wright", username: "Richard", password: "richard", profile: "bet you didn't know I was in the band, I play keyboards", instrument: "keyboard")

musician_6 = Musician.create(name: "ringo", username: "ringo", password: "ringo", profile: "second best drummer in the beatles", instrument: "drums")

musician_7 = Musician.create(name: "john", username: "john", password: "john", profile: "talented with a poor choice in friends", instrument: "piano, vocals, guitar")

musician_8 = Musician.create(name: "paul", username: "paul", password: "paul", profile: "Can't believe I was in wings", instrument: "guitar and vocals")

musician_9 = Musician.create(name: "george", username: "george", password: "george", profile: "I wrote, like, two good songs", instrument: "second fiddle")

musician_10 = Musician.create(name: "elvis", username: "elvis", password: "elvis", profile: "so, this is where I wound up", instrument: "the heart of america")

band_1 = musician_1.bands.create(name:"Blue Floyd", photo: "nothing", genre: "psychedelic rock")

BandMusician.create(musician_id: musician_2.id, band_id: band_1.id)
BandMusician.create(musician_id: musician_3.id, band_id: band_1.id)
BandMusician.create(musician_id: musician_4.id, band_id: band_1.id)

band_2 = musician_6.bands.create(name:"The Bugs", photo: "sweet logo", genre: "rock")

BandMusician.create(musician_id: musician_4.id, band_id: band_2.id)
BandMusician.create(musician_id: musician_5.id, band_id: band_2.id)
BandMusician.create(musician_id: musician_7.id, band_id: band_2.id)

band_3 = musician_10.bands.create(name: "Elvis and the tantrums", photo: "big pants", genre: "country")

BandMusician.create(musician_id: musician_7.id, band_id: band_3.id)
BandMusician.create(musician_id: musician_8.id, band_id: band_3.id)
BandMusician.create(musician_id: musician_9.id, band_id: band_3.id)

song_1 = band_1.songs.create( title: "trying to live a little", timing: "4/4", genre: "folk")

song_2 = band_1.songs.create( title: "the curse", timing: "4/4", genre: "folk")

song_3 = band_2.songs.create( title: "adored", timing: "4/4", genre: "rock")

song_4 = band_2.songs.create( title: "hum of creation", timing: "4/4", genre: "jazz")

song_5 = band_3.songs.create( title: "verdun", timing: "4/4", genre: "folk")

song_6 = band_3.songs.create( title: "kamikaze love", timing: "4/4", genre: "rock")

song_1.iterations.create(
                          content: "Death during stampede for food
two little boys and a little girl
every pressing body, heavy with hunger
young men ripe and fit to burst
languish in the harshness of all things

beat up bags of bones the lot
exist to be in harms way
a second deluge of warm bodies crashes
like big waves that eat the surface of the earth",
                          recording: "https://s3-us-west-1.amazonaws.com/kc-ensemble/the+hum+of+creation+v+6.wav",
                          comment: "a work in progress, added guitars",
                          author: musician_1.name,
                          musician_id: musician_1.id
                        )

  song_1.iterations.create(
                            content: "As a ghost or a shadow\n
If a color like blue \n
Yells back at you  \n
Like a rogue typhoon\n

Oh, I can’t hear you\n
Oh, I can’t hear you\n

Is it a good conversation\n
Did I speak too soon?\n
In a frequency unheard of\n
at the edge of the moon\n

Oh, I can’t hear you\n
Oh, I can’t hear you  \n

Was it healthy paranoia \n
When I poured out my heart \n
With a voice like an elevator \n
Into the dark
",
                            recording: "https://s3-us-west-1.amazonaws.com/kc-ensemble/my+one+good+eye.wav",
                            comment: "has some piano, needs vocals",
                            author: musician_2.name,
                            musician_id: musician_2.id
                          )

song_3.iterations.create(
                          content: "As a ghost or a shadow\n
  If a color like blue \n
  Yells back at you  \n
  Like a rogue typhoon\n

  Oh, I can’t hear you\n
  Oh, I can’t hear you\n

  Is it a good conversation\n
  Did I speak too soon?\n
  In a frequency unheard of\n
  at the edge of the moon\n

  Oh, I can’t hear you\n
  Oh, I can’t hear you  \n

  Was it healthy paranoia \n
  When I poured out my heart \n
  With a voice like an elevator \n
  Into the dark",
                          recording: "https://s3-us-west-1.amazonaws.com/kc-ensemble/The+coast+is+clear.mp3",
                          comment: "has some piano, needs vocals",
                          author: musician_6.name,
                          musician_id: musician_6.id
                        )

song_3.iterations.create(
                          content: "As a ghost or a shadow\n
  If a color like blue \n
  Yells back at you  \n
  Like a rogue typhoon\n

  Oh, I can’t hear you\n
  Oh, I can’t hear you\n

  Is it a good conversation\n
  Did I speak too soon?\n
  In a frequency unheard of\n
  at the edge of the moon\n

  Oh, I can’t hear you\n
  Oh, I can’t hear you  \n

  Was it healthy paranoia \n
  When I poured out my heart \n
  With a voice like an elevator \n
  Into the dark
                                    ",
                          recording: "https://s3-us-west-1.amazonaws.com/kc-ensemble/dun+dun+dun+dun+v+2.wav",
                          comment: "has some piano, needs vocals",
                          author: musician_5.name,
                          musician_id: musician_5.id
                        )
