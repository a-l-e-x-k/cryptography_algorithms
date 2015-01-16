/**
 * Author: Alexey
 * Date: 10/28/12
 * Time: 3:04 PM
 */
package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;

	public class CustomMatrix extends Sprite
	{
		public static const MATRIX_SIZE:int = 4;
		private const SPACE:int = 5;

		public var arr:Array = [];

		public function CustomMatrix()
		{
			for (var i:int = 0; i < MATRIX_SIZE; i++) //rows
			{
				arr[i] = [];
				for (var j:int = 0; j < MATRIX_SIZE; j++) //columns
				{
					var cell:Cell = new Cell();
					cell.x = (cell.width + SPACE) * j;
					cell.y = (cell.height + SPACE) * i;
					cell.setText(""); //all cells empty
					cell._view.mc.inp_txt.addEventListener(KeyboardEvent.KEY_UP, disp);
					addChild(cell);
					arr[i][j] = cell;
				}
			}
		}

		private function disp(event:KeyboardEvent):void
		{
			dispatchEvent(new EEvent(EEvent.UPDATE));
		}

		public function applyStencil(ss:Stencil):void
		{
			var s:Array = ss.content;

			for (var i:int = 0; i < s.length; i++)
			{
				for (var j:int = 0; j < s[i].length; j++)
				{
					if (s[i][j] == 0)
						(arr[i][j] as Cell).setAvailable(false);
					else if (s[i][j] == 1)
						(arr[i][j] as Cell).setAvailable(true);
				}
			}
		}

		public function fill(s:Array):void
		{
			for (var i:int = 0; i < s.length; i++)
			{
				for (var j:int = 0; j < s[i].length; j++)
				{
					(arr[i][j] as Cell).setText(s[i][j]);
				}
			}
		}

		public function getTextArr():Array
		{
			var newArr:Array = [];
			for (var i:int = 0; i < CustomMatrix.MATRIX_SIZE; i++)
			{
				newArr[i] = [];
				for (var j:int = 0; j < CustomMatrix.MATRIX_SIZE; j++)
				{
					newArr[i][j] = (arr[i][j] as Cell).text;
				}
			}
			return newArr;
		}

		/**
		 * depending on stencil
		 * @return
		 */
		public function getCurrentText():String
		{
			var t:String = "";
			for (var i:int = 0; i < arr.length; i++)
			{
				for (var j:int = 0; j < arr[i].length; j++)
				{
					if ((arr[i][j] as Cell).available)
						t += (arr[i][j] as Cell).text;
				}
			}
			return t;
		}
	}
}
