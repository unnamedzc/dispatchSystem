package com.jeff.myFactory
{
	import mx.core.IFactory;
	
	public class MyFactory implements IFactory
	{
		private var _fn:Function;
		public function MyFactory(fn:Function)
		{
			this._fn = fn; 
		}
		
		public function newInstance():*
		{
			return _fn(); 
		}
	}
}