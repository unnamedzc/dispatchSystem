package Values
{
	
	import myComponents.LoadingTitleWin;
	
	import spark.components.Scroller;

	public class GlobalValue
	{
		public static const SHEET_STYLE:uint=0;
		public static const TABLE_STYLE:uint=1;
		public static var _xmlData:XML;
		public static var _stageWidth:uint;
		public static var _stageHeight:uint;
		public static var _editMode:String//edit,add,remove	
		
		//selected
		public static var _selectedMainSheetID:uint;
		
		//正在编辑的驾驶员id
		public static var _empId:uint;
		
		//debug switch
		public static var _debug:Boolean=false;
		
		//系统处理数据mask
		public static var _loadingMask:LoadingTitleWin//=new LoadingTitleWin();
	}
}