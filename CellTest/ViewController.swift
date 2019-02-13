//
//  ViewController.swift
//  CellTest
//
//  Created by Pingzi on 2019/2/11.
//  Copyright © 2019年 dehui chen. All rights reserved.
//

import UIKit




class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    lazy var tableCellData: [[DetailItem]] = {
        var items1 = [DetailItem]()
        for index in 0..<5{
            let item1 = DetailItem()
            
            switch index{
            case 0:
                item1.title = "客户名称："
                item1.detail = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
                item1.line = 0
            case 1:
                item1.title = "配合老师："
                item1.detail = "XXXXXXXXXXXXXXXXXXXXXX"
                item1.line = 0
            case 2:
                item1.title = "时间："
                item1.detail = "XXXXXX"
                item1.line = 0
            case 3:
                item1.title = "申请人："
                item1.detail = "XXXXXXXXXXXXXXXXXXXXXX"
                item1.line = 0
            case 4:
                item1.title = "备注："
                item1.detail = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
                item1.line = 0
            default:
                print("")
            }
            items1.append(item1)
        }
        var items2 = [DetailItem]()
        for index in 0..<5{
            let item1 = DetailItem()
            
            switch index{
            case 0:
                item1.title = "客户名称客户名称："
                item1.detail = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
                item1.line = 1
            case 1:
                item1.title = "配合老师配合老师："
                item1.detail = "XXXXXXXXXXXXXXXXXXXXXX"
                item1.line = 1
            case 2:
                item1.title = "时间时间："
                item1.detail = "XXXXXX"
                item1.line = 1
            case 3:
                item1.title = "申请人申请人："
                item1.detail = "XXXXXXXXXXXXXXXXXXXXXX"
                item1.line = 1
            case 4:
                item1.title = "备注备注："
                item1.detail = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
                item1.line = 0
            default:
                print("")
            }
            items2.append(item1)
        }
        return [items1, items2]
    }()
    
    lazy var collectionCellData: [[DetailItem]] = {
        var items1 = [DetailItem]()
        for index in 0..<5{
            let item1 = DetailItem()
            
            switch index{
            case 0:
                item1.title = "客户名称："
                item1.detail = "XXXXX"
                item1.line = 0
            case 1:
                item1.title = "配合老师："
                item1.detail = "XXXXX"
                item1.line = 0
            case 2:
                item1.title = "时间时间时间："
                item1.detail = "XXXXXXXXXXXXX"
                item1.line = 0
            case 3:
                item1.title = "申请人："
                item1.detail = "人人人人人人人人人人人人人人人人人人人人人人人人人人人人人"
                item1.line = 0
            case 4:
                item1.title = "备注备注备注备注备注备注："
                item1.detail = "XXXXXXX"
                item1.line = 0
            default:
                print("")
            }
            items1.append(item1)
        }
        var items2 = [DetailItem]()
        for index in 0..<5{
            let item1 = DetailItem()
            
            switch index{
            case 0:
                item1.title = "客户名称："
                item1.detail = "XXXXX"
                item1.line = 1
            case 1:
                item1.title = "配合老师："
                item1.detail = "XXXXX"
                item1.line = 1
            case 2:
                item1.title = "时间时间时间："
                item1.detail = "XXXXXXXXXXXXX"
                item1.line = 1
            case 3:
                item1.title = "申请人："
                item1.detail = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
                item1.line = 1
            case 4:
                item1.title = "备注备注备注备注备注备注："
                item1.detail = "XXXXXXX"
                item1.line = 0
            default:
                print("")
            }
            items2.append(item1)
        }
        return [items1, items2]
    }()


    lazy var table: UITableView = {
        let table = UITableView.init(frame: CGRect.init(x: 0, y: KStatusBarH, width: KWidth, height: KHeight - KStatusBarH), style: .grouped)
        table.register(UINib.init(nibName: "MonMulLineTableTCell", bundle: nil), forCellReuseIdentifier: MonMulLineTableTCell.CellID)
        table.register(UINib.init(nibName: "MulItemCollectTCell", bundle: nil), forCellReuseIdentifier: MulItemCollectTCell.CellID)
        
        table.estimatedRowHeight = 136
        table.estimatedSectionFooterHeight = 0.0
        table.estimatedSectionHeaderHeight = 0.0
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: KIphoneXBottom, right: 0)
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0.01))
        table.tableFooterView = view
        table.tableHeaderView = view
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(table)
    }
    
    // MARK: - UITableView Delegate / DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: MonMulLineTableTCell.CellID, for: indexPath) as! MonMulLineTableTCell
            cell.hasDisclourse = true
            cell.isHideShadow = false
            cell.isbackColorClear = false
            cell.data = tableCellData[indexPath.row]
            cell.separatorInset = UIEdgeInsets.init(top: 0, left: (KWidth ) / 2, bottom: 0, right: (KWidth) / 2)
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: MulItemCollectTCell.CellID, for: indexPath) as! MulItemCollectTCell
            cell.data = collectionCellData[indexPath.row]
            cell.isShowShadow = true
            cell.separatorInset = UIEdgeInsets.init(top: 0, left: (KWidth ) / 2, bottom: 0, right: (KWidth) / 2)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: KWidth, height: 50))
        label.text = section == 0 ? "TableCell" : "CollectionCell"
        label.font = UIFont.init(name: kMedFont, size: 30)
        label.textAlignment = .center
        let view = UIView.init(frame: label.bounds)
        view.backgroundColor = RGBA(r: 0, g: 0, b: 0, a: 0.2)
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    
    
    

}

