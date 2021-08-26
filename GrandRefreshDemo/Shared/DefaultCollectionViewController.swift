//
//  DefaultCollectionViewController.swift
//  GrandRefreshDemo
//
//  Created by Stan Hu on 2021/8/26.
//

import Foundation
import UIKit
import SwiftUI
class DefaultCollectionViewController:UIViewController,UICollectionViewDataSource{
    var collectionView:UICollectionView?
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        self.setUpCollectionView()
        
        self.collectionView?.g_addRefreshHeaderView {
            [weak self] in
            print("excute refreshBlock")
            self?.refresh()
        }
        
        self.collectionView?.g_addLoadMoreFooterView {
            [weak self] in
            print("excute loadMoreBlock")
            self?.loadMore()
        }
    }
    
    
    // MARK: Test
    func refresh() {
        perform(#selector(endRefresing), with: nil, afterDelay: 2)
    }
    
    @objc func endRefresing() {
        self.collectionView?.endRefreshing(isSuccess: true)
    }
    func loadMore() {
        perform(#selector(endLoadMore), with: nil, afterDelay: 2)
    }
    
    @objc func endLoadMore() {
        self.collectionView?.endLoadMore(isNoMoreData: true)
    }
    
    
    
    func setUpCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.dataSource = self
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    deinit{
          print("Deinit of DefaultCollectionViewController")
    }
}


struct DefaultScrollDemo:UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    typealias UIViewControllerType = DefaultCollectionViewController
    
    func makeUIViewController(context: Context) -> DefaultCollectionViewController {
        return DefaultCollectionViewController()
    }
}
