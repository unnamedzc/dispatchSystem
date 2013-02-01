package com.jeff.dataView.dataElement
{
	import mx.containers.FormItem;
	import mx.core.IVisualElement;
	
	import spark.components.Label;
	import spark.components.TextInput;
	
	public class MyHGroupLabel extends FormItem
	{
		private var label2:IVisualElement
		public function MyHGroupLabel($text1:String="",$text2:String="",$editable:Boolean=true)
		{
			if(!$editable)
			{
				label2=new Label();
				Label(label2).text=$text2;
			}else
			{
				label2=new TextInput();
			}
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
	}
}