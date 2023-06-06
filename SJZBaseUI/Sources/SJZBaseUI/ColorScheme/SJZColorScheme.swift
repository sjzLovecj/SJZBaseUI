//
//  SJZColorScheme.swift
//  Demo
//
//  Created by S JZ on 2023/4/24.
//

import SwiftUI

public enum SJZColorSchemeType: Int {
    case system
    case light
    case dark
}

public struct SJZColorScheme {
    static public let shared: SJZColorScheme = SJZColorScheme()
    
    @AppStorage("colorSchemeType") public private(set) var colorSchemeType: SJZColorSchemeType = .system
    
    public func changeColorScheme(_ colorSchemeType: SJZColorSchemeType) {
        guard self.colorSchemeType != colorSchemeType else { return }
        self.colorSchemeType = colorSchemeType
        
        let windowScenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
        windowScenes.forEach { windowScene in
            windowScene.windows.forEach { window in
                if colorSchemeType == .system {
                    window.overrideUserInterfaceStyle = .unspecified
                }else if colorSchemeType == .light {
                    window.overrideUserInterfaceStyle = .light
                }else if colorSchemeType == .dark {
                    window.overrideUserInterfaceStyle = .dark
                }
            }
        }
    }
}
