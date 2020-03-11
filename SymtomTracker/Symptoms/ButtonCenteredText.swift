//
//  ButtonCenteredText.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/11/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct ButtonCenteredText: View {
    var title: String
    var icon: Image?
    var handler: () -> Void
    
    var body: some View {
        Button(action: self.handler) {
            HStack {
                Spacer()
                icon
                Text(title)
                Spacer()
            }
        }
    }
}

