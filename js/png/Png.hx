package js.png;
import js.html.Uint8Array;

/**
 * Enumeration describing the Png creation format.
 */
class PngFormat
{
	/**
	 * Grayscale
	 */
	static public var Grayscale : String = "png_grayscale";
	
	/**
	 * Indexed
	 */
	static public var Indexed   : String = "png_indexed";
	
	/**
	 * Color
	 */
	static public var RGB 	    : String = "png_rgb";	
}

/**
 * Class that implements a Png Image.
 * @author Eduardo Pons - eduardo@thelaborat.org
 */
extern class Png
{
	/**
	 * Creates a new Png file.
	 * @param	p_width
	 * @param	p_height
	 * @param	p_format
	 * @return
	 */
	@:overload(function (p_width:Int, p_height:Int, p_format:String) : Png{})
	static inline public function create(p_width:Int, p_height:Int, p_format:String,p_alpha:Bool) : Png
	{
		var w : Int = p_width == null ? 1 : p_width;
		var h : Int = p_height == null ? 1 : p_height;
		var a : Bool = p_alpha == null ? false : p_alpha;
		if (p_format == PngFormat.Grayscale) return untyped __js__("new PngGreyscale(w, h, a)");
		if (p_format == PngFormat.Indexed) 	 return untyped __js__("new PngIndex(w, h, a)");
		return untyped __js__("new  PngTrueColor(w, h, a)");
	}
	
	/**
	 * Width.
	 */
	public var width(get, never):Int;
	private inline function get_width():Int { return untyped this.getWidth(); }
	
	/**
	 * Height.
	 */
	public var height(get, never):Int;
	private inline function get_height():Int { return untyped this.getHeight(); }
	
	/**
	 * Returns the image data as byte array.
	 */
	public var buffer(get, never):Uint8Array;
	private inline function get_buffer():Uint8Array { var l : Array<Int> = this.data; return new Uint8Array(l); }
	
	/**
	 * Returns the image data as an array.
	 */
	public var data(get, never):Array<Int>;
	private inline function get_data():Array<Int> { return untyped this.getData(); }
	
	/**
	 * Returns the image data as a base64 string.
	 */
	public var base64(get, never):String;
	private inline function get_base64():String { return untyped this.getData(); }
	
	/**
	 * Flag that indicates this image has alpha channel.
	 */
	var useAlpha:Bool;
	
	/**
	 * Sets the Png pixel by its 2D position.
	 * @param	p_x
	 * @param	p_y
	 * @param	p_r
	 * @param	p_g
	 * @param	p_b
	 * @param	p_a
	 */
	public inline function setRGBA(p_x:Int, p_y:Int, p_r:Int, p_g:Int, p_b:Int, p_a:Int=255):Void { untyped this.setPixel(p_x,p_y, p_r, p_g, p_b, p_a); }
	
	/**
	 * Sets the pixel using normalized channel values.
	 * @param	p_x
	 * @param	p_y
	 * @param	p_r
	 * @param	p_g
	 * @param	p_b
	 * @param	p_a
	 */
	public inline function setColor(p_x:Int, p_y:Int, p_r:Float, p_g:Float, p_b:Float, p_a:Float=1.0):Void	{ this.setRGBA(p_x, p_y, Math.floor(p_r * 255.0), Math.floor(p_g * 255.0), Math.floor(p_b * 255.0), Math.floor(p_a * 255.0)); }
	
}