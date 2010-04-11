package fatcatmap.components.preloader
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.events.FlexEvent;
	import mx.preloaders.DownloadProgressBar;
	
	public final class CustomPreloader extends DownloadProgressBar
	{
		public var loader : LoadScreen;
		public var brownRect:Sprite;
		public var bgDrawn:Boolean;
		private var _timer : Timer;
		
		public function CustomPreloader() 
		{
			super();
		}
		
		override public function initialize() : void
		{
			super.initialize();
			
			if(this.bgDrawn!=true)
			{
				this.brownRect = new Sprite();
				this.brownRect.graphics.beginFill(0xFAF9E8);
				this.brownRect.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
				this.addChild(this.brownRect);
				this.bgDrawn = true;
			}
			
			this.loader = new LoadScreen();
			this.addChild(this.loader);
			
			this._timer = new Timer(1);
			this._timer.addEventListener(TimerEvent.TIMER, handleTimerTick);
			this._timer.start();
			
		}
		
		override public function set preloader(preloader : Sprite):void 
		{                   
			preloader.addEventListener(ProgressEvent.PROGRESS,  SWFDownLoadScreen);
			preloader.addEventListener(Event.COMPLETE,          SWFDownloadComplete);
			preloader.addEventListener(FlexEvent.INIT_PROGRESS, FlexInitProgress);
			preloader.addEventListener(FlexEvent.INIT_COMPLETE, FlexInitComplete);
		}
		
		private function SWFDownLoadScreen(event : ProgressEvent) : void
		{
			var prog : Number = event.bytesLoaded / event.bytesTotal * 100;
			if (this.loader)
			{
				this.loader.progress = prog;
			}
		}
		
		private function handleTimerTick(event : TimerEvent) : void
		{
			this.stage.addChild(this);
			this.loader.x = (this.stageWidth  - this.loader.width)  / 2;
			this.loader.y = (this.stageHeight - this.loader.height) / 2;
			this.loader.refresh();
		}
		
		private function SWFDownloadComplete(event : Event) : void {}
		
		private function FlexInitProgress(event : Event) : void {}
		
		private function FlexInitComplete(event : Event) : void 
		{      
			this.loader.ready = true;
			this.brownRect.visible = false;
			this._timer.stop();
			this.dispatchEvent(new Event(Event.COMPLETE));
		}
		
		override protected function showDisplayForInit(elapsedTime:int, count:int):Boolean
		{
			return true;
		}
		
		override protected function showDisplayForDownloading(elapsedTime:int,
															  event:ProgressEvent):Boolean
		{
			return true;
		}
	}
}