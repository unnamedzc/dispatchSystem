package com.jeff.myEvent
{
	import flash.events.Event;
	
	public class ElementEvent extends Event
	{
		public static const UPDATE:String="update";
		public function ElementEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}