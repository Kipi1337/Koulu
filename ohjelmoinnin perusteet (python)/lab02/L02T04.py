nimi = input("Anna etunimesi: ")
vuosi = int(input("Syntymävuotesi: "))
from datetime import datetime
currentTimeDate = datetime.now()
ikä = (currentTimeDate.year-vuosi)

print("Hei "+nimi+", olet "+str(ikä)+" vuotta")