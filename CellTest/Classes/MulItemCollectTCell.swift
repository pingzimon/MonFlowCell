//
//  MulItemCollectTCell.swift
//  ControlCloud
//
//  Created by Pingzi on 2018/11/27.
//  Copyright © 2018年 dehui chen. All rights reserved.
//

import UIKit


/// 此类支持一行最多两条信息，会自动分行，只需要指定data的数据
open class MulItemCollectTCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    public static let CellID = "MulItemCollectTCellID"
    //xib静态下正常占位的item高度
    let DetailItemHeight: CGFloat = 23.0
    
    let DetailItemWidth: CGFloat = (KWidth - 30 - 20 - 10 - 15)/2.0
    
    
    let DetailFullWidth: CGFloat = KWidth - 30 - 20 - 15
    //cell行间距
    let lineSpace: CGFloat = 10
    
    @IBOutlet weak var radiusView: UIView!
    @IBOutlet weak var shodowView: UIView!
    
    @IBOutlet weak var moreImgV: UIImageView!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    //是否显示阴影
    open var isShowShadow = true{
        didSet{
            if !isShowShadow{
                shodowView.layer.shadowRadius = 0.0
                shodowView.layer.shadowColor = UIColor.clear.cgColor
                moreImgV.isHidden = true
                shodowView.clipsToBounds = true
            }
            else{
                shodowView.layer.shadowRadius = 4.0
                shodowView.layer.shadowColor = RGBA(r: 0, g: 0, b: 0, a: 0.2).cgColor
                moreImgV.isHidden = false
                shodowView.clipsToBounds = false
            }
            
        }
    }
    
    
    open var data: [DetailItem] = []{
        didSet{
            var totalHeight: CGFloat = 0
            for (index,item) in data.enumerated(){
                //先算宽度
                let width = CalculateFrame.getWidth(labelStr: item.title + item.detail , font: UIFont.init(name: kRegFont, size: 16)!, height: 23)
                if width > DetailItemWidth{
                    item.isSingleLine = true
                    item.width = DetailFullWidth
                    //算高
                    if item.line == 0{
                        let height = CalculateFrame.getHeigh(labelStr: item.title + item.detail, font: UIFont.init(name: kRegFont, size: 16)!, width: DetailFullWidth)
                        item.height = height - 23 + DetailItemHeight + 5
                    }
                    else{
                        item.height = OnelineHeight * CGFloat(item.line)
                    }
                    
                    
                    let itemplusHeight = item.height + lineSpace
                    totalHeight += itemplusHeight
                }
                else
                {
                    
                    if index > 0{
                        let preItem = data[index - 1]
                        //前一个item占据了一行才需要给totalHeight添加高度
                        if preItem.isSingleLine{
                            totalHeight += CGFloat(DetailItemHeight) + lineSpace
                        }
                            //前两个item都没有占据一行就要给totalHeight添加高度
                        else{
                            if index > 1{
                                let pre1Item = data[index - 1]
                                let pre2Item = data[index - 2]
                                if !pre1Item.isSingleLine && !pre2Item.isSingleLine{
                                    //标记一下已经过了一行
                                    pre1Item.isSingleLine = true
                                    totalHeight += CGFloat(DetailItemHeight) + lineSpace
                                }
                            }
                        }
                        
                    }
                        //第一个默认加高度
                    else{
                        totalHeight += CGFloat(DetailItemHeight) + lineSpace
                    }
                    
                    item.width = DetailItemWidth
                    item.height = CGFloat(DetailItemHeight)
                    
                    
                    if index + 1 < data.count {
                        let nextItem = data[index + 1]
                        let nextwidth = CalculateFrame.getWidth(labelStr: nextItem.title + nextItem.detail , font: UIFont.init(name: kRegFont, size: 16)!, height: 23)
                        //判断下一个是不是单行，如果是单行且上一个也是，则当前item需要单行则这一个就要单行
                        if index > 0{
                            let lastItem = data[index - 1]
                            if nextwidth > DetailItemWidth && lastItem.isSingleLine {
                                item.isSingleLine = true
                                item.width = DetailFullWidth
                                
                            }
                        }
                            //这是第一行
                        else{
                            if nextwidth > DetailItemWidth {
                                item.isSingleLine = true
                                item.width = DetailFullWidth
                            }
                        }
                        
                    }
                        //这是最后一行
                    else{
                        let lastItem = data[index - 1]
                        if lastItem.isSingleLine{
                            item.isSingleLine = true
                            item.width = DetailFullWidth
                        }
                    }
                    
                }
                
            }
            //            let row = ceil(Double(data.count) / 2.0)
            collectionHeight.constant = totalHeight - 10
            collection.reloadData()
        }
    }
    
    @IBOutlet weak var collection: UICollectionView!
    override open func awakeFromNib() {
        super.awakeFromNib()
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib.init(nibName: "MulItemCCell", bundle: nil), forCellWithReuseIdentifier: MulItemCCellID)
        collection.bounces = false
        collection.showsVerticalScrollIndicator = false
        self.selectionStyle = .none
        radiusView.layer.masksToBounds = true
        radiusView.layer.cornerRadius = 4.0
        shodowView.layer.shadowOffset = CGSize.init(width: 0, height: 2)
        shodowView.layer.masksToBounds = false
        shodowView.layer.shadowOpacity = 1.0
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - UICollectionViewDelegate
    
    private func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = data[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MulItemCCellID, for: indexPath) as! MulItemCCell
        cell.item = item
        return cell
    }
    
    
    //warning: 这里如果用public修饰的话，布局会不正确，？？？？？？？？
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = data[indexPath.item]
        return CGSize.init(width:item.width , height: item.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
}
