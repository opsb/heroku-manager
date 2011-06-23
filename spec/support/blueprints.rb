require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Account.blueprint do
  email { Faker::Internet.email }
  password { Faker::Lorem.words(1) }
end