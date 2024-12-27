//
//  ListView.swift
//  TuistPractice
//
//  Created by iOS_Hwik on 12/5/24.
//

import SwiftUI
import ComposableArchitecture

struct ListView: View {
    let store: StoreOf<ListCore>
    
    var body: some View {
        List(store.users) { user in
            VStack {
                Text(user.login)
                    .font(.title3)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .onTapGesture {
                print(user.login)
            }
        }
        .padding(.top, 1)
        .onAppear() {
            store.send(.factRequest)
        }
    }
}

#Preview {
    ListView(
        store: Store(initialState: ListCore.State()) {
            ListCore()
        }
    )
}
