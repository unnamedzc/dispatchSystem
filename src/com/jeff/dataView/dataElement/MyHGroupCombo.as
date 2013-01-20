package com.jeff.dataView.dataElement
{
	import mx.collections.ArrayCollection;
	import mx.containers.FormItem;
	
	import spark.components.DropDownList;
	
	public class MyHGroupCombo extends FormItem
	{
		[Bindable]
		private var _depts:ArrayCollection = new ArrayCollection([
			{label:"是", data:1}, 
			{label:"否", data:2},]);
		public function MyHGroupCombo($text:String="")
		{
			
			var DDList:DropDownList=new DropDownList();
			
			
			this.label=$text
			addElement(DDList);
			DDList.dataProvider=_depts;
			super();
		}
	}
}