/**
 * Author: Alexey
 * Date: 10/28/12
 * Time: 3:10 PM
 */
package
{
	public class Stencil
	{
		private static const defaultStencil:Array =
				[
					[1, 0, 1, 0],
					[0, 0, 0, 0],
					[0, 1, 0, 1],
					[0, 0, 0, 0]
				];

		public var content:Array;

		public function Stencil(id:int)
		{
			if (id == 1)
				content = defaultStencil;
			else if (id == 2) //horizontal flip
			{
				content = getHorizontalFlip(defaultStencil);
			}
			else if (id == 3) //vertical flip of horizontal flip
			{
				content = getVerticalFlip(getHorizontalFlip(defaultStencil));
			}
			else if (id == 4) //horizontal flip of vertical flip of horizontal flip
			{
				content = getHorizontalFlip(getVerticalFlip(getHorizontalFlip(defaultStencil)));
			}
		}

		private static function getHorizontalFlip(toFlip:Array):Array
		{
			var newArr:Array = [];
			for (var i:int = 0; i < CustomMatrix.MATRIX_SIZE; i++)
			{
				newArr[i] = [];
				for (var j:int = 0; j < CustomMatrix.MATRIX_SIZE; j++)
				{
					newArr[i][j] = toFlip[i][CustomMatrix.MATRIX_SIZE - j - 1];
				}
			}
			return newArr;
		}

		private static function getVerticalFlip(toFlip:Array):Array
		{
			var newArr:Array = [];
			for (var i:int = 0; i < CustomMatrix.MATRIX_SIZE; i++)
			{
				newArr[i] = [];
				for (var j:int = 0; j < CustomMatrix.MATRIX_SIZE; j++)
				{
					newArr[i][j] = toFlip[CustomMatrix.MATRIX_SIZE - i - 1][j];
				}
			}
			return newArr;
		}
	}
}
