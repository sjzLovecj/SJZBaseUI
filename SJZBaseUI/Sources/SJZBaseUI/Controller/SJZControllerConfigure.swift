//
//  SJZControllerConfigure.swift
//  Demo
//
//  Created by S JZ on 2023/4/24.
//

import UIKit

public typealias ControllerConfigurType<T> = [String : T]
open class SJZControllerConfigure: NSObject {
    // 背景颜色，默认为白色
    open var backgroundColor: UIColor = UIColor.white
    // 状态栏颜色，默认为黑色
    open var isStatusBarDark: Bool = true
    // 用于设置统一导航View
    open var navigationConfig: SJZNavBarConfig = SJZNavBarConfig()
}
