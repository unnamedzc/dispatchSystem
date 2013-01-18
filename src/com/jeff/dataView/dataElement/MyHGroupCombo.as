package com.jeff.dataView.dataElement
{
	import mx.collections.ArrayCollection;
	
	import spark.components.DropDownList;
	import spark.components.HGroup;
	import spark.components.Label;
	
	public class MyHGroupCombo extends HGroup
	{
		[Bindable]
		private var _depts:ArrayCollection = new ArrayCollection([
			{label:"是", data:1}, 
			{label:"否", data:2},]);
		public function MyHGroupCombo($text:String="")
		{
			var label:Label=new Label();
			var DDList:DropDownList=new DropDownList();
			label.text=$text;
			
			addElement(label);
			addElement(DDList);
			DDList.dataProvider=_depts;
			super();
		}
	}
}