//
//  SelectedItems.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/13/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class SelectedItems<T>: ObservableObject {
    @Published var items = [T]()

    func addItem(_ newItem: T) {
        items.append(newItem)
    }

    func removeItem(atIndex index: Int) {
        if items.count < index {
            items.remove(at: index)
        }
        else {
            print("Index was greater than \(items.count)!  Not Removing!\n")
        }
    }

    func removeAllItems() {
        items.removeAll()
    }
}
