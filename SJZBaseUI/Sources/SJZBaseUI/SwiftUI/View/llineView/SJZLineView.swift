//
//  SJZLineView.swift
//  
//
//  Created by S JZ on 2023/5/9.
//

import SwiftUI

struct SJZLineView: ViewModifier {
    
    var isShowLine: Bool = true
    var lineHeight: CGFloat = 0.5
    var lineColor: Color? = nil
    var paddingEdges: Edge.Set? = nil
    var paddingLength: CGFloat? = nil
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            
            if isShowLine {
                if let paddingEdges {
                    Divider()
                        .frame(height: lineHeight)
                        .padding(paddingEdges, paddingLength)
                        .foregroundColor(lineColor)
                }else {
                    Divider()
                        .frame(height: lineHeight)
                        .foregroundColor(lineColor)
                }
            }
        }
    }
}

public extension View {
    func lineView(isShowLine: Bool = true, lineHeight: CGFloat = 0.5, lineColor: Color? = nil, paddingEdges: Edge.Set? = nil, paddingLength: CGFloat? = nil) -> some View {
        self.modifier(SJZLineView(isShowLine: isShowLine, lineHeight: lineHeight, lineColor: lineColor, paddingEdges: paddingEdges, paddingLength: paddingLength))
    }
}
