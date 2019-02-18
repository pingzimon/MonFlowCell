//
//  MultiTable.swift
//  ControlCloud
//
//  Created by Pingzi on 2018/11/19.
//  Copyright © 2018年 dehui chen. All rights reserved.
//

import UIKit

class MultiTable: UITableView, UIGestureRecognizerDelegate {

    //允许同时识别多个手势
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}
