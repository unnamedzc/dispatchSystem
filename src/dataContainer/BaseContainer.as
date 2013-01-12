package dataContainer
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class BaseContainer extends Sprite
	{
		public var _myData:XML;
		public function BaseContainer($myData:XML)
		{
			super();
			_myData=$myData
			init();
		}
		protected function init():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE,_onAdd)
		}
		protected function _onAdd(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,_onAdd);
			trace("onAdd baseContainer");
		}
	}
}