//
//  UICollectionViewExtensions.swift
//  MACFit
//
//  Created by Can Baybunar on 30/06/2017.
//  Copyright © 2017 marsathletic. All rights reserved.
//

import UIKit

extension UICollectionView {

    func deque<C: UICollectionViewCell>(at indexPath: IndexPath) -> C {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: C.className, for: indexPath) as? C
        else { fatalError("could not deque cell with identifier \(C.className) from collectionview \(self)") }
        return cell
    }

    func registerNib(withIdentifier identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}
