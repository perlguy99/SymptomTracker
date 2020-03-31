//
//  Trigger+MultiSelectable.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/31/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import Foundation

extension Trigger: MultiSelectable {
    var title: String {
        get {
            return wrappedName
        }
    }
}
