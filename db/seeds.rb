# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   
10.times do |i|
  @user = User.new ({name: "User#{i}", email: "user#{i}@mail.it", password: "abcdef",
                                                                    password_confirmation: "abcdef"})
  @user.save
end

30.times do |i|
  @post = Post.new ({title: "Post #{i}", body: "Body #{i}", user: User.find(rand(10)+1)})
  @post.save
end
