//
//  MainContentView.swift
//  FlexibleToolbar
//
//  Created by Kai Quan Tay on 7/12/23.
//

import SwiftUI

struct MainContentView: View {
    @ObservedObject var tabManager: TabManager

    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .frame(minWidth: 550, minHeight: 225)
            VStack {
                ForEach(tabManager.tabs) { tab in
                    GroupBox {
                        VStack {
                            Text(tab.title ?? "Untitled Tab")
                            Text(tab.currentURL?.description ?? "about://blank")
                            if let favicon = tab.favicon {
                                Image(nsImage: favicon)
                            }
                        }
                    }
                }

                Button("+") {
                    tabManager.create(tab: .init(currentURL: URL(string: "https://www.google.com"), title: "Google"))
                }
            }
        }
    }
}
