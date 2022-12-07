//
//  AuthTextFieldView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

struct AuthTextFieldView: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> Void = { _ in }
    var commit: () -> Void = {}
    var isSecure: Bool = false

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        } // ZStack
    } // View
}

struct AuthTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextFieldView(placeholder: Text(""), text: .constant(""))
    }
}
