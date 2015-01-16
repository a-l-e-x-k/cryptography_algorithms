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

	public class View extends Sprite
	{
		private var mc:MovieClip;

		public function View()
		{
			mc = new encode();
			mc.p1_txt.addEventListener(Event.CHANGE, checkNumbers);
			mc.p2_txt.addEventListener(Event.CHANGE, checkNumbers);
			mc.me_txt.addEventListener(Event.CHANGE, checkNumbers);
			mc.run.addEventListener(MouseEvent.CLICK, sendUpdate);
			mc.run.buttonMode = true;
			addChild(mc);
		}

		private function sendUpdate(event:MouseEvent):void
		{
			dispatchEvent(new EEvent(EEvent.UPDATE, {multiplied:int(mc.p1_txt.text), randomE:int(mc.p2_txt.text), message:int(mc.me_txt.text)}));
		}

		/**
		 * Message must be less than product of primes.
		 * Otherwise message must be split in chunks and encoded separately
		 * @param event
		 */
		private function checkNumbers(event:Event):void
		{
			if (int(mc.me_txt.text) > int(mc.p1_txt.text))
				mc.me_txt.text = (int(mc.p1_txt.text) - 1);
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
