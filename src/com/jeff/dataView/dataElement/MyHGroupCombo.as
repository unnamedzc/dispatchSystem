package com.jeff.dataView.dataElement
{
	import mx.collections.ArrayCollection;
	import mx.containers.FormItem;
	
	import spark.components.DropDownList;
	
	public class MyHGroupCombo extends FormItem
	{
		private var DDList:DropDownList=new DropDownList();
		
		[Bindable]
		private var _depts:ArrayCollection = new ArrayCollection([
			{label:"是", data:1}, 
			{label:"否", data:2},]);
		
		//public var _editMode:uint;//0:增加数据，1：修改数据，2：查看数据,
		public function MyHGroupCombo($text:String="",$editable:Boolean=true)
		{
			this.label=$text
			if($editable){
				addElement(DDList);
				DDList.dataProvider=_depts;
				DDList.selectedIndex=0;
			}
			else
			{
				
			}
			super();
		}
		public function getTitle():String
		{
			return this.label;
		}
		public function getText():String
		{
			if(DDList.selectedIndex==-1){
				return ""
			}else if(DDList.selectedIndex==0){
				return "是"
			}else if(DDList.selectedIndex==1){
				return "否"
			}
			return ""
		}
		public function setText($tex:String):void
		{
			//TextInput(label2).text=$tex;
			if($tex=="否")
			{
				DDList.selectedIndex=1
			}else
			{
				DDList.selectedIndex=0
			}
		}
	}
}