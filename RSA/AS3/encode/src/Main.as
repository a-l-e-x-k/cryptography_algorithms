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
			var randomE:int = event.data.randomE;
			var multiplied:int = event.data.multiplied;
			var enc:Number = RSAUtils.encode(event.data.message, randomE, multiplied);

			view.clearOutput();
			view.addMessage("Encoding message...");
			view.addMessage("First key part: " + multiplied);
			view.addMessage("Second key part: " + randomE);
			view.addMessage("Encoded message: " + enc);
		}
	}
}
