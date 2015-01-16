using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;

namespace ShareSecret
{
	class CreateKeys
	{
		private const int ARRAY_SIZE = 200;

		static void Main(string[] args)
		{
			Console.WriteLine("Enter number of people: ");
			int peopleCount = Convert.ToInt16(Console.ReadLine());

			Console.WriteLine("Enter number of keys: ");
			int keys = Convert.ToInt16(Console.ReadLine());

			System.IO.StreamWriter file = new System.IO.StreamWriter("data.txt");
			file.WriteLine(peopleCount);
			file.WriteLine(keys);

			int[] sorted = new int[ARRAY_SIZE];

			for (int i = 1; i <= peopleCount; i++)
			{
				bool o = false;
				do 
				{
					o = true;
					Console.WriteLine("Enter key part " + i + " :");
					sorted[i] = Convert.ToInt16(Console.ReadLine());

					for (int j = i - 1; j > 0; j--)
					{
						for (int k = 2; k <= sorted[j]; k++) //iterate for all written down keys
						{
							if (sorted[j] % k == 0 && sorted[i] % k == 0)
							{
								o = false;
							}
						}
					}

					if (!o)
						Console.WriteLine("Wrong p!");
				}
				while (!o);
			}

			//sort it
			for (int j = 1; j <= peopleCount - 1; j++)
			{
				for (int i = 1; i <= peopleCount - j; i++)
				{
					if (sorted[i] > sorted[i + 1])
					{
						int k = sorted[i];
						sorted[i] = sorted[i + 1];
						sorted[i + 1] = k;
					}
				}
			}

			//output
			Console.WriteLine("Keys: ");
			for (int i = 1; i <= peopleCount; i++)
			{
				Console.Write(sorted[i] + " ");
				file.Write(sorted[i] + (i == peopleCount ? "" : ":"));
			}

			int num1 = 1;
			int num2 = 1;
			for (int i = 1; i <= keys; i++)
			{
				num1 *= sorted[i];
			}

			for (int i = 1; i < keys; i++)
			{
				num2 *= sorted[peopleCount - i + 1];
			}

			Console.WriteLine("\nSelect number from " + num2 + " to " + num1);
			int s1 = Convert.ToInt32(Console.ReadLine());

			int[] s = new int[ARRAY_SIZE];
			Console.WriteLine("Keys: ");

			file.WriteLine();

			for (int i = 1; i <= peopleCount; i++)
			{
				s[i] = s1 % sorted[i];
				Console.Write(s[i] + " ");
				file.Write(s[i] + (i == peopleCount ? "" : ":"));
			}

			file.Close();

			Console.WriteLine("\nPress ENTER to finish...");
			Console.ReadLine();
		}
	}
}

