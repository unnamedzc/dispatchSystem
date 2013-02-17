package com.jeff.dataControler
{
	import Values.GlobalValue;
	
	import com.jeff.myEvent.XMLEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;

	public class DataManager extends EventDispatcher
	{
		private static var _instance:DataManager;
		//the whole data that will be saved to file;
		/*
		 * 
		<data jpgId=1>
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
		//file
		private var _loadPath:String="database/data.dat"
		//private var _fl:File= new File(File.applicationDirectory.nativePath);
		//private var _xmlByteArray:ByteArray;
		//private var _fs:FileStream = new FileStream();
		public function DataManager(enforcer:SingletonEnforcer,target:IEventDispatcher=null)
		{
			super(target);
		}
		
		//data
		//load data
		public function loadData():void
		{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.BINARY;
			var urlRequest:URLRequest = new URLRequest(_loadPath);
			loader.addEventListener("complete",completeHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.load(urlRequest);
		}
		
		private function ioErrorHandler(e:IOErrorEvent):void
		{
			this.dispatchEvent(new XMLEvent(XMLEvent.XML_LOADED));
		}
		
		private function completeHandler(e:Event):void
		{	
			if(e.currentTarget.data!=null)
			{
				var bytes:ByteArray = ByteArray(e.currentTarget.data);			
				var xmlStr:String = bytes.readMultiByte(bytes.length,"utf-8");
				_wholeData = XML(xmlStr);
				GlobalValue._empId=_wholeData.emp.length();
				//jpg id
				//JpgManager.getInstance()._jpgId=_wholeData.@jpgId;
				this.dispatchEvent(new XMLEvent(XMLEvent.XML_LOADED));
			}
		}
		//save data 
		public function saveData($type:uint=0):void
		{
			//trace("save data");
			var _xmlByteArray:ByteArray=new ByteArray();
			//_wholeData.@jpgID;
			//_wholeData.@jpgId=JpgManager.getInstance()._jpgId;
			//trace(_wholeData.emp.length());
			if(_wholeData.emp.length()==0)
			{
				return;
			}
			_xmlByteArray.writeUTFBytes(_wholeData.toString());
			//trace("_xmlByteArray Size is:",_xmlByteArray.length);
			var _fl:File
			if($type==0)
			{
				//save
				_fl= new File(File.applicationDirectory.nativePath);
				_fl = _fl.resolvePath(_loadPath);
			}else
			{
				//copy
				_fl= File.desktopDirectory.resolvePath(_loadPath);
			}
			//= new File(File.applicationDirectory.nativePath);
			
		//	var file:File = File.documentsDirectory.resolvePath("DeleteMe.txt");
			if(_fl.exists)
			{
				_fl.deleteFile();
			}
			//todo compress			
			var _fs:FileStream = new FileStream();
			//_fs.position=_xmlByteArray.length;
			try{  
				//open file in write mode  
				_fs.open(_fl,FileMode.WRITE);  
				//write bytes from the byte array  
				_fs.writeBytes(_xmlByteArray);  
				//close the file  
				_fs.close();  
			}catch(e:Error){  
				trace(e);  
			} 
			_xmlByteArray.clear();
			//delete useless jpg;
			var _len:uint=JpgManager.getInstance().deletePicVec.length
			for(var i:uint=0;i<_len;++i)
			{
				trace("will delete:",JpgManager.getInstance().deletePicVec[i]);
				var _tempID:String=JpgManager.getInstance().deletePicVec[i].toString();
				JpgManager.getInstance().deleteJpg(_tempID);
			}
			JpgManager.getInstance().deletePicVec=new Vector.<uint>;
			
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