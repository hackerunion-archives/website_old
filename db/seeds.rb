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

if Rails.env != 'production'
  Member.create name: 'Pending', approved: false, admin: false,
                password: '123123', email: 'pending@email.com'
  Member.create name: 'Approved', approved: true, admin: false,
                password: '123123', email: 'approved@email.com'
  Member.create name: 'Admin', approved: true, admin: true,
                password: '123123', email: 'admin@email.com'

  Member.create name: 'Pending2', approved: false, admin: false,
                password: '123123', email: 'pending2@email.com'
  Member.create name: 'Approved2', approved: true, admin: false,
                password: '123123', email: 'approved2@email.com'
  Member.create name: 'Admin2', approved: true, admin: true,
                password: '123123', email: 'admin2@email.com'
end