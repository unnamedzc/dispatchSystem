package com.jeff.dataControler
{
	public class JpgManager
	{
		private static var _instance:DataManager;
		public function JpgManager()
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
		//todo jpg path anylize
		
	}
}
class SingletonEnforcer{}