(function (console) { "use strict";
var HaxeTest = function() { };
HaxeTest.main = function() {
	console.log("Png> Haxe Example");
	window.onload = function(p_event) {
		var img;
		var p_format = js_png_PngFormat.RGB;
		var w = 32;
		var h = 32;
		var a = true;
		if(p_format == js_png_PngFormat.Grayscale) {
			img = new PngGreyscale(w, h, a);
		} else if(p_format == js_png_PngFormat.Indexed) {
			img = new PngIndex(w, h, a);
		} else {
			img = new  PngTrueColor(w, h, a);
		}
		var e = window.document.getElementById("field");
		var c;
		c = (function($this) {
			var $r;
			var _this = window.document;
			$r = _this.createElement("canvas");
			return $r;
		}(this));
		c.width = 32;
		c.height = 32;
		var ctx = c.getContext("2d",null);
		ctx.fillStyle = "rgba(255,0,0,0.2)";
		ctx.fillRect(0,0,32,32);
		ctx.fillStyle = "rgba(0,0,0,1.0)";
		ctx.font = "12px Verdana";
		ctx.fillText("Hello",0,20);
		var cb = ctx.getImageData(0,0,c.width,c.height);
		window.document.body.appendChild(c);
		var _g = 0;
		while(_g < 32) {
			var i = _g++;
			var _g1 = 0;
			while(_g1 < 32) {
				var j = _g1++;
				var cx = j / 31.0;
				var cy = i / 31.0;
				var p = (i * 32 + j) * 4;
				var pr = p;
				var pg = p + 1;
				var pb = p + 2;
				var pa = p + 3;
				img.setPixel(j,i,cb.data[pr],cb.data[pg],cb.data[pb],cb.data[pa]);
			}
		}
		window.img = img;
		console.log("Png> Image Created w[" + img.getWidth() + "] h[" + img.getHeight() + "] alpha[" + (img.useAlpha == null?"null":"" + img.useAlpha) + "] len[" + img.getData().length + "]");
		var xhr = new XMLHttpRequest();
		xhr.open("GET","http://localhost:9000/file/png?buffer=" + img.getData().join(","),true);
		xhr.upload.onprogress = function(ev) {
			console.log("upload: " + ev.loaded + "/" + ev.total);
		};
		xhr.onload = function(ev1) {
			console.log(xhr.response);
		};
		xhr.withCredentials = true;
		xhr.send();
	};
};
var js_png_PngFormat = function() { };
js_png_PngFormat.Grayscale = "png_grayscale";
js_png_PngFormat.Indexed = "png_indexed";
js_png_PngFormat.RGB = "png_rgb";
HaxeTest.main();
})(typeof console != "undefined" ? console : {log:function(){}});
