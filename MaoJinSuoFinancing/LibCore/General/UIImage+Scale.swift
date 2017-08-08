//
//  UIImage+Scale.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/5.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import Foundation
import UIKit




extension UIImage {
    
    // tabbarItem 当设置了 UIImageRectInset 时，点击之后会逐渐改变大小（位置）， 是因为未设置 non-retina的图片， 可以按照下面的方法设置scale
    
    class func thumbnailImageSize(_ size : CGSize , fromImage: UIImage) -> UIImage {
        
        var image : UIImage = UIImage()
        
        guard UIScreen.main.responds(to: #selector(getter: scale)) else {
            return image
        }
        
        let _scale : CGFloat = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(size, false, _scale)
        fromImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
