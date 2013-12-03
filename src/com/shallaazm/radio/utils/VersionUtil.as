package com.shallaazm.radio.utils
{
	import com.shallaazm.air.events.VersionEvent;
	import com.shallaazm.air.managers.VersionManager;
	import com.shallaazm.flash.debugger.Debugger;
	
	import flash.desktop.NativeApplication;
	import flash.desktop.Updater;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	
	[Event(name="complete", type="flash.events.Event")]
	/**
	 * 버전 체크
	 * @author 이준호(shallaa, shallaa@shallaazm.com)
	 */
	public class VersionUtil extends EventDispatcher
	{
		
		//--------------------------------------------------------------------------
		//  
		//  Class Variables
		//  
		//--------------------------------------------------------------------------
		
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
		
		/** loader */
		private var _urlLoader:URLLoader;
		
		/** 버전 관리 */
		private var _versionManager:VersionManager;
		
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
		public function VersionUtil( target:IEventDispatcher = null )
		{
			super( target );
			
			_versionManager = new VersionManager( Config.CURRENT_VERSION );
			_versionManager.tempFileName = 'naver_radio';
			_versionManager.addEventListener( VersionEvent.HAS_UPDATED_VERSION, onHasUpdatedVersion, false, 0, true );
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
		
		/**
		 * 버전 파일 로드 후 처리
		 */		
		public function loadAndCheckVersion( versionURL:String ):void
		{
			_urlLoader = new URLLoader;
			_urlLoader.addEventListener( Event.COMPLETE, onCompleteLoader );
			_urlLoader.addEventListener( IOErrorEvent.IO_ERROR, onIOErrorLoader );
			_urlLoader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, onSecurityErrorLoader );
			_urlLoader.load( new URLRequest( versionURL ) );
		}
		
		//--------------------------------------------------------------------------
		//  
		//  Event Handlers
		//  
		//--------------------------------------------------------------------------
		
		/**
		 * 버전 파일 로드 완료
		 */		
		private function onCompleteLoader( event:Event ):void
		{
			var arrData:Array = _urlLoader.data.split( "," );
			
			_versionManager.checkVersion( arrData[0], arrData[1] );
			
			_urlLoader.removeEventListener( Event.COMPLETE, onCompleteLoader );
			_urlLoader.removeEventListener( IOErrorEvent.IO_ERROR, onIOErrorLoader );
			_urlLoader.removeEventListener( SecurityErrorEvent.SECURITY_ERROR, onSecurityErrorLoader );
			_urlLoader = null;
		}
		
		private function onHasUpdatedVersion( versionEvent:VersionEvent ):void
		{
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		private function onIOErrorLoader( errorEvent:IOErrorEvent ):void
		{
			Debugger.traceError( errorEvent.text );
			
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		private function onSecurityErrorLoader( errorEvent:SecurityErrorEvent ):void
		{
			Debugger.traceError( errorEvent.text );
			
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
	}
}