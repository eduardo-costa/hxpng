# Haxe Png
Haxe port of the [KevLinDev](http://www.kevlindev.com/gui/utilities/js_png/index.htm) PNG liberary for JS.
	
## Install
	
### Local
```html
<!-- full -->
<script src="js/png.js">
<!-- minified -->
<script src="js/png.min.js">
```

### CDN
```html
<!-- Current Version -->
<script src="http://cdn.thelaborat.org/png/png.js">
<script src="http://cdn.thelaborat.org/png/png.min.js">
```

## Haxe

* Add the `js` sources on your HTML page.
* Install the `hxpng` library:
```CLI
haxelib git hxpng https://github.com/eduardo-costa/hxpng
```  
Include the library when compiling:  

```CLI
haxe ... -lib hxpng ...
```
Include the references on your Haxe source.

```haxe
import js.png.Png;
```

## Usage

