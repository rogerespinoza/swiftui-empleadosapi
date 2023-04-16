//
//  RefreshButton.swift
//  EmpleadosAPI
//
//  Created by Roger Espinoza on 12/4/23.
//

import SwiftUI

struct RefreshButton: View {
    @Environment(\.refresh) private var refresh

    var body: some View {
        Button {
            Task { await refresh?() }
        } label: {
            Image(systemName: "arrow.clockwise")
        }
        .disabled(refresh == nil)
    }
}
