//
//  WechatRefreshHeaderTestVC.swift
//  GTMRefreshExample
//
//  Created by 骆扬 on 2020/1/2.
//  Copyright © 2020 luoyang. All rights reserved.
//

import UIKit
import SwiftUI
class WechatRefreshHeaderTestVC: BaseTableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup
        let wechatHeader = WechatRefreshHeader()
        self.tableView.g_addRefreshHeaderView(refreshHeader: wechatHeader) {
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

struct WechatRefreshDemo:UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    typealias UIViewControllerType = WechatRefreshHeaderTestVC
    
    func makeUIViewController(context: Context) -> WechatRefreshHeaderTestVC {
        return WechatRefreshHeaderTestVC()
    }
}

