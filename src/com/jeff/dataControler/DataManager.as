package com.jeff.dataControler
{
	import com.jeff.myEvent.XMLEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.filesystem.FileStream;
	
	public class DataManager extends EventDispatcher
	{
		private static var _instance:DataManager;
		//the whole data that will be saved to file;
		/*
		 * 
		<data>
			<emp id=1>
				<tab>
					<姓名>
				</tab>
				<tab>
				</tab>
			</emp>
		</data>
		*/
		public var _wholeData:XML=<data></data>;
		public var _empData:XML=<emp></emp>;
		public function DataManager(enforcer:SingletonEnforcer,target:IEventDispatcher=null)
		{
			super(target);
		}
		//save data 
		public function saveData():void
		{
			trace("save data");
			var _fs:FileStream = new FileStream();
			
		}
		//combine emp Data
		public function combineData($xml:XML=null):void
		{
			_empData.appendChild($xml);
		}	
		
		//edit emp Data
		public function replaceData($pos:uint,$xml:XML=null):void
		{
			_empData.replace($pos,$xml);
		}
		
		public function resetEmpXML():void
		{
			_empData=<emp></emp>;
		}
		
		public function loadData():void
		{
			
		}
		//single
		public static function getInstance():DataManager
		{
			if(_instance==null)
			{
				_instance= new DataManager(new SingletonEnforcer(),null);
			}
			return _instance;
		}
		
	}
}
class SingletonEnforcer{}