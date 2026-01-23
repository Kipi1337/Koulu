using System;

interface ITyoTehtava
{
    void SuoritaTyo();
}

class Henkilo
{
    public string Etunimi { get; set; }
    public string Sukunimi { get; set; }

    public Henkilo(string etunimi, string sukunimi)
    {
        Etunimi = etunimi;
        Sukunimi = sukunimi;
    }

    public virtual void TulostaTiedot()
    {
        Console.WriteLine($"Henkilo: {Etunimi} {Sukunimi}");
    }
}

class Tyontekija : Henkilo, ITyoTehtava
{
    private double palkka;

    public double Palkka
    {
        get { return palkka; }
        set
        {
            if (value < 0)
                throw new ArgumentException("Palkan on oltava positiivinen.");
            palkka = value;
        }
    }

    public Tyontekija(string etunimi, string sukunimi, double palkka) : base(etunimi, sukunimi)
    {
        Palkka = palkka;
    }

    public override void TulostaTiedot()
    {
        Console.WriteLine($"Tyontekija: {Etunimi} {Sukunimi}, Palkka: {Palkka} euroa");
    }

    public void SuoritaTyo()
    {
        Console.WriteLine($"Tyontekija {Etunimi} {Sukunimi} suorittaa tyotehtavansa.");
    }
}

class Program
{
    static void Main()
    {
        try
        {
            Tyontekija tyontekija = new Tyontekija("Matti", "Meikäläinen", 3000);
            tyontekija.TulostaTiedot();
            tyontekija.SuoritaTyo();
        }
        catch (Exception e)
        {
            Console.WriteLine("Virhe: " + e.Message);
        }
    }
}
