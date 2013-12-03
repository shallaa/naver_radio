package
{
	
	/**
	 * 전체 공통 파일
	 * @author 이준호(shallaa, shallaa@shallaazm.com)
	 */
	public class Config
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
		
		/** 현재 버전 */
		public static const CURRENT_VERSION:String = '0.3';
		
		/** 다음곡 element class */
		public static const CLASS_NEXT:String = '_click_control_button(VIEW_FORWARD)';
		
		/** 음소거 element class */
		public static const CLASS_MUTE:String = '_click_control_button(VIEW_VOLUME,0)';
		
		/** 좋아요 element class */
		public static const CLASS_LIKE:String = '_click_control_button(VIEW_LIKE,Y)';
		
		/** 싫어요 element class */
		public static const CLASS_UNLIKE:String = '_click_control_button(VIEW_LIKE,N)';
		
		/** 버전 파일 경로 */
		public static const URL_VERSION:String = 'http://shallaa.github.io/naver_radio/version.txt';
		
		/** 로그인 화면 경로 */
		public static const URL_LOG_IN:String = 'https://nid.naver.com/nidlogin.login?svctype=64&url=http%3A%2F%2Fmusic.naver.com%2Fapi%2FplayerLogin.nhn';
		
		/** 로그인 완료 화면 */
		public static const URL_LOG_IN_COMPLETE:String = 'http://music.naver.com/api/playerLogin.nhn';
		
		/** 라디오 화면 */
		public static const URL_RADIO:String = 'http://player.music.naver.com/radio.nhn';
		
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
		public function Config()
		{
			//
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
		
	}
}