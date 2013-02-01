package com.jeff.dataView.dataElement
{
	/*
	 * 
	text
	this is a big text to show lone story
	
	
	*/
	import mx.core.IVisualElement;
	
	import spark.components.Label;
	import spark.components.TextArea;
	import spark.components.VGroup;
	
	public class MyVGroupText extends VGroup
	{
		private var label2:IVisualElement;
		private var label1:Label=new Label();
		public function MyVGroupText($text1:String="",$text2:String="",$editable:Boolean=true)
		{						
			if(!$editable)
			{
				label2=new TextArea();
				Label(label2).text=$text2;
				label2.width=2000;
				label2.height=200;
			}else
			{
				label2=new TextArea();
			}
			label1.text=$text1;
			
			addElement(label1);
			addElement(label2);
			
			super();
		}
		public function getTitle():String
		{
			return label1.text;
		}
		public function getText():String
		{
			return TextArea(label2).text;
		}
	}
}