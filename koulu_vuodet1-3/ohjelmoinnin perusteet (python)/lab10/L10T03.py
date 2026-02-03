vuosi = 1996

if vuosi < 0:
    print("Ei täällä mennä eaa:n puolelle")
elif (vuosi % 400 == 0) and (vuosi % 100 == 0):
    print(str(vuosi)+" on karkausvuosi")
elif (vuosi % 4 == 0) and (vuosi % 100 != 0):
    print(str(vuosi)+" on karkausvuosi")
else:
    print(str(vuosi)+" ei ole karkausvuosi")