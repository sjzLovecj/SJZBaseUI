//
//  SJZBaseController.swift
//  Demo
//
//  Created by S JZ on 2023/4/24.
//

import UIKit
import SwiftUI

open class SJZBaseController: UIViewController {
    // 设置全局更改变量
    static private var configureKey = "configureKey"
    static private var configureDict = ControllerConfigurType<SJZControllerConfigure>()
    static public var configureModel: SJZControllerConfigure? {
        get { SJZBaseController.configureDict[configureKey] }
        set { SJZBaseController.configureDict[configureKey] = newValue }
    }
    // 隐藏导航栏
    public var isHiddenSystemNav: Bool = true
    
    // MARK: - 设置状态栏文字颜色
    // 需要配合SJZNavigationController使用，childForStatusBarStyle返回顶部视图
    public var isStatusBarDark: Bool = true {
        didSet { setNeedsStatusBarAppearanceUpdate() }
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if isStatusBarDark { return .darkContent }
        return .lightContent
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        // 第一步首先配置 configureModel
        configureControllerModel()
        
        // 布局
//        buildSubView(contentView: view)
    }
    
    public func configureControllerModel() {
        guard let configureModel = SJZBaseController.configureModel else { return }
        view.backgroundColor = configureModel.backgroundColor
        isStatusBarDark = configureModel.isStatusBarDark
    }
    
}

// MARK: - 显示隐藏系统Nav
extension SJZBaseController {
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isHiddenSystemNav { navigationController?.setNavigationBarHidden(true, animated: animated) }
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isHiddenSystemNav, pushOrPopIsHidden() == false { navigationController?.setNavigationBarHidden(false, animated: animated) }
    }
    
    private func pushOrPopIsHidden() -> Bool {
        if let viewControllers = navigationController?.viewControllers, !viewControllers.isEmpty {
            if let vc = viewControllers[viewControllers.count - 1] as? SJZBaseController { return vc.isHiddenSystemNav }
            return false
        }
        return false
    }
}

extension SJZBaseController {
    public func hostingController<Content: View>(content: () -> Content) -> UIViewController {
        let controller = SJZHostingController(rootView:
            content().ignoresSafeArea()
        )
        controller.view.backgroundColor = .clear
        addChildVC(controller)
        return controller
    }
    
    public func hostingView<Content: View>(content: () -> Content) -> UIView {
        let controller = SJZHostingController(rootView:
            content().ignoresSafeArea()
        )

        addChildVC(controller)
        controller.view.backgroundColor = .clear
        return controller.view
    }
    
    /// 添加子控制器
    /// - Parameter childVC: 子控制器
    public func addChildVC(_ childVC: UIViewController) {
        addChild(childVC)
        childVC.didMove(toParent: self)
    }
    
    /// 删除子控制器
    /// - Parameter childVC: 子控制器
    public func removeChildVC(_ childVC: UIViewController) {
        childVC.willMove(toParent: self)
        childVC.removeFromParent()
    }
}



