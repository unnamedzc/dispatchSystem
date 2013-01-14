package com.jeff.myEvent
{
	import flash.events.Event;
	
	public class DataEvent extends Event
	{
		public static const DATA_LOADED:String="data loaded"
		private var _obj:Object;
		public function DataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false,$obj:Object=null)
		{
			super(type, bubbles, cancelable);
			_obj=$obj;
		}
	}
}