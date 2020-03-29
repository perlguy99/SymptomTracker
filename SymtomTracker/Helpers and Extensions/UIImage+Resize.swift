//
//  UIImage+Resize.swift
//  SymtomTracker
//
//  Created by Brent Michalski on 3/29/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import UIKit

extension UIImage {
    
    func resize(maxWidthHeight: Double)-> UIImage? {
        
        let actualHeight = Double(size.height)
        let actualWidth  = Double(size.width)
        var maxWidth     = 0.0
        var maxHeight    = 0.0
        
        if actualWidth > actualHeight {
            maxWidth  = maxWidthHeight
            let per   = (100.0 * maxWidthHeight / actualWidth)
            maxHeight = (actualHeight * per) / 100.0
        }
        else {
            maxHeight = maxWidthHeight
            let per   = (100.0 * maxWidthHeight / actualHeight)
            maxWidth  = (actualWidth * per) / 100.0
        }
        
        let hasAlpha        = true
        let scale : CGFloat = 0.0
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: maxWidth, height: maxHeight), !hasAlpha, scale)
        self.draw(in: CGRect(origin: .zero, size: CGSize(width: maxWidth, height: maxHeight)))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
}
