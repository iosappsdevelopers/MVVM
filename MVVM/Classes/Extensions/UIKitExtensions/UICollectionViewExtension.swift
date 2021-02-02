//
//  UICollectionViewExtension.swift
//  Action
//
//  Created by pham.minh.tien on 4/30/20.
//

import UIKit
import RxSwift

extension UICollectionView {
    open func register<T>(collectionViewCell: T.Type) where T: BaseCollectionCell {
        register(T.nib, forCellWithReuseIdentifier: T.identifier)
    }
    
    open func register<T>(headerType: T.Type) where T: BaseHeaderCollectionView {
        register(T.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier)
    }
    
    open func register<T>(footerType: T.Type) where T: BaseHeaderCollectionView {
        register(T.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.identifier)
    }
}

extension UITableView {
    open func register<T>(cellType: T.Type) where T: BaseTableCell {
        register(T.nib, forCellReuseIdentifier: T.identifier)
    }
    
    open func register<T>(headerType: T.Type) where T: BaseHeaderTableView {
        register(T.nib, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    open func register<T>(footerType: T.Type) where T: BaseHeaderTableView {
        register(T.nib, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
}
