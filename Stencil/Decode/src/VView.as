/**
 * Author: Alexey
 * Date: 10/28/12
 * Time: 3:03 PM
 */
package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class VView extends Sprite
	{
		private var matrix:CustomMatrix;
		private var buttons:Buttons;
		private var msgmc:MovieClip;
		private var msgmcr:MovieClip;
		private var ar:MovieClip;

		public function VView()
		{
			var info:MovieClip = new msgr();
			info.y = 50;
			info.current.text = "Enter encoded message:";
			addChild(info);

			ar = new areamc();
			ar.x = 123;
			ar.y = 150;
			addChild(ar);

			var ok:MovieClip = new okbtn();
			ok.x = 446;
			ok.y = 150;
			ok.buttonMode = true;
			ok.addEventListener(MouseEvent.CLICK, update);
			addChild(ok);

			msgmc = new msgr();
			msgmc.y = 255;
			msgmc.current.text = "";
			addChild(msgmc);
		}

		private function update(event:MouseEvent):void
		{
			var u = ar.inp_txt.text.length;
			trace(u)
			if (ar.inp_txt.text.length != 17)
			{
				msgmc.current.text = "Message must be 16 characters long";
				return;
			}

			var t:String = "";
			for (var i:int = 1; i < 5; i++)
			{
				var sten:Stencil = new Stencil(i);
				var cm:CustomMatrix = new CustomMatrix();
				cm.fillFromStr(ar.inp_txt.text);
				cm.applyStencil(sten);
				t += cm.getCurrentText();
			}

			msgmc.current.text = t;
		}
	}
}
