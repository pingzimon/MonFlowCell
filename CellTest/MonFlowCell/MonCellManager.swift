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
        let pod = Bundle(for: MonCellManager.self)
        return Bundle.init(url: pod.url(forResource: "MonCellManager", withExtension: "bundle")!)!
    }
    
    public static func xibBundlePath()-> String{
        let pod = Bundle(for: MonCellManager.self)
        return pod.path(forResource: "MonCellManager", ofType: "bundle")!
    }
    public static func getImageWithName(_ name: String)-> UIImage?{
        return UIImage.init(contentsOfFile: self.xibBundlePath() + "/\(name)")
    }
    
}
