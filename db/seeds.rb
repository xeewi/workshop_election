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
        end: '2017-04-02 06:00:00'
    }
])


elections_type = ElectionsType.create([
    name: 'Nationnal for testing'
])