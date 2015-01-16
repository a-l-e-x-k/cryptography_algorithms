using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Decode
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Enter first key part:");
			int multiplied = Convert.ToInt32(Console.ReadLine());

			Console.WriteLine("Enter second key part:");
			int d = Convert.ToInt32(Console.ReadLine());

			Console.WriteLine("Enter encoded message (number less than {0}):", multiplied);
			int enc = Convert.ToInt32(Console.ReadLine());

			int dec = toHugePowerWithModulo(enc, d, multiplied);
			Console.WriteLine("Decoded message: " + dec);

			Console.WriteLine("Press enter to finish...");
			Console.ReadLine();
		}

		static int toHugePowerWithModulo(int num, int pow, int modulo)
		{
			if (pow == 0)
				return 1;
			else if (pow == 1)
				return num;
			else if (pow == 2)
				return (num * num) % modulo;
			else if (pow % 2 == 0)
				return (num * num * toHugePowerWithModulo(num, pow - 2, modulo)) % modulo;
			else if (pow % 2 != 0)
				return (num * toHugePowerWithModulo(num, pow - 1, modulo)) % modulo;
			return num;
		}
	}
}
