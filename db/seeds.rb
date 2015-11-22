puts('Seeding users...')

User.delete_all
User.create(first_name: "Eric", first_name: "Hermann", email: "eric@erichermann.com", password: "pass1234")
User.create(first_name: "Test",  first_name: "User", email: "clemrock@gmail.com", password: "pass1234")


users = User.all

puts("------users: #{users.inspect}")
