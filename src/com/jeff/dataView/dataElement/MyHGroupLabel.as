package com.jeff.dataView.dataElement
{
	import mx.core.IVisualElement;
	
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.TextInput;
	
	public class MyHGroupLabel extends HGroup
	{
		public function MyHGroupLabel($text1:String="",$text2:String="",$editable:Boolean=true)
		{
			var label1:Label=new Label();
			var label2:IVisualElement
			if(!$editable)
			{
				label2=new Label();
				Label(label2).text=$text2;
			}else
			{
				label2=new TextInput();
			}
			label1.text=$text1;
			
			addElement(label1);
			addElement(label2);
			super();
		}
	}
}