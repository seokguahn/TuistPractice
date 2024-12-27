//
//  ContentCOre.swift
//  TuistPractice
//
//  Created by iOS_Hwik on 12/5/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ContentCore {
    @ObservableState
    struct State {
        var count = 0
    }
    
    enum Action {
        case decrementBtnTapped
        case incrementBtnTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementBtnTapped:
                state.count -= 1
                return .none
            case .incrementBtnTapped:
                state.count += 1
                return .none
            }
        }
    }
}
