//
//  Common.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/5.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import UIKit

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

let kTabBarH : CGFloat = 49.0
let kNaviBarH : CGFloat = 64.0

// MARK : - 颜色方法

func RGBA(r:CGFloat , g:CGFloat ,b:CGFloat ,a:CGFloat) -> UIColor {
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

// MARK : - 打印方法

func LXLog<T>(_ message:T , file :String = #file , funcName :String = #function , lineNum : Int = #line){
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName):(\(lineNum))-\(message)")
    #endif
}


let Color_main = UIColor.hexInt(0x00C6A8)
		
