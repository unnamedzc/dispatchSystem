package com.jeff.dataControler
{
	import com.jeff.myEvent.XMLEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import Values.GlobalValue;
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
			loader.load(urlRequest);
		}
		private function completeHandler(e:Event):void
		{	
			if(e.currentTarget.data!=null)
			{
				var bytes:ByteArray = ByteArray(e.currentTarget.data);
			
				var xmlStr:String = bytes.readMultiByte(bytes.length,"utf-8");
				_wholeData = XML(xmlStr);
				GlobalValue._empId=_wholeData.emp.length();
				trace(_wholeData.emp.length());
				this.dispatchEvent(new XMLEvent(XMLEvent.XML_LOADED));
			}
		}
		//save data 
		public function saveData():void
		{
			trace("save data");
			var _xmlByteArray:ByteArray=new ByteArray();
			_xmlByteArray.writeUTFBytes(_wholeData.toString());
			trace("_xmlByteArray Size is:",_xmlByteArray.length);
			var _fl:File= new File(File.applicationDirectory.nativePath);
			_fl = _fl.resolvePath(_loadPath);
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