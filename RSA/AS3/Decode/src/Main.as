/**
 * Author: Alexey
 * Date: 10/25/12
 * Time: 11:17 PM
 */
package
{
	import flash.display.Sprite;

	[SWF(width=560, height=500, backgroundColor="#000000", frameRate="30")]
	public class Main extends Sprite
	{
		private var view:View;

		public function Main()
		{
			view = new View();
			view.addEventListener(EEvent.UPDATE, update);
			addChild(view);
		}

		private function update(event:EEvent):void
		{
			var d:int = event.data.d;
			var multiplied:int = event.data.multiplied;
			var dec:Number = RSAUtils.decode(event.data.message, d, multiplied);

			view.clearOutput();
			view.addMessage("Decoding message...");
			view.addMessage("First key part: " + multiplied);
			view.addMessage("Second key part: " + d);
			view.addMessage("Decoded message: " + dec);
		}
	}
}
