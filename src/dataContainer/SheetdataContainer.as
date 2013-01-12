package dataContainer
{
	import flash.events.Event;
	public class SheetdataContainer extends BaseContainer
	{
		public function SheetdataContainer($myData:XML)
		{
			super();
		}
		override protected function _onAdd(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,_onAdd);
			trace("onAdd sheetContainer");
		}
	}
}