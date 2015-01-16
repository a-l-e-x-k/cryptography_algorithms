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
		private var view:VView;

		public function Main()
		{
			view = new VView();
			view.addEventListener(EEvent.UPDATE, update);
			addChild(view);
		}

		private function update(event:EEvent):void
		{
			var p:int = event.data.firstPrime;
			var q:int = event.data.secondPrime;
			var m:int = p * q;
			var phi:int = (p - 1) * (q - 1);
			var e:int = RSAUtils.calculateE(phi);
			var d:int = RSAUtils.calculateD(e, phi);

			view.clearOutput();
			view.addMessage("First prime: " + p);
			view.addMessage("Second prime: " + q);
			view.addMessage("m: " + m);
			view.addMessage("phi: " + phi);
			view.addMessage("e: " + e);
			view.addMessage("d: " + d);
			view.addMessage("Public key: [" + m + ", " + e + "]");
			view.addMessage("Private key: [" + m + ", " + d + "]");
		}
	}
}
