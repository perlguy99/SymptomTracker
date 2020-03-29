//
//  Severity+Enum.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/25/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import Foundation

@objc enum Severity: UInt16, CaseIterable {
    case low = 0
    case moderate
    case severe
}

func severityString(forSeverity severity: Severity) -> String {
    switch severity {
    case .low:
        return "Low"
    case .moderate:
        return "Moderate"
    case .severe:
        return "Severe"
    }
}
