package;
import haxe.Json;
import haxe.Timer;
import js.Browser;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;
import js.html.DivElement;
import js.html.Element;
import js.html.Event;
import js.html.Image;
import js.html.ImageData;
import js.html.ProgressEvent;
import js.html.XMLHttpRequest;
import js.png.Png;


/**
 * 
 * @author Eduardo Pons - eduardo@thelaborat.org
 */
class HaxeTest
{

	/**
	 * Entry point.
	 */
	static public function main():Void
	{		
		trace("Png> Haxe Example");
		
		Browser.window.onload = function(p_event:Event):Void
		{
			var img : Png = Png.create(32, 32, PngFormat.RGB, true);
			
			var e : DivElement = cast Browser.document.getElementById("field");
			
			var c : CanvasElement = cast Browser.document.createCanvasElement();
			c.width = 32;
			c.height = 32;
			var ctx : CanvasRenderingContext2D = c.getContext2d();
			ctx.fillStyle = "rgba(255,0,0,0.2)";
			ctx.fillRect(0, 0, 32, 32);
			ctx.fillStyle = "rgba(0,0,0,1.0)";
			ctx.font="12px Verdana";
			ctx.fillText("Hello", 0, 20);
			
			var cb : ImageData = ctx.getImageData(0, 0, c.width, c.height);
			
			
			Browser.document.body.appendChild(c);
			
			for (i in 0...32)
			{
				for (j in 0...32)
				{
					var cx : Float = j / 31.0;
					var cy : Float = i / 31.0;
					var p : Int = ((i * 32) + j) * 4;
					var pr:Int = p;
					var pg:Int = p + 1;
					var pb:Int = p + 2;
					var pa:Int = p + 3;					
					img.setRGBA(j, i, cb.data[pr], cb.data[pg],cb.data[pb],cb.data[pa]);
				}
			}
			
			untyped Browser.window.img = img;
			
			trace("Png> Image Created w[" + img.width + "] h[" + img.height + "] alpha[" + img.useAlpha + "] len["+img.data.length+"]");
			var xhr : XMLHttpRequest = new XMLHttpRequest();
			xhr.open("GET", "http://localhost:9000/file/png?buffer="+img.data.join(","), true);
			xhr.upload.onprogress = function(ev:ProgressEvent) { trace("upload: " + ev.loaded + "/" + ev.total); };
			xhr.onload = function(ev:Event) { trace(xhr.response); };
			xhr.withCredentials = true;			
			xhr.send();
		};
	}
	
}