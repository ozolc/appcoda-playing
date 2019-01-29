//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by NosovML on 29/01/2019.
//  Copyright © 2019 NosovML. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
