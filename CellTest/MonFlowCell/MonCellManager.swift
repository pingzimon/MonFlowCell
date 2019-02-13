//
//  MonCellManager.swift
//  CellTest
//
//  Created by Pingzi on 2019/2/13.
//  Copyright © 2019年 dehui chen. All rights reserved.
//

import UIKit

open class MonCellManager: NSObject {

    public static func xibBundle()-> Bundle{
        return Bundle.init(url: Bundle.main.url(forResource: "MonFlowCell", withExtension: "bundle")!)!
    }
    
    public static func xibBundlePath()-> String{
        return Bundle.main.path(forResource: "MonFlowCell", ofType: "bundle")!
    }
    public static func getImageWithName(_ name: String)-> UIImage?{
        return UIImage.init(contentsOfFile: self.xibBundlePath() + "/\(name)")
    }
    
}
