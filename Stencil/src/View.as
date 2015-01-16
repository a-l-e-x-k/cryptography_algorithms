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

	public class View extends Sprite
	{
		private var matrix:CustomMatrix;
		private var buttons:Buttons;
		private var msgmc:MovieClip;
		private var msgmcr:MovieClip;

		public function View()
		{
			buttons = new Buttons();
			buttons.mc.rot.addEventListener(MouseEvent.CLICK, tryRotate);
			buttons.mc.res.addEventListener(MouseEvent.CLICK, tryReset);
			buttons.mc.rot.buttonMode = true;
			buttons.mc.res.buttonMode = true;
			buttons.mc.res.visible = false;
			buttons.x = 390;
			buttons.y = 140;
			addChild(buttons);

			msgmc = new msg();
			msgmc.y = 255;
			addChild(msgmc);

			msgmcr = new msgr();
			msgmcr.y = 234;
			addChild(msgmcr);
		}

		private function tryRotate(e:MouseEvent):void
		{
			if (StencilManager.currentID < 4)
			{
				StencilManager.updateCVMFromRotatedMatrix(matrix.getTextArr()); //write what have ATM

				updateMatrix(); //create new matrix, fill it with what we had and apply stencil

				if (StencilManager.currentID < 4)
				{
					buttons.mc.rot.visible = true;
					buttons.mc.res.visible = false;
				}
				else
				{
					buttons.mc.rot.visible = false;
					buttons.mc.res.visible = true;
				}
			}
		}

		private function tryReset(e:MouseEvent):void
		{
			if (StencilManager.currentID == 4)
			{
				StencilManager.resetCVM();
				updateMatrix();
				buttons.mc.rot.visible = true;
				buttons.mc.res.visible = false;
				msgmc.current.text = "";
			}
		}

		public function updateMatrix():void
		{
			if (matrix)
			{
				removeChild(matrix);
				matrix = null;
			}

			matrix = new CustomMatrix();
			matrix.x = 200;
			matrix.y = 80;
			matrix.fill(StencilManager.currentValueMatrix);
			matrix.applyStencil(StencilManager.getNext());
			matrix.addEventListener(EEvent.UPDATE, updateTexts);
			addChild(matrix);
		}

		private function updateTexts(e:EEvent):void
		{
			msgmc.current.text = StencilManager.getOverallMessage(matrix);
			msgmcr.current.text = "Fill in highlighted areas"; //description
		}
	}
}
