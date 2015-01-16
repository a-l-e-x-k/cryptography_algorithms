using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GetResult
{
	class Program
	{
		private const int ARRAY_SIZE = 200;

		static void Main(string[] args)
		{
			if (System.IO.File.Exists("data.txt"))
			{
				System.IO.StreamReader file = new System.IO.StreamReader("data.txt");
				int n = Convert.ToInt16(file.ReadLine());
				int k = Convert.ToInt16(file.ReadLine());

				string[] splited = file.ReadLine().Split(':');
				int[] sorted = new int[splited.Length + 1];
				for (int i = 0; i < splited.Length; i++)
				{
					sorted[i + 1] = Convert.ToInt16(splited[i]);
				}

				int[] keys = new int[ARRAY_SIZE];
				splited = file.ReadLine().Split(':');
				for (int i = 0; i < splited.Length; i++)
				{
					keys[i + 1] = Convert.ToInt16(splited[i]);
				}

				int count = 1;
				int[] input = new int[n];
				while (count <= k)
				{
					Console.WriteLine("Select number " + count + " of " + k + " (from 1 to " + n + ")");
					input[count] = Convert.ToInt16(Console.ReadLine());
					count++;
				}

				int j = 1;
				int[] sortedPiece = new int[ARRAY_SIZE];
				for (int i = 1; i <= n; i++)
				{
					if (input[j] == i)
					{
						sortedPiece[j] = sorted[i];
						j++;
					}
				}

				int[] c = new int[ARRAY_SIZE];
				for (int i = 1; i <= k; i++)
				{
					int abc = 1;
					for (j = 1; j <= k; j++)
					{
						if (j != i)
							abc = abc * sortedPiece[j];
					}

					int max = sortedPiece[1];
					for (j = 1; j <= max; j++)
					{
						if (sortedPiece[j] > max)
							max = sortedPiece[j];

						if (((abc * j) % sortedPiece[i]) == 1)
							c[i] = j;
					}
				}

				int num1 = 1;
				int num2 = 0;

				for (int i = 1; i <= k; i++)
				{
					num1 = 1;
					num1 = num1 * c[i] * keys[input[i]];

					for (j = 1; j <= k; j++)
					{
						if (i != j)
						{
							num1 = num1 * sortedPiece[j];

						}
					}

					num2 = num2 + num1;
				}

				num1 = 1;
				for (int i = 1; i <= k; i++)
				{
					num1 = num1 * sortedPiece[i];
				}

				num2 = num2 % num1;

				Console.WriteLine("Here is the result: " + num2);
				Console.WriteLine("Press ENTER to finish...");
				Console.ReadLine();
			}
			else
			{
				Console.WriteLine("No file exists! Please make sure both files of program are located in the same folder.");
				Console.ReadLine();
			}			
		}
	}
}
