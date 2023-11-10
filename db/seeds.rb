
# 1. Create a user

users = User.create([
    { firstname: "Samuel", lastname: "Rigu", email: "safiorganics1@gmail.com", role: "admin" },
    { firstname: "Joyce", lastname: "Kamande", email: "joycekamande54@gmail.com", role: "manager" }
])
# 2. Create products

products = Product.create([
    { name: "Safi Planting", description: "" , price: 2700},
    { name: "Safi Topper", description: "" , price: 2700},
    { name: "Safi Amender", description: "" , price: 2200},
    { name: "Safi Foliar 1L", description: "" , price: 600},
    { name: "Safi Foliar 5L", description: "" , price: 2900},
    { name: "Safi Foliar 10L", description: "" , price: 5500},
    { name: "Safi Foliar 20L", description: "" , price: 11500}
])

