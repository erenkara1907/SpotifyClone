//
//  SecureTextFieldView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

struct SecureTextFieldView: View {
    var placeholder: Text
    @Binding private var text: String
    @State private var isSecured: Bool = true

    init(text: Binding<String>, placeholder: Text) {
        _text = text
        self.placeholder = placeholder
    }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            ZStack(alignment: .trailing) {
                Group {
                    if isSecured {
                        SecureField("", text: $text)
                    } else {
                        TextField("", text: $text)
                    }
                } // Group
                .padding(.trailing, 32)

                Button(action: {
                    isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(.gray)
                } // Button
            } // ZStack
        } // ZStack
    } // View
}

struct SecureTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextFieldView(text: .constant(""), placeholder: Text(""))
    }
}
