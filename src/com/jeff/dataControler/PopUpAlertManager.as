package com.jeff.dataControler
{
	import Values.GlobalValue;
	
	import flash.display.DisplayObject;
	
	import mx.managers.PopUpManager;
	
	import myComponents.LoadingTitleWin;
	
	public class PopUpAlertManager
	{
		private static var _instance:PopUpAlertManager;
		public function PopUpAlertManager(enforcer:SingletonEnforcer)
		{
			super()
		}
		
		//show
		public function showLoading($object:DisplayObject):void
		{
			GlobalValue._loadingMask=LoadingTitleWin(PopUpManager.createPopUp($object, LoadingTitleWin,true));	
			PopUpManager.centerPopUp(GlobalValue._loadingMask);	
		}
		//single
		public static function getInstance():PopUpAlertManager
		{
			if(_instance==null)
			{
				_instance= new PopUpAlertManager(new SingletonEnforcer());
			}
			return _instance;
		}
	}
}
class SingletonEnforcer{}