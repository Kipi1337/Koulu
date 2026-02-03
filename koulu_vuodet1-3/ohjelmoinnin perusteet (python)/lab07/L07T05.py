class car:
    brand = ""
    model = ""
    price = ""



auto1 = car()
auto1.brand = "Skoda"
auto1.model = "Octavia"
auto1.price = 3000
print("car:",str(auto1.brand),str(auto1.model),str(auto1.price))

auto2 = car()
auto2.brand = "Audi"
auto2.model = "A4"
auto2.price = 4000
print("car:",str(auto2.brand),str(auto2.model),str(auto2.price))

auto3 = car()
auto3.brand = "Volvo"
auto3.model = "V70"
auto3.price = 5000
print("car:",str(auto3.brand),str(auto3.model),str(auto3.price))

print("Car price combined:",auto1.price+auto2.price+auto3.price)