class mobile:
    brand = ""
    model = ""
    price = ""
    def __str__(self):
        return "brand: "+self.brand + ", model: " + self.model + ", Price: " + str(self.price)
    def __init__(self, brand = "" , model = "" , price = ""):
        self.brand = brand
        self.model = model
        self.price = price

phone1 = mobile("Samsung","Galaxy",349)
print(phone1)
phone2 = mobile("Apple","iPhone 12", 899)
print(phone2)