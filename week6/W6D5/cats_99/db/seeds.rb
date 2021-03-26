# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.create(name: 'Phil',
          birth_date: '07-12-1900',
          color: 'green', sex: 'M',
          description: 'I still remember my first doing taxes with Phil.')

Cat.create(name: 'Eduardo',
          birth_date: '11-12-2020',
          color: 'rainbow', sex: 'M',
          description: 'I can recall immidiately the second time he ate a mouse.')

Cat.create(name: 'Felicia',
          birth_date: '08-28-2010',
          color: 'purple', sex: 'F',
          description: 'She was always good at eating pop tarts')

Cat.create(name: 'Jug',
          birth_date: '01-02-2019',
          color: 'invisible', sex: 'F',
          description: 'I remember the first time I saw her and realized she is invisible.')