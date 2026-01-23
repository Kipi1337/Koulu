#revittiin valmis randomi pyyttonin kirjastosta
import random

count = 7
lottonumbers = []

#määriteltiin funktio lotto
def lotto():
    number = random.randint(1,40)
    lottonumbers.append(number)

#lotolle kun funktio#
while True:
    lotto()
    count-=1
    if count == 0:
        break

print("winning numbers are: "+str(lottonumbers)[1:-1])