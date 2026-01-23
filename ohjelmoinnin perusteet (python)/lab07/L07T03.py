class cat:
    name = ""
    color = ""
    say = ""
    def __str__(self):
        return self.name + ", color: " + self.color
    def __init__(self, name = "" , color = "" , say = ""):
        self.name = name
        self.color = color
        self.say = say
    def nauku(self):
        return self.name + " says: " + self.say


Kissa = cat("Kit","black","Meoooooow!")
print(Kissa)

Kisu = cat("Kat","white","Meoooooow!")
print(Kisu)
print(Kissa.nauku())
print(Kisu.nauku())