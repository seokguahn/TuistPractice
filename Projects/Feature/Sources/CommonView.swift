//
//  CommonView.swift
//  TuistUI
//
//  Created by iOS_Hwik on 12/2/24.
//

import SwiftUI

public struct CommonView: View {
    @Binding var isTapped: Bool
    
    public init(isTapped: Binding<Bool>) {
        self._isTapped = isTapped
    }
    
    public var body: some View {
        Button(action: {
            print("Delete Tapped!")
            isTapped = true
        }) {
            HStack {
                Image(systemName: "arrowshape.right.circle")
                    .font(.title3)
                Text("Next Page")
                    .fontWeight(.semibold)
                    .font(.title3)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CommonView(isTapped: .constant(false))
}
