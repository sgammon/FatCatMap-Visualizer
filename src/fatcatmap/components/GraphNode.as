package fatcatmap.components
{
	import mx.containers.Canvas;
	import mx.styles.StyleManager2;
	import mx.utils.ColorUtil;
	
	public class GraphNode extends Canvas
	{
		override protected function updateDisplayList (w : Number, h : Number) : void
		{
			super.updateDisplayList (w, h);
			
			// retrieves the user-defined styles
			var fillColors:Array = getStyle("fillColors");
			var fillAlphas:Array = getStyle("fillAlphas");
			var cornerRadius:Number = getStyle("cornerRadius");
			
			// converts the fill colors to RGB color values
			StyleManager2.getColorNames (fillColors);
			
			// ready to draw!
			graphics.clear ();
			
			// draws the gradient
			drawRoundRect (0, 0, w, h, cornerRadius, fillColors,
				fillAlphas, verticalGradientMatrix (0, 0, w, h));
		}
	}
}