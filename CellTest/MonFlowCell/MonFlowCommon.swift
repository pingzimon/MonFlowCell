//
//  MonFlowCommon.swift
//  CellTest
//
//  Created by Pingzi on 2019/2/12.
//  Copyright © 2019年 dehui chen. All rights reserved.
//

import UIKit

let KWidth: CGFloat = UIScreen.main.bounds.width


let Version9_ORLater: Bool = {
    if #available(iOS 9.0, *) {
        return true
    }
    return false
}()



let kRegFont : String = {
    if Version9_ORLater{
        return "PingFangSC-Regular"
    }
    else{
        return "HelveticaNeue-Thin"
    }
}()

let kMedFont : String = {
    if Version9_ORLater{
        return "PingFangSC-Medium"
    }
    else{
        return "HelveticaNeue-Medium"
    }
}()

let kSemFont : String = {
    if Version9_ORLater{
        return "PingFangSC-SemiBold"
    }
    else{
        return "HelveticaNeue-Bold"
    }
}()

func RGBA(r red:CGFloat, g green:CGFloat, b blue:CGFloat, a alpha:CGFloat) -> UIColor
{
    return UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
}


/** 是不是留海屏 */
let KIsiPhoneX : Bool = {
    let selector = NSSelectorFromString("currentMode")
    let IphoneXSize = CGSize.init(width: 1125, height: 2436)
    let IphoneXRSize = CGSize.init(width: 828, height: 1792)
    let IphoneXSMaxSize = CGSize.init(width: 1242, height: 2688)
    return IphoneXSize.equalTo(UIScreen.main.currentMode!.size) || IphoneXRSize.equalTo(UIScreen.main.currentMode!.size) || IphoneXSMaxSize.equalTo(UIScreen.main.currentMode!.size) ? true : false
}()
let KHeight: CGFloat = UIScreen.main.bounds.height
let KTabBarH: CGFloat = KIsiPhoneX ? 83: 49
let KStatusBarH: CGFloat = KIsiPhoneX ? 44: 20
let KNaviBarH : CGFloat = 44.0

let KIphoneXBottom: CGFloat = KIsiPhoneX ?  34.0 : 0.0

let DarkTitleColor: UIColor = {
    return RGBA(r: 68, g: 68, b: 74, a: 1.0)
}()



