# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.create name: 'Aldric Giacomoni', approved: true, admin: true,
              password: 'OochieMama', email: 'aldric@cyrusinnovation.com'

Member.create name: 'Jason Berry', approved: true, admin: true,
              password: '123123', email: 'jberry@cyrusinnovation.com'