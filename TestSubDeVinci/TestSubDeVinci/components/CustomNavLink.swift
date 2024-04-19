//
//  CustomButtons.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import SwiftUI

struct CustomNavRectangle : View {
    var str: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(LinearGradient(colors: [.blue, .purple, .blue], startPoint: .bottomLeading, endPoint: .topTrailing))
                .frame(width: 300, height: 40)
            Text(str).foregroundStyle(.white)
        }
    }
}

#Preview {
    CustomNavRectangle(str: "Action")
}
