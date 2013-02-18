package com.jeff.dataControler
{
	public class DataSearcher
	{
		/*<fx:String>姓名</fx:String>
									<fx:String>身份证号</fx:String>
									<fx:String>手机号</fx:String>
									<fx:String>固定电话</fx:String>
									<fx:String>驾驶证号</fx:String>*/
		public static var _searchID:uint;
		//array (object(name,id))
		public static var _listData:Array=new Array();
		public static var _listID:Array=new Array();
		public static function searchData($searchStr:String):void
		{
			var unit:uint;
			dispose();
			_listData=new Array();
			_listID=new Array();
			switch(_searchID)
			{
				case 0:
				case 1:
					unit=_searchID;
					break;
				case 2:
					unit=3;
					break;
				case 3:
					unit=5;
					break;
				case 4:
					unit=6;
					break;
			}
			
			var _len:uint=DataManager.getInstance()._wholeData.emp.length();
			//trace("Unit is:",$searchStr,unit,_len)
			for(var i:uint=0;i<_len;++i)
			{
				//trace(DataManager.getInstance()._wholeData.emp[i].mainTab.elements("*")[unit]);
				//todo模糊查询
				containStr($searchStr,DataManager.getInstance()._wholeData.emp[i].mainTab.elements("*")[unit])
				if(containStr($searchStr,DataManager.getInstance()._wholeData.emp[i].mainTab.elements("*")[unit]))
				{
					//var _obj:Object={show:DataManager.getInstance()._wholeData.emp[i].mainTab.elements("*")[unit],id:i}
					_listData.push(DataManager.getInstance()._wholeData.emp[i].mainTab.elements("*")[unit]);
					_listID.push(i);
				}					
			}
		}
		
		private static function containStr($str:String,$str2:String):Boolean
		{
			var _bol:Boolean=false;
			/*var _len:uint=$str2.length;
			var _len2:uint=$str.length;
			var myPattern:RegExp = /{$str}/g; 
			trace($str2.match(myPattern));*/
			//var ss:String="here is my home,she is my wife.";
			//var s:String="is"
			var reg:RegExp = new RegExp($str, "\g");
			trace("运行后="+$str2.search(reg));//返回第一个与'my'匹配的ss索引
			var _B:int=$str2.search(reg)
			/*for(var i:uint=0;i<_len;++i)
			{
				for(var j:uint;j<_len2;++i)
				{
					
				}
			}*/
			_B>=0?_bol=true:_bol=false
			return _bol
		}
		
		public static function returnId($id:uint):uint
		{
			return _listID[$id];
		}
			
		
		public static function dispose():void
		{
			_listData=new Array();
			_listData.length=0;
			_listData=null;
			
			_listID=new Array();
			_listID.length=0;
			_listID=null;
		}
	}
}