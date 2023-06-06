//
//  SJZNavigationController.swift
//  Demo
//
//  Created by S JZ on 2023/4/24.
//

import UIKit

open class SJZNavigationController: UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - 
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
