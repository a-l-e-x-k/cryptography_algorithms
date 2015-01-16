/**
 * Author: Alexey
 * Date: 10/28/12
 * Time: 2:51 PM
 */
package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;

	public class Cell extends Sprite
	{
		public var _view:MovieClip;
		public var available:Boolean;

		public function Cell()
		{
			_view = new cell();
			addChild(_view);
		}

		public function setText(t:String):void
		{
			_view.mc.inp_txt.text = t;
		}

		public function setAvailable(b:Boolean):void
		{
			available = b;
			_view.mc.gotoAndStop(b ? "on" : "off");
			(_view.mc.inp_txt as TextField).type = b ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
			(_view.mc.inp_txt as TextField).selectable = b;
		}

		public function get text():String
		{
			return _view.mc.inp_txt.text;
		}
	}
}
