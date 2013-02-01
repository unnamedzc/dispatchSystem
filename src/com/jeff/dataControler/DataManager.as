package com.jeff.dataControler
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.filesystem.FileStream;
	
	public class DataManager extends EventDispatcher
	{
		private static var _instance:DataManager;
		public function DataManager(enforcer:SingletonEnforcer,target:IEventDispatcher=null)
		{
			super(target);
		}
		//save data 
		public function saveData():void
		{
			trace("save");
			var _fs:FileStream = new FileStream();
			
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