//
//  CText.swift
//  
//
//  Created by Can Yoldas on 29/04/2023.
//

import SwiftUI

public struct CText: View {

    let text: Text

    public init(text: Text) {
        self.text = text
    }

    public init(verbatim: String) {
        self.text = Text(verbatim: verbatim)
    }

    public var body: some View {
        text
    }
}

#if DEBUG
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CText(text: Text("Hello world"))
    }
}
#endif
