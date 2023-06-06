//
//  SJZHostingController.swift
//  Demo
//
//  Created by S JZ on 2023/4/26.
//

import UIKit
import SwiftUI

open class SJZHostingController<Content>: UIHostingController<AnyView> where Content: View {

    public var didLoad: (() -> ())?
    public var willAppear: (() -> ())?
    public var didAppear: (() -> ())?
    public var willDisAppear: (() -> ())?
    public var disAppear: (() -> ())?
    
    public init(rootView: Content) {
        super.init(rootView: AnyView(rootView))
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.didLoad?()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        self.willAppear?()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.didAppear?()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.willDisAppear?()
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.disAppear?()
    }
    
    
    @MainActor required dynamic public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
