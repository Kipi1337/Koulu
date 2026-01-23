using System;

class Henkilo
{
    public string Etunimi { get; set; }
    public string Sukunimi { get; set; }
    public int Syntymavuosi { get; set; }

    public Henkilo(string etunimi, string sukunimi, int syntymavuosi)
    {
        Etunimi = etunimi;
        Sukunimi = sukunimi;
        Syntymavuosi = syntymavuosi;
    }

    public void TulostaTiedot()
    {
        Console.WriteLine($"Henkilo: {Etunimi} {Sukunimi}");
    }

    public void TulostaTiedot(bool naytaIka)
    {
        if (naytaIka)
        {
            int ika = DateTime.Now.Year - Syntymavuosi;
            Console.WriteLine($"Henkilo: {Etunimi} {Sukunimi}, Ikä: {ika} vuotta");
        }
        else
        {
            TulostaTiedot();
        }
    }
}

class Program
{
    static void Main()
    {
        Henkilo henkilo = new Henkilo("Matti", "Meikäläinen", 1990);
        henkilo.TulostaTiedot();
        henkilo.TulostaTiedot(true);
    }
}
