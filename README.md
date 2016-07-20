Welcome to UIImageCompression!
===================
That extension can help you for compressing UIImage up to preferred size in Kilobytes. 

Methods
-------------
``` 
func compressImage(size:Int) -> NSData?
```
```
func compressImageWithASmallStep(size:Int) -> NSData?
```
```
func compressImageWithQuality(compressionQuality: CGFloat) -> NSData?
```

Example
-------------

just call direct from Image, that you want to compress
```
var image : UIImage = UIImage(named:"ImageName")
let imageData = image.compressImage(200) 
//image will be less than 200 kb, but compression step is large.

let imageData = image.compressImageWithASmallStep(200) 
// do the same things like above, but compression step is small

let imageData = image.compressImageWithQuality(0.5) // just compress image up to 50% quality.
```
I hope my extension can make your work easier.
