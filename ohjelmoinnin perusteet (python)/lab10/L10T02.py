def kerro3():
    ikä = int(input("kuinka vanha olet: "))
    if 0 <= ikä < 13:
        print("lapsi")
    elif 13 <= ikä <= 19:
        print("nuori")
    elif 20 <= ikä <= 65:
        print("aikuinen")
    elif ikä < 0:
        print("et ole syntynyt")
    else:
        print("seniori")

kerro3()