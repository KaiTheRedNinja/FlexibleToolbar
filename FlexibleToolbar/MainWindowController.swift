//
//  MainWindowController.swift
//  FlexibleToolbar
//
//  Created by Kai Quan Tay on 6/12/23.
//

import Cocoa
import SwiftUI

class MainWindowController: NSWindowController {
    var tabManager: TabManager = .init()

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.

        guard let contentViewController else { fatalError("NOT FOUND") }
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentViewController.view = NSHostingView(rootView: MainContentView(tabManager: self.tabManager))

        setupToolbar()
    }

    func setupToolbar() {
        let toolbar = NSToolbar()

        toolbar.delegate = self

        self.window?.titleVisibility = .hidden

        self.window?.toolbar = toolbar
    }
}

extension MainWindowController: NSToolbarDelegate {
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        if itemIdentifier == .flexItem {
            let view = NSHostingView(rootView: TabBarView(tabManager: tabManager))
            view.translatesAutoresizingMaskIntoConstraints = false
            view.autoresizingMask = [.width, .height]

            let item = FTToolbrItem(itemIdentifier: .flexItem)
            item.view = view
            item.visibilityPriority = .high

            item.minSize = CGSize(width: 330, height: 20)
            item.maxSize = CGSize(width: 20000, height: 20)

            return item
        } else {
            return NSToolbarItem(itemIdentifier: itemIdentifier)
        }
    }

    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [
            .print,
            .flexibleSpace,
            .cloudSharing,
            .flexItem,
            .space,
            .showFonts,
            .flexibleSpace,
            .showColors
        ]
    }

    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        toolbarAllowedItemIdentifiers(toolbar)
    }
}

class FTToolbrItem: NSToolbarItem {
    override var minSize: NSSize {
        get { _minSize }
        set { _minSize = newValue }
    }
    override var maxSize: NSSize {
        get { _maxSize }
        set { _maxSize = newValue }
    }

    var _minSize: NSSize = .zero
    var _maxSize: NSSize = .zero
}

extension NSToolbarItem.Identifier {
    static var flexItem: NSToolbarItem.Identifier = .init(rawValue: "flexItem")
}
