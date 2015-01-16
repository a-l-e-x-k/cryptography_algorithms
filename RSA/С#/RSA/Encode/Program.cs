using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Encode
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Enter first key part:");
			int multiplied = Convert.ToInt32(Console.ReadLine());
			
			Console.WriteLine("Enter second key part:");
			int randomE = Convert.ToInt32(Console.ReadLine());			

			Console.WriteLine("\nEnter message to encode (number less than {0}): ", multiplied);
			int msg = Convert.ToInt32(Console.ReadLine());

			int enc = toHugePowerWithModulo(msg, randomE, multiplied);
			Console.WriteLine("Encoded message: " + enc);

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
