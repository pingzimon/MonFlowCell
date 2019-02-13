 
//
//  MDMulLineTableTCell.swift
//  ControlCloud
//
//  Created by Pingzi on 2018/11/22.
//  Copyright © 2018年 dehui chen. All rights reserved.
//

import UIKit



let contentMaxWidth: CGFloat = KWidth - 15 * 4
 
let disclosureWidthE: CGFloat = 35

let OnelineHeight: CGFloat = 23
 


/// 此类每一行显示一条信息，只需要指定data的数据，左边的标题label的内容最长度决定了整体右侧label的加载宽度
open class MonMulLineTableTCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource  {
    
    public static let CellID = "MonMulLineTableTCellID"
    
    public let RefreshTableHeightNoti = "RefreshTableHeightNoti"
    @IBOutlet weak var disclourseWidth: NSLayoutConstraint!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var radiusView: UIView!
    @IBOutlet weak var backShadowView: UIView!
    
    @IBOutlet weak var tableHeight: NSLayoutConstraint!

    @IBOutlet weak var table: MultiTable!
    
    //是否有右箭头
    open var hasDisclourse: Bool = false
    
    open var data: [DetailItem] = []{
        didSet{
            let item = data.first!
            var totalHeight: CGFloat = 0
            //是否MyDoTableTCell已经计算过
            var hasCalculate = true
            if data.count > 0{
                hasCalculate = data[0].height == 0 ? false : true
            }
            //先计算左边label的最大宽度
            var maxLeftWidth: CGFloat = 0
            if !hasCalculate{
                for item in data{
                    let singleItemLeftWidth = CalculateFrame.getWidth(labelStr: item.title, font: UIFont.init(name: kRegFont, size: 16)!, height: 23)
                    maxLeftWidth = maxLeftWidth > singleItemLeftWidth ? maxLeftWidth : singleItemLeftWidth
                }
            }
            for item in data{
                if hasCalculate{
                    totalHeight += item.height
                }
                else{
                    //每个MDMulLineTableTCell的高度
                        item.width = maxLeftWidth
                        //算高
                        //每个MDMulLIneTCell的高度
                        var singleItemheight:CGFloat = 0
                        if item.line == 0{
                            //如果不是prochechSign，计算宽度disclosureWidth要减去disclosureWidth
                            singleItemheight = CalculateFrame.getHeigh(labelStr: item.detail, font:  UIFont.init(name: kRegFont, size: 16)!, width: contentMaxWidth - (hasDisclourse ? disclosureWidthE : 0) - maxLeftWidth)
                        }
                        else{
                            singleItemheight = OnelineHeight * CGFloat(item.line)
                        }
                        
                        let cellHeight = singleItemheight + 12
                        item.height = cellHeight
                        totalHeight += cellHeight
                }
            }
            if !hasDisclourse{
                disclourseWidth.constant = 0.0
            }
            else{
                disclourseWidth.constant = disclosureWidthE
            }
            tableHeight.constant = totalHeight
            table.reloadData()
        }
    }
    
    //是否显示阴影 默认false
    open var isHideShadow = false{
        didSet{
            if isHideShadow{
                backShadowView.layer.shadowRadius = 0.0
                backShadowView.layer.shadowColor = UIColor.white.cgColor
                backShadowView.clipsToBounds = true
                
            }
            else{
                backShadowView.layer.shadowRadius = 4.0
                backShadowView.layer.shadowColor = RGBA(r: 0, g: 0, b: 0, a: 0.2).cgColor
                backShadowView.clipsToBounds = false
            }
        }
    }
    
    open var isbackColorClear = false{
        didSet{
            if isbackColorClear{
                self.backgroundColor = UIColor.clear
            }
            else{
                self.backgroundColor = UIColor.white
            }
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        table.delegate = self
        table.dataSource = self
        table.tableHeaderView = UIView()
        table.bounces = false
        table.register(UINib.init(nibName: "MDMulLIneTCell", bundle: nil), forCellReuseIdentifier: MDMulLIneTCellID)
        table.estimatedRowHeight = 100
        radiusView.layer.masksToBounds = true
        radiusView.layer.cornerRadius = 4.0
        backShadowView.layer.shadowOffset = CGSize.init(width: 0, height: 2)
        backShadowView.layer.masksToBounds = false
        backShadowView.layer.shadowOpacity = 1.0
        let path = Bundle.main.path(forResource: "MonFlowCell", ofType: "bundle")!.appending("/iconRight.png")
        moreBtn.setImage(UIImage.init(contentsOfFile: path) , for: .normal)
    }
    
    
    
    
    
    

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- UITableView Delegate / DataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MDMulLIneTCellID, for: indexPath) as! MDMulLIneTCell
        cell.selectionStyle = .none
        let item = data[indexPath.row]
        cell.item = item
        let moreWith: CGFloat = hasDisclourse ? disclosureWidthE : 0
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: (KWidth - 15 * 4 - moreWith) / 2 , bottom: 0, right: (KWidth - 15 * 4 - moreWith ) / 2)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
}


 open class DetailItem: NSObject {
    //左控件数据
    open var title = ""
    //中控件数据
    open var detail = ""
    //右控件数据
    open var more = ""
    //占位数据
    open var holder: String = ""
    //指定行数 默认不自动换行
    open var line: Int = 1
    
    open var width: CGFloat = 0
    open var height: CGFloat = 0
    
    //是否占据一行
    open var isSingleLine: Bool = false
    //选中
    open var isChoose: Bool = false
    //此item是不是空数据
    open var isFake = false
    
    public override init() {
        super.init()
    }
    
}
