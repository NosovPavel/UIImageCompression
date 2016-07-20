//
//  UIImageCompression.swift
//
//  Created by Nosov Pavel on 21.07.16.
//  Copyright © 2016 Iterika. All rights reserved.
//

import UIKit

extension UIImage {
    /**
     Returns the data for the image in JPEG format with prefered data size.
     A data object containing the JPEG data, or nil if there was a problem generating the data.
     
     - parameter size: size in kb, for exmaple size = 300, it's mean image will be compressen up to 300 kb
     
     - returns: NSData
     */
    func compressImage(size:Int) -> NSData? {
        var imageData = UIImageJPEGRepresentation(self, 0.99)
        let maxFileSize = size * 1024;
        
        //If the image is bigger than the max file size, try to bring it down to the max file size
        if (imageData!.length > maxFileSize) {
            imageData = UIImageJPEGRepresentation(self, CGFloat(maxFileSize / imageData!.length));
        }
        return imageData
    }
    
    /**
     Returns the data for the image in JPEG format with prefered data size.
     A data object containing the JPEG data, or nil if there was a problem generating the data.
     
     - parameteUIImageCompression.swiftr size: size in kb, for exmaple size = 300, it's means image will be compressen up to 300 kb
     
     - returns: NSData
     */
    func compressImageWithASmallStep(size:Int) -> NSData? {
        var compression:CGFloat = 0.9
        let maxCompression:CGFloat = 0.1
        let maxFileSize = size*1024;
        
        var imageData = UIImageJPEGRepresentation(self, 0.99)
        
        while (imageData!.length > maxFileSize && compression > maxCompression)
        {
            compression = compression - 0.1;
            imageData = UIImageJPEGRepresentation(self, compression);
        }
        
        return imageData
    }
    /**
     Returns the data for the specified image in JPEG format with prefered quality
     
     - parameter compressionQuality: The quality of the resulting JPEG image, expressed as a value from 0.0 to 0.99.
     
     - returns: NSData
     */
    func compressImageWithQuality(compressionQuality: CGFloat) -> NSData? {
        
        var quality:CGFloat = 0.0
        if compressionQuality > 0.99 {
            quality = 0.99
        } else {
            quality = compressionQuality
        }
        return UIImageJPEGRepresentation(self, quality)!
    }
    
}
