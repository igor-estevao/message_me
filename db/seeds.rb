u1 = User.create name: "admin", email: "admin@admin.com", password: "admin"

5.times do
  User.create name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password
end

u2 = User.last
c = Chatroom.create

u1.messages << Message.create(body: "Hi, First Message")
u2.messages << Message.create(body: "Hi, Second Message")

c.messages << u1.messages.first
c.messages << u2.messages.first

u1.chatrooms << c
u2.chatrooms << c
