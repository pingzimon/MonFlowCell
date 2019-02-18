//
//  MulItemCCell.swift
//  ControlCloud
//
//  Created by Pingzi on 2018/11/27.
//  Copyright © 2018年 dehui chen. All rights reserved.
//

import UIKit

let MulItemCCellID = "MulItemCCellID"

class MulItemCCell: UICollectionViewCell {

    @IBOutlet weak var titleLB: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var item: DetailItem!{
        didSet{
            let attriString = NSAttributedString.configureWithFullString(item.title + item.detail, attStr: item.detail, anchorColor: DarkTitleColor)
            titleLB.attributedText = item.detail.isEmpty ? NSAttributedString.init(string: "无") : attriString
            titleLB.numberOfLines = item.line
        }
    }

}

extension NSAttributedString{
    class func configureWithFullString(_ fullString: String, attStr: String, anchorColor: UIColor) -> NSMutableAttributedString {
        let attFullString = NSMutableAttributedString.init(string: fullString)
        var range: NSRange? = nil
        if (fullString as NSString).range(of: attStr).location != NSNotFound{
            range = (fullString as NSString).range(of: attStr)
            attFullString.addAttributes([NSAttributedString.Key.foregroundColor : anchorColor], range: range!)
        }
        return attFullString
    }
}
