package com.jeff.myEvent
{
	import flash.events.Event;
	
	public class ElementEvent extends Event
	{
		public var _obj:Object;
		public static const UPDATE:String="update";
		public static const CREATE_JPG:String="create jpg";
		public function ElementEvent(type:String, $obj:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type);
			_obj=$obj;
		}
	}
}