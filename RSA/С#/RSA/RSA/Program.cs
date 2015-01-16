using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CreateKeys
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Enter first prime number: ");
			int prime1 = Convert.ToInt32(Console.ReadLine());
			Console.WriteLine("Enter second prime number: ");
			int prime2 = Convert.ToInt32(Console.ReadLine());

			int multiplied = prime1 * prime2;
			int phi = (prime1 - 1) * (prime2 - 1);
			int randomE = getRandomeE(phi);
			int d = getD(randomE, phi);

			Console.WriteLine("Calculated e: " + randomE);
			Console.WriteLine("Calculated d: " + d);
			Console.WriteLine("Open key: [" + multiplied + "," + randomE + "]");
			Console.WriteLine("Secret key: [" + multiplied + "," + d + "]");

			Console.WriteLine("Press enter to finish...");
			Console.ReadLine();
		}

			static int getRandomeE(int phi)
			{
				int e = 0;
				int currentNumber = 2;
				while (e == 0) //do until number which is next prime not found
				{
					if (gcd(currentNumber, phi) == 1) //simply get next prime number
					{
						e = currentNumber;
					}
					else
						currentNumber++;

				}
				return e;
			}

			static int getD(int e, int phi)
			{
				int res = 0;
				int cn = 1;
				while (res == 0)
				{
					if ((e * cn) % phi == 1 && cn != e)
						res = cn;
					else
						cn++;
				}
				return res;
			}

			static int gcd(int a, int b)
			{
				// Euclidean algorithm
				int t;
				while (b != 0)
				{
					t = b;
					b = a % b;
					a = t;
				}
				return a;
			}			
	}
}
