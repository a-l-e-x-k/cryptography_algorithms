/**
 * Author: Alexey
 * Date: 10/27/12
 * Time: 5:37 PM
 */
package
{
	public class RSAUtils
	{
		public static function calculateE(phi:int):int
		{
			var e:int = 0;
			var currentNumber:int = 3;
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

		public static function calculateD(randomE:int, phi:int):int
		{
			var res:int = 0;
			var cn:int = 1;
			while (res == 0)
			{
				if ((randomE * cn) % phi == 1 && cn != randomE)
					res = cn;
				else
					cn++;
			}
			return res;
		}

		public static function gcd(a, b)
		{
			// Euclidean algorithm
			var t;
			while (b != 0)
			{
				t = b;
				b = a % b;
				a = t;
			}
			return a;
		}

		public static function toHugePowerWithModulo(num:Number, pow:Number, modulo:Number):Number
		{
			if (pow == 2)
				return (num * num) % modulo;
			else if (pow == 1)
				return num;
			else if (pow == 0)
				return 1;
			else if (pow % 2 == 0)
				return (num * num * toHugePowerWithModulo(num, pow - 2, modulo)) % modulo;
			else if (pow % 2 != 0)
				return (num * toHugePowerWithModulo(num, pow - 1, modulo)) % modulo;
			return num;
		}

		public static function encode(what:Number, power:int, modulo:int):Number
		{
			return toHugePowerWithModulo(what, power, modulo);
		}

		public static function decode(what:Number, power:int, modulo:int):Number
		{
			return toHugePowerWithModulo(what, power, modulo);
		}
	}
}
