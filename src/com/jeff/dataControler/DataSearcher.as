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
				if($searchStr==DataManager.getInstance()._wholeData.emp[i].mainTab.elements("*")[unit])
				{
					//var _obj:Object={show:DataManager.getInstance()._wholeData.emp[i].mainTab.elements("*")[unit],id:i}
					_listData.push(DataManager.getInstance()._wholeData.emp[i].mainTab.elements("*")[unit]);
					_listID.push(i);
				}					
			}
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