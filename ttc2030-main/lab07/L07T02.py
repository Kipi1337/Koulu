class Human:
    name = ""
    age = ""
    def __str__(self):
        return "nimi: " + self.name+ ", " + "ikä: " + self.age

first = Human()
first.name = "Adam"
first.age = "19"
print(first)

second = Human()
second.name = "Eva"
second.age = "18"
print(second)