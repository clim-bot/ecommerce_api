# frozen_string_literal: true

# Clear existing data
User.destroy_all
Product.destroy_all
Cart.destroy_all
Order.destroy_all
CartItem.destroy_all

# Create Users
user1 = User.create!(name: 'John Doe', email: 'john@example.com', password: 'password123')
user2 = User.create!(name: 'Jane Smith', email: 'jane@example.com', password: 'password123')
User.create!(name: 'Admin User', email: 'admin@example.com', password: 'adminpassword')

puts "Created #{User.count} users."

# Create Products
product1 = Product.create!(name: 'Laptop', description: 'A high-end laptop', price: 1200.00, inventory: 10)
product2 = Product.create!(name: 'Headphones', description: 'Noise-cancelling headphones', price: 200.00, inventory: 15)
product3 = Product.create!(name: 'Keyboard', description: 'Mechanical keyboard', price: 150.00, inventory: 25)
Product.create!(name: 'Mouse', description: 'Wireless mouse', price: 50.00, inventory: 100)

puts "Created #{Product.count} products."

# Create Cart for user1
cart1 = user1.create_cart
CartItem.create!(cart: cart1, product: product1, quantity: 1)
CartItem.create!(cart: cart1, product: product2, quantity: 2)

# Create Cart for user2
cart2 = user2.create_cart
CartItem.create!(cart: cart2, product: product3, quantity: 1)

puts "Created #{Cart.count} carts with #{CartItem.count} items."

# Create Orders for user1
order1 = Order.create!(user: user1, total_price: 1600.00, status: 'pending')

puts "Created #{Order.count} orders."

# Output the current state of the database
puts "Users: #{User.pluck(:name).join(', ')}"
puts "Products: #{Product.pluck(:name).join(', ')}"
puts "User #{user1.name}'s Cart: #{cart1.cart_items.map do |item|
  "#{item.product.name} (#{item.quantity})"
end.join(', ')}"
puts "Order for #{user1.name}: #{order1.total_price} (Status: #{order1.status})"
