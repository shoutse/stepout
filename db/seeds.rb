# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Position.create!( :name => "行銷" )
Position.create!( :name => "PM" )
Position.create!( :name => "業務" )
Position.create!( :name => "人資" )
Industry.create!( :name => "科技業")
Industry.create!( :name => "傳統產業")
Industry.create!( :name => "金融業")
Industry.create!( :name => "農業")
Industry.create!( :name => "傳播業")
Industry.create!( :name => "教育")