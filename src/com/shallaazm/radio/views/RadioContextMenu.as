package com.shallaazm.radio.views
{
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.events.DataEvent;
	import flash.events.Event;
	
	/**
	 * context menu
	 * @author 이준호(shallaa, shallaa@shallaazm.com)
	 */
	public class RadioContextMenu extends NativeMenu
	{
		
		//--------------------------------------------------------------------------
		//  
		//  Class Variables
		//  
		//--------------------------------------------------------------------------
		
		/** 열기 */
		public static const MENU_OPEN:String = 'menuOpen';
		
		/** 다음 곡 */
		public static const MENU_NEXT:String = 'menuNext';
		
		/** 좋아요 */
		public static const MENU_LIKE:String = 'menuLike';
		
		/** 싫어요 */
		public static const MENU_UNLIKE:String = 'menuUnlike';
		
		/** 종료 */
		public static const MENU_EXIT:String = 'menuExit';
		
		//--------------------------------------------------------------------------
		//  
		//  Class Methods
		//  
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//  
		//  Constants
		//  
		//--------------------------------------------------------------------------
		
		/** 메뉴 목록 */
		private var _radioMenus:Array = [
			{label:"열기", isSeparator:false},
			{label:"", isSeparator:true},
			{label:"다음곡", isSeparator:false},
			{label:"", isSeparator:true},
			{label:"좋아요", isSeparator:false},
			{label:"싫어요", isSeparator:false}
		];
		
		//--------------------------------------------------------------------------
		//  
		//  On Stage Instance
		//  
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//  
		//  Variables
		//  
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//  
		//  Properties
		//  
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//  
		//  Constructor
		//  
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor
		 */
		public function RadioContextMenu( isMac:Boolean = true )
		{
			var label:String;
			var isSeparator:Boolean;
			var nativeMenuItem:NativeMenuItem;
			var index:int;
			var count:int;
			
			if ( isMac == false )
			{
				_radioMenus = _radioMenus.concat( [
					{label:"", isSeparator:true},
					{label:"종료", isSeparator:false}] 
				);
			}
			
			index = 0;
			count = _radioMenus.length;
			
			for ( ; index < count; index = index + 1 )
			{
				label       = _radioMenus[index].label;
				isSeparator = _radioMenus[index].isSeparator;
				
				nativeMenuItem = new NativeMenuItem( label, isSeparator );
				nativeMenuItem.addEventListener( Event.SELECT, onSelectMenuItem );
				
				addItem( nativeMenuItem );
			}
		}
		
		//--------------------------------------------------------------------------
		//  
		//  Override Methods
		//  
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//  
		//  Methods
		//  
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//  
		//  Event Handlers
		//  
		//--------------------------------------------------------------------------
		
		/**
		 * menu select handler
		 */		
		private function onSelectMenuItem( event:Event ):void
		{
			var selected:String = '';
			
			switch ( event.target.label ) 
			{
				case '열기':
					selected = MENU_OPEN;
					break;
				case '다음곡':
					selected = MENU_NEXT;
					break;
				case '좋아요':
					selected = MENU_LIKE;
					break;
				case '싫어요':
					selected = MENU_UNLIKE;
					break;
				case '종료':
					selected = MENU_EXIT;
					break;
			}
			
			if ( selected != '' )
			{
				dispatchEvent( new DataEvent( DataEvent.DATA, false, false, selected ) );
			}
		}
	}
}