//
//  TabBarView.swift
//  FlexibleToolbar
//
//  Created by Kai Quan Tay on 6/12/23.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var tabManager: TabManager

    var body: some View {
        Color.red
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .overlay {
                Text("\(tabManager.tabs.count)")
            }
    }
}

//#Preview {
//    TabBarView()
//}
