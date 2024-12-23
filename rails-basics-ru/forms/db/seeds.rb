# frozen_string_literal: true

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Post.create({
                title: Faker::Lorem.sentence,
                summary: Faker::Lorem.sentences(number: 2).join(' '),
                body: Faker::Lorem.paragraphs(number: 5).join('\n'),
                published: Faker::Boolean.boolean
              })
end
