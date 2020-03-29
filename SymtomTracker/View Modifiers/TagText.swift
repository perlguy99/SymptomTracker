//
//  TagText.swift
//  SymtomTracker
//
//  Created by Brent Michalski on 3/29/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct TagText: ViewModifier {
    var bgColor: Color                  = Color.blue.opacity(0.5)
    var titleFont: Font                 = Font.caption
    var paddingLeadingTrailing: CGFloat = 5.0
    var paddingTopBottom: CGFloat       = 2.0
    
    func body(content: Content) -> some View {
        content
            .font(titleFont)
            .padding([.leading, .trailing], paddingLeadingTrailing)
            .padding([.top, .bottom], paddingTopBottom)
            .background(bgColor)
            .cornerRadius(.infinity)
    }
}

