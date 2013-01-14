package com.jeff.dataView.dataElement
{
	import spark.components.HGroup;
	import spark.components.Label;
	
	public class MyHGroupLabel extends HGroup
	{
		public function MyHGroupLabel($text1:String="",$text2:String="")
		{
			var label1:Label=new Label();
			var label2:Label=new Label();
			label1.text=$text1;
			label2.text=$text2;
			addElement(label1);
			addElement(label2);
			super();
		}
	}
}