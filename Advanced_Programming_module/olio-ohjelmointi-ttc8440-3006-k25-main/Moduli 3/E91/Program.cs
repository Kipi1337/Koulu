using System;

class Henkilo
{
    public string Etunimi { get; set; }
    public string Sukunimi { get; set; }

    public Henkilo(string etunimi, string sukunimi)
    {
        Etunimi = etunimi;
        Sukunimi = sukunimi;
    }

    public void TulostaTiedot()
    {
        Console.WriteLine($"Henkilo: {Etunimi} {Sukunimi}");
    }
}

class Program
{
    static void Main()
    {
        Henkilo henkilo = new Henkilo("Matti", "Meikäläinen");
        henkilo.TulostaTiedot();
        Console.WriteLine("Paina Enter lopettaaksesi...");
        Console.ReadLine();
    }
}
