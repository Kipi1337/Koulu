n = 100

def showtime(time):
    sekuntti = time % (24 * 3600)
    tunti = time // 3600
    time %= 3600
    minuutti = time // 60
    sekuntti %= 60

    return "%02d:%02d:%02d" % (tunti, minuutti, sekuntti)


print(showtime(n))