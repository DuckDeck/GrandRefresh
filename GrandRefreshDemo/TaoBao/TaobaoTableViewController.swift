//
//  TaobaoTableViewController.swift
//  PullToRefreshKit
//
//  Created by luoyang on 2016/12/8.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
class TaobaoTableViewController:BaseTableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup
        //        self.tableView.backgroundColor = UIColor(red: 232.0/255.0, green: 234.0/255.0, blue: 235.0/255.0, alpha: 1.0)
        let qqHeader = TaoBaoRefreshHeader()
        self.tableView.g_addRefreshHeaderView(refreshHeader: qqHeader) {
            [weak self] in
            print("excute refreshBlock")
            self?.refresh()
        }
        self.tableView.triggerRefreshing()
    }
    
    
    func refresh() {
        perform(#selector(endRefresing), with: nil, afterDelay: 3)
    }
    
    @objc func endRefresing() {
        self.tableView.endRefreshing(isSuccess: true)
    }
}
struct TaoBaoRefreshDemo:UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    typealias UIViewControllerType = TaobaoTableViewController
    
    func makeUIViewController(context: Context) -> TaobaoTableViewController {
        return TaobaoTableViewController()
    }
}
