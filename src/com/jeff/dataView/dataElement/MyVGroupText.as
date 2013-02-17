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
		
		//public var _editMode:uint;//0:增加数据，1：修改数据，2：查看数据,
		public function MyVGroupText($text1:String="",$text2:String="",$editable:Boolean=true)
		{						
			
			label2=new TextArea();
			TextArea(label2).editable=TextArea(label2).editable=$editable;
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
		public function setText($tex:String):void
		{
			TextArea(label2).text=$tex;
		}
	}
}