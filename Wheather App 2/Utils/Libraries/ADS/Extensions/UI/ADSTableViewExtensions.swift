//
//  UITableViewExtensions.swift
//  MACFit
//
//  Created by Zafer Caliskan on 15/06/2017.
//  Copyright © 2017 marsathletic. All rights reserved.
//

import UIKit

extension UITableView {

    func deque<C: UITableViewCell>() -> C {
        guard let cell = self.dequeueReusableCell(withIdentifier: C.className) as? C
        else { fatalError("could not deque cell with identifier \(C.className) from tableView \(self)") }
        return cell
    }

    func deque<C: UITableViewCell>(at indexPath: IndexPath) -> C {
        guard let cell = self.dequeueReusableCell(withIdentifier: C.className, for: indexPath) as? C
        else { fatalError("could not deque cell with identifier \(C.className) from tableView \(self)") }
        return cell
    }

    func registerNib(withIdentifier identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }

//    func dequeFormCell(_ cellObject: ADSFormCellObject, indexPath: IndexPath) -> ADSFormCell {
//        guard let cell = self.dequeueReusableCell(withIdentifier: cellObject.cellType.rawValue, for: indexPath) as? ADSFormCell
//        else { fatalError("could not deque cell with identifier \(cellObject.cellType.rawValue) from tableView \(self)") }
//        cell.set(cellObject: cellObject)
//
//        return cell
//    }
//
//    func dequeFeedCell(_ cellObject: ADSFeedCellObject, indexPath: IndexPath) -> ADSFeedCell {
//        guard let cell = self.dequeueReusableCell(withIdentifier: cellObject.cellType.rawValue, for: indexPath) as? ADSFeedCell
//        else { fatalError("could not deque cell with identifier \(cellObject.cellType.rawValue) from tableView \(self)") }
//        cell.set(cellObject: cellObject)
//
//        return cell
//    }
}
