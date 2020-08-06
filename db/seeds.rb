# Create a main sample user.
User.create(name: "Admin",
  email: "admin123456@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: 1)
# Generate a bunch of additional users.
5.times do |n|
User.create([{
    name: Faker::Name.name,
    email: Faker::Internet.email,
    }])
end
