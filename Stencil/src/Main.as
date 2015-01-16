/**
 * Author: Alexey
 * Date: 10/28/12
 * Time: 2:49 PM
 */
package
{
	import flash.display.Sprite;

    [SWF(width = 550, height = 400, backgroundColor = 0x000000, frameRate=30)]
	public class Main extends Sprite
	{
		public function Main()
		{
			StencilManager.resetCVM();

			var view:View = new View();
			view.updateMatrix(); //create staring one
			addChild(view);
		}
	}
}
