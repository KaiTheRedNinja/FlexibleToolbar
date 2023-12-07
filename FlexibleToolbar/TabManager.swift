//
//  TabManager.swift
//  FlexibleToolbar
//
//  Created by Kai Quan Tay on 7/12/23.
//

import Cocoa

class TabManager: ObservableObject {
    @Published private(set) var tabs: [Tab] = []
    @Published private(set) var currentTab: Tab.ID?

    func switchTo(tabID: Tab.ID) {
        guard tabs.contains(where: { $0.id == tabID }) else { return }
        currentTab = tabID
    }

    func create(tab: Tab, nextTo referenceTab: Tab.ID? = nil) {
        if let referenceTab,
           let refIndex = tabs.firstIndex(where: { $0.id == referenceTab }) {
            tabs.insert(tab, at: refIndex+1)
        } else {
            tabs.append(tab)
        }
    }

    func remove(tabID: Tab.ID) {
        // TODO: Remove tab
    }

    func move(tabs: Set<Tab.ID>, to index: Int) {
        // TODO: Move tab
    }
}

struct Tab: Identifiable, Hashable {
    var id: UUID = .init()

    var currentURL: URL?
    var title: String?
    var favicon: NSImage?
}
