package com.jeff.myEvent
{
	import flash.events.Event;
	
	public class XMLEvent extends Event
	{
		
		public var _obj:Object;
		public static const DATA_COMBINED:String="data combined";
		public static const XML_LOADED:String="xml loaded"
		public function XMLEvent(type:String, $obj:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type);
			_obj=$obj;
		}
	}
}