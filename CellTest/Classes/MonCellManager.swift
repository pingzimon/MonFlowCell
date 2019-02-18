//
//  MonCellManager.swift
//  CellTest
//
//  Created by Pingzi on 2019/2/13.
//  Copyright © 2019年 dehui chen. All rights reserved.
//

import UIKit

open class MonCellManager: NSObject {

    public static func xibBundleWithClass(className: AnyClass)-> Bundle{
        let pod = Bundle(for: className)
        let path = pod.path(forResource: "MonFlowCell", ofType: "bundle")
        return path != nil ? Bundle.init(path: path!)! : Bundle.main
    }
    
    public static func xibBundlePath()-> String{
        let pod = Bundle(for: MonCellManager.self)
        return pod.path(forResource: "MonFlowCell", ofType: "bundle")!
    }
    public static func getImageWithName(_ name: String)-> UIImage?{
        return UIImage.init(contentsOfFile: self.xibBundlePath() + "/\(name)")
    }
    
}
