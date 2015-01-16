/**
 * Author: Alexey
 * Date: 10/27/12
 * Time: 5:40 PM
 */
package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class VView extends Sprite
	{
		private var mc:MovieClip;

		public function VView()
		{
			mc = new generate();
			mc.run.addEventListener(MouseEvent.CLICK, sendUpdate);
			mc.run.buttonMode = true;
			addChild(mc);
		}

		private function sendUpdate(event:MouseEvent):void
		{
			dispatchEvent(new EEvent(EEvent.UPDATE, {firstPrime:int(mc.p1_txt.text), secondPrime:int(mc.p2_txt.text)}));
		}

		public function clearOutput():void
		{
			mc.ou.text = "";
		}

		public function addMessage(msg:String):void
		{
			mc.ou.text += msg + "\n";
		}
	}
}
