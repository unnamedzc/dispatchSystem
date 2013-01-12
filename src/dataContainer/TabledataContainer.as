package dataContainer
{
	import flash.events.Event;

	public class TabledataContainer extends BaseContainer
	{
		public function TabledataContainer($myData:XML)
		{
			super($myData);
		}
		override protected function _onAdd(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,_onAdd);
			trace("onAdd tableContainer");
		}
	}
}