//
//  TableViewExtension.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import UIKit

extension UITableViewCell {
    public class func defaultIdentifier() -> String {
        return "\(self)"
    }
}

extension UITableViewHeaderFooterView {
    public class func defaultIdentifier() -> String {
        return "\(self)"
    }
}

// Cells
extension UITableView {
    public func register<T: UITableViewCell>(cellClass `class`: T.Type) {
        register(`class`, forCellReuseIdentifier: `class`.defaultIdentifier())
    }
    
    public func registerNib<T: UITableViewCell>(forClass classType: T.Type) {
        let classString = classType.defaultIdentifier()
        let nib = UINib(nibName: classString, bundle: nil)
        register(nib, forCellReuseIdentifier: classString)
    }
}

// Header / Footer
extension UITableView {
    public func registerNib<T: UITableViewHeaderFooterView>(forClass classType: T.Type) {
        let classString = classType.defaultIdentifier()
        let nib = UINib(nibName: classString, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: classString)
    }
}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(withClass classType: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: classType.defaultIdentifier()) as? T
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withClass classType: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: classType.defaultIdentifier(), for: indexPath) as? T else {
            fatalError("Error: cell with identifier: \(classType.defaultIdentifier()) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    func dequeueResuableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass classType: T.Type) -> T? {
        return dequeueReusableHeaderFooterView(withIdentifier: classType.defaultIdentifier()) as? T
    }
}
