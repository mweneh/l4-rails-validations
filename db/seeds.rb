puts "Creating Artists ..."

Artist.create({
    name: "Trio Mio",
    age: 17
})

Artist.create({
    name: "Nandy",
    age: 29
})

Artist.create({
    name: "Mejja",
    age: 36
})

puts "Thats some proper lineup!"

puts "Some songs added here..."

Song.create({
    title: "Cheza kama wewe",
    duration: 4,
    artist: 1
})

Song.create({
    title: "Kanairo Dating",
    duration: 3,
    artist: 3
})

Song.create({
    title: "Nimekuzoea",
    duration: 4,
    artist: 2
})

puts "Your songs are here!"