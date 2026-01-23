txt = open("sukunimi.txt" , 'a')
while True:
    sukunimi = input("Kirjoita sukunimi: ")
    if sukunimi == "":
        break
    else:
        txt.write(f"\n{sukunimi}")
        continue