# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


elections = Election.create([
    {
        name: 'Election présidentielle 2017',
        begin: '2017-04-02 06:00:00',
        end: '2017-04-02 06:00:00',
        category: 1
    }
])


elections_type = ElectionsType.create([
    name: 'Nationnal for testing'
])

candidats = Candidat.create([ 
    {
        user_id: 1,
        description: 'BLABLABLA lorem ipsum',
        partie: 'partie loin',
        liste: 'liste ?',
        programme: 'wid wid wid',
    },
    {
        user_id: 2,
        description: 'BLABLABLA lorem ipsum',
        partie: 'partie loin',
        liste: 'liste ?',
        programme: 'wid wid wid',
    },  
    {
        user_id: 3,
        description: 'BLABLABLA lorem ipsum',
        partie: 'partie loin',
        liste: 'liste ?',
        programme: 'wid wid wid',
    },  
    {
        user_id: 4,
        description: 'BLABLABLA lorem ipsum',
        partie: 'partie loin',
        liste: 'liste ?',
        programme: 'wid wid wid',
    }
])


candidats_election = CandidatsElection.create([
    {
        candidat_id: 1,
        election_id: 1
    },
    {
        candidat_id: 2,
        election_id: 1
    },
    {
        candidat_id: 3,
        election_id: 1
    },
    {
        candidat_id: 4,
        election_id: 1
    }
])


user =  User.create([
    {
        name: "Bruno",
        surname: "Le maire",
        birthdate: "1994-02-12",
        email: "email@email.com",
        address: "Adresee du la rue de la ville",
        zipcode: "77340",
        city: "Porto-congo",
        picture: "https://images.pexels.com/photos/157967/portrait-woman-girl-blond-157967.jpeg?h=350&auto=compress&cs=tinysrgb",
        level: 0,
        password: "5f4dcc3b5aa765d61d8327deb882cf99"
    },
    {
        name: "Bruno 2",
        surname: "Le maire",
        birthdate: "1994-02-12",
        email: "email@email.com",
        address: "Adresee du la rue de la ville",
        zipcode: "77340",
        city: "Porto-congo",
        picture: "https://images.pexels.com/photos/3192/woman-girl-beauty-mask.jpg?h=350&auto=compress",
        level: 0,
        password: "5f4dcc3b5aa765d61d8327deb882cf99"
    },
    {
        name: "Bruno 3",
        surname: "Le maire",
        birthdate: "1994-02-12",
        email: "email@email.com",
        address: "Adresee du la rue de la ville",
        zipcode: "77340",
        city: "Porto-congo",
        picture: "https://images.pexels.com/photos/247295/pexels-photo-247295.jpeg?h=350&auto=compress&cs=tinysrgb",
        level: 0,
        password: "5f4dcc3b5aa765d61d8327deb882cf99"
    },
    {
        name: "Bruno 4",
        surname: "Le maire",
        birthdate: "1994-02-12",
        email: "email@email.com",
        address: "Adresee du la rue de la ville",
        zipcode: "77340",
        city: "Porto-congo",
        picture: "https://images.pexels.com/photos/160998/girl-nature-smile-beauty-160998.jpeg?h=350&auto=compress&cs=tinysrgb",
        level: 0,
        password: "5f4dcc3b5aa765d61d8327deb882cf99"
    }

])
