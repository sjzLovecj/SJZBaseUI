//
//  SJZFirstLunch.swift
//  Demo
//
//  Created by S JZ on 2023/4/24.
//

import SwiftUI

public struct SJZFirstLunch {
    static public var shared: SJZFirstLunch = SJZFirstLunch()
    
    // 是否第一次打开App
    @AppStorage("isFirstLunch") public private(set) var isFirstLunch: Bool = true
    // 存储当前版本号
    @AppStorage("appVersion") public private(set) var appVersion: String = ""
    
    /// 获取App信息
    /// - Returns: 字典类型，App信息
    public func getInfoDict() -> [String : Any] {
        guard let infoDict = Bundle.main.infoDictionary else { return [:] }
        return infoDict
    }
    
    /// 获取版本号
    /// - Returns: 版本号
    public func getVersion() -> String {
        let infoDict = getInfoDict()
        guard let version = infoDict["CFBundleShortVersionString"] as? String, !version.isEmpty else { return "" }
        return version
    }
    
    /// 下载App后，第一次打开App，需要做的操作
    /// 一般为初始化整个App使用周期内，仅需要初始化一次的操作
    /// - Parameter complete: 闭包，所做操作
    public func firstLunch(complete: (_ isFirst: Bool) -> ()) {
        if isFirstLunch {
            isFirstLunch = false
            complete(true)
        }else{
            complete(false)
        }
    }
    
    /// 更新App后，第一次打开App需要做的操作
    /// 一般为每次升级App后，需要做的操作，例如：引导图，等
    /// - Parameter complete: 闭包，所做操作
    public func updateVersion(complete: (_ isUpdate: Bool) -> ()) {
        let version = getVersion()
        guard !version.isEmpty else { return }
        
        if version != appVersion {
            appVersion = version
            complete(true)
        }else {
            complete(false)
        }
    }
}
