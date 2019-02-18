//
//  MDMulLIneTCell.swift
//  ControlCloud
//
//  Created by Pingzi on 2018/11/22.
//  Copyright © 2018年 dehui chen. All rights reserved.
//

import UIKit

let MDMulLIneTCellID = "MDMulLIneTCellID"

class MDMulLIneTCell: UITableViewCell {

    @IBOutlet weak var contentLB: UILabel!
    
    @IBOutlet weak var leftWidth: NSLayoutConstraint!
    
    @IBOutlet weak var rightLB: UILabel!
    var item: DetailItem!{
        didSet{
            contentLB.text = item.title
            rightLB.text = item.detail
            rightLB.numberOfLines = item.line
            leftWidth.constant = item.width
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    
}
