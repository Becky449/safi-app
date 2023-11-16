# seeds.rb

# Find the existing user by email
user = User.find_by(email: 'safiorganics1@gmail.com')

if user
  # Update the user's role to 'admin'
  user.update(role: :admin)
  user.save
  puts "Role for #{user.email} updated to admin."
else
  puts "User with email 'safiorganics1@gmail.com' not found."
end
