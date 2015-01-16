/**
 * Author: Alexey
 * Date: 10/28/12
 * Time: 3:11 PM
 */
package
{
	public class StencilManager
	{
		public static var currentID:int = 0;
		public static var currentValueMatrix:Array = [];

		public static function getNext():Stencil
		{
			currentID++;

			if (currentID == 5)
				currentID = 1;

			return new Stencil(currentID);
		}

		public static function resetCVM():void
		{
			var newArr:Array = [];
			for (var i:int = 0; i < CustomMatrix.MATRIX_SIZE; i++)
			{
				newArr[i] = [];
				for (var j:int = 0; j < CustomMatrix.MATRIX_SIZE; j++)
				{
					newArr[i][j] = "";
				}
			}

			currentValueMatrix = newArr;
			currentID = 0;
		}

		public static function updateCVMFromRotatedMatrix(currentRotated:Array):void
		{
			currentValueMatrix = currentRotated;
		}

		//******************Get current message******************
		public static function getCurrentMessage(matrix:CustomMatrix):String
		{
			var t:String = "Encoded message: ";

			for (var i:int = 1; i < currentID + 1; i++)
			{
				var sten:Stencil = new Stencil(i);
				var cm:CustomMatrix = new CustomMatrix();
				cm.fill(matrix.getTextArr());
				cm.applyStencil(sten);
				t += cm.getCurrentText();
			}

			return t;
		}

		public static function getOverallMessage(matrix:CustomMatrix):String
		{
			var t:String = "What bad guy sees: ";
			for (var j:int = 0; j < matrix.arr.length; j++)
			{
				for (var k:int = 0; k < matrix.arr[j].length; k++)
				{
					t += matrix.arr[j][k].text;
				}
			}
			return t;
		}
	}
}
