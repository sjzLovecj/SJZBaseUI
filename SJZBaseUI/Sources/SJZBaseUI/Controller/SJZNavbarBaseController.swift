//
//  SJZNavbarBaseController.swift
//  
//
//  Created by S JZ on 2023/5/6.
//

import UIKit
import SnapKit
import SwiftUI

open class SJZNavbarBaseController: SJZBaseController {
    
    lazy var leftBack: UIView = {
        let leftBack = hostingView {
            HStack {
                Image(systemName: "chevron.left")
//                    .foregroundColor(SJZBaseController.configureModel?.navigationConfig.leftBackColor)
//                    .font(Font.system(size: 18))
            }
        }
        leftBack.frame = CGRect(x: 0, y: 0, width: 30, height: 44)
        return leftBack
    }()
    
    // 隐藏自定义导航栏
    open var navigationBarViewHidden: Bool = true {
        didSet {
            navigationBarView.isHidden = navigationBarViewHidden
            if navigationBarViewHidden {
                navigationBarView.configuration.navBarHeight = 0
            }else {
                navigationBarView.configuration.navBarHeight = navigationBarHeight
            }
        }
    }
    
    // 自定义导航栏
    public lazy var navigationBarView: SJZNavBarView = SJZNavBarView(frame: .zero)
    
    public lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        navigationBarViewHidden = false
        
        addSubView()
        buildSubView(contentView: contentView)
    }
    
    public override func configureControllerModel() {
        super.configureControllerModel()
        guard let configureModel = SJZBaseController.configureModel else { return }
        navigationBarView.configuration = configureModel.navigationConfig
    }
    
    private func addSubView() {
        view.addSubview(navigationBarView)
        navigationBarView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(navigationBarView.configuration.navBarHeight)
        }
        
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(navigationBarView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    
    open func buildSubView(contentView superView: UIView) {
        
    }
}
