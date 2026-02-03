using System;

abstract class Auto
{
    public string Merkki { get; set; }
    public string Malli { get; set; }
    private static int autoLaskuri = 0;

    public Auto(string merkki, string malli)
    {
        Merkki = merkki;
        Malli = malli;
        autoLaskuri++;
    }

    public static void TulostaAutojenMaara()
    {
        Console.WriteLine($"Autoja on luotu yhteensä: {autoLaskuri}");
    }

    public abstract void Aja();
}

class Sahkoauto : Auto
{
    public Sahkoauto(string merkki, string malli) : base(merkki, malli) { }

    public override void Aja()
    {
        Console.WriteLine("Sahkoauto liikkuu hiljaisesti.");
    }
}

class BensaAuto : Auto
{
    public BensaAuto(string merkki, string malli) : base(merkki, malli) { }

    public override void Aja()
    {
        Console.WriteLine("Bensa-auto hurisee moottorin käydessä.");
    }
}

class Program
{
    static void Main()
    {
        Sahkoauto tesla = new Sahkoauto("Tesla", "Model S");
        BensaAuto toyota = new BensaAuto("Toyota", "Corolla");
        Sahkoauto nissan = new Sahkoauto("Nissan", "Leaf");

        Auto.TulostaAutojenMaara();

        tesla.Aja();
        toyota.Aja();
        nissan.Aja();
    }
}
