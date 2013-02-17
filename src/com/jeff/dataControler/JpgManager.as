package com.jeff.dataControler
{
	import flash.filesystem.File;
	
	import mx.core.IVisualElement;
	

	public class JpgManager
	{
		private static var _instance:JpgManager;
		
		//
		//public var _jpgId:uint;
		
		public var deletePicVec:Vector.<uint>=new Vector.<uint>();
		//
		public var dragImageVec:Vector.<IVisualElement>=new Vector.<IVisualElement>;
		
		public function JpgManager(enforcer:SingletonEnforcer)
		{
			super();
		}
		
		//single
		public static function getInstance():JpgManager
		{
			if(_instance==null)
			{
				_instance= new JpgManager(new SingletonEnforcer());
			}
			return _instance;
		}
		//todo jpg path anylize
		public function setJpgPath($title:String,$id:String):String
		{
			var _tempStr:String;
			if($title=="照片")
			{
				_tempStr="pic/"+$id+"_pic.jpg";
			}else if($title=="指纹")
			{
				_tempStr="pic/"+$id+"_finger.jpg";
			}else if($title=="车辆照片")
			{
				_tempStr="pic/"+$id+"_trunk.jpg";
			}
			return _tempStr;
		}
		
		//delete jpg file
		public function deleteJpg($id:String):void
		{
			var _flPic:File= new File(File.applicationDirectory.nativePath);
			_flPic = _flPic.resolvePath("pic/"+$id+"_pic.jpg");
			if(_flPic.exists)
			{
				_flPic.deleteFile();
			}				
			var _flFinger:File= new File(File.applicationDirectory.nativePath);
			_flFinger = _flFinger.resolvePath("pic/"+$id+"_finger.jpg");
			if(_flFinger.exists)
			{
				_flFinger.deleteFile();
			}
			var _flTrunk:File= new File(File.applicationDirectory.nativePath);
			_flTrunk = _flTrunk.resolvePath("pic/"+$id+"_trunk.jpg");
			if(_flTrunk.exists)
			{
				_flTrunk.deleteFile();
			}	
		}
		
		public function dispose():void
		{
			dragImageVec=new Vector.<IVisualElement>;
			dragImageVec.length=0;
		}
	}
}
class SingletonEnforcer{}