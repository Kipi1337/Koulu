
txt = open("sukunimi.txt","r")
teksti = txt.read()
print(teksti)
print("Aakkosjärjestys: ")
with open("sukunimi.txt", "r") as tek:
    for line in sorted(tek):
        print(line, end='')