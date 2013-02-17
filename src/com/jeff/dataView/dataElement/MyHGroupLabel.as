package com.jeff.dataView.dataElement
{
	import mx.containers.FormItem;
	import mx.core.IVisualElement;
	
	import spark.components.Label;
	import spark.components.TextInput;
	
	public class MyHGroupLabel extends FormItem
	{
		private var label2:IVisualElement;
		
		//public var _editMode:uint;//0:增加数据，1：修改数据，2：查看数据,
		public function MyHGroupLabel($text1:String="",$text2:String="",$editable:Boolean=true)
		{
			label2=new TextInput();
				
			TextInput(label2).enabled=TextInput(label2).editable=$editable;
			
			//this.label=$text1
			addElement(label2);
			super();
		}
		public function getTitle():String
		{
			return this.label;
		}
		public function getText():String
		{
			return TextInput(label2).text;
		}
		
		public function setText($tex:String):void
		{
			TextInput(label2).text=$tex;
		}
	}
}