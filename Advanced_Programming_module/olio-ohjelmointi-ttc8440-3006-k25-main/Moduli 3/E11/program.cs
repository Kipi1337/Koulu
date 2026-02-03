using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace E10
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            ApplicationConfiguration.Initialize();
            Application.Run(new Form1());
        }
    }

    // Auto class represents a car object
    public class Auto
    {
        public string Merkki { get; set; }
        public string Malli { get; set; }
        public string Rekisterinumero { get; set; }

        public Auto(string merkki, string malli, string rekisterinumero)
        {
            Merkki = merkki;
            Malli = malli;
            Rekisterinumero = rekisterinumero;
        }

        public override string ToString()
        {
            return $"{Merkki} {Malli} ({Rekisterinumero})";
        }
    }

    // AutoManager handles the car collection and file interactions
    public class AutoManager
    {
        private List<Auto> autot;

        public AutoManager()
        {
            autot = new List<Auto>();
            LataaAutot(); // Load cars from file when initializing
        }

        public void LisaaAuto(Auto auto)
        {
            autot.Add(auto);
            TallennaAutot(); // Save to file after adding a car
        }

        public void PoistaAuto(Auto auto)
        {
            autot.Remove(auto);
            TallennaAutot(); // Save to file after removing a car
        }

        public List<Auto> HaeAutot()
        {
            return autot;
        }

        private void TallennaAutot()
        {
            string filePath = "autot.txt";
            using (StreamWriter writer = new StreamWriter(filePath))
            {
                foreach (var auto in autot)
                {
                    writer.WriteLine($"{auto.Merkki},{auto.Malli},{auto.Rekisterinumero}");
                }
            }
        }

        public void LataaAutot()
        {
            string filePath = "autot.txt";
            if (File.Exists(filePath))
            {
                var lines = File.ReadLines(filePath);
                foreach (var line in lines)
                {
                    var parts = line.Split(',');
                    if (parts.Length == 3)
                    {
                        autot.Add(new Auto(parts[0], parts[1], parts[2]));
                    }
                }
            }
        }
    }
}
