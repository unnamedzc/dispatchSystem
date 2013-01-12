package MyComponent
{
	import Values.GlobalValue;
	
	import dataContainer.*;
	
	import spark.components.NavigatorContent;

	public class MyTab extends NavigatorContent
	{
		//private var _myStyle:uint;
		//private var _myData:XML;
		//private var _myContainer:BaseContainer;
		public function MyTab($myStyle:uint=0,$myData:XML=null)
		{
			super();	
			var _myContainer:BaseContainer;
			trace("myTab.XML is:",$myData);
			if($myStyle==GlobalValue.TABLE_STYLE)
			{
				_myContainer=new TabledataContainer($myData);
				//addChild(_myContainer);				
				trace("myTab.XML is:",$myData);
			}
		}
	}
}