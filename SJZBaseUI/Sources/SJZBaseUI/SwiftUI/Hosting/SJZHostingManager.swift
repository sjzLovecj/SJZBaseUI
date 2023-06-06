//
//  SJZHostingManager.swift
//  Demo
//
//  Created by S JZ on 2023/4/25.
//

import UIKit
import SwiftUI

open class SJZHostingManager: NSObject {
    
    public static func getHostingController<Content: View>(content: () -> Content) -> UIViewController {
        let controller = SJZHostingController(rootView:
            content().ignoresSafeArea()
        )
        controller.view.backgroundColor = .clear
        return controller
    }
    
    public static func getHostingView<Content: View>(content: () -> Content) -> UIView {
        let controller = SJZHostingController(rootView:
            content().ignoresSafeArea()
        )
        controller.view.backgroundColor = .clear
        return controller.view
    }
}
