package {
	import flash.events.Event;

	public class EEvent extends Event
	{
		public static const UPDATE:String = "update";

		private var _data:Object;

		public function EEvent(type:String, data:Object = null)
		{
			super(type, false, false);
			_data = data;
		}

		override public function clone():Event
		{
			return new EEvent(type, data);
		}

		public function get data():Object
		{
			return _data;
		}
	}
}