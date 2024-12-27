//
//  ListCore.swift
//  TuistPractice
//
//  Created by iOS_Hwik on 12/5/24.
//

import Foundation
import ComposableArchitecture

struct UserList: Codable, Identifiable {
    let login: String
    let id: Int
    let node_id: String
}

@DependencyClient
struct FactClient {
    // @Sendable 동시성 보장 annotaion
    var fetch: @Sendable () async throws -> [UserList]
    var name: String = ""
    
    mutating func setName(_ name: String) {
        self.name = name
    }
}

extension DependencyValues {
    var factClient: FactClient {
        get { self[FactClient.self] }
        set { self[FactClient.self] = newValue }
    }
}

extension FactClient: DependencyKey {
    static let liveValue = FactClient(fetch: { () in
        try await Task.sleep(for: .seconds(1))
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.github.com/users")!)
        return try JSONDecoder().decode([UserList].self, from: data)
    })
}

@Reducer
struct ListCore {
    @ObservableState
    struct State {
        var users: [UserList] = []
    }
    
    enum Action {
        case factRequest
        case factResponse([UserList])
    }
    
    @Dependency(\.factClient) var factClient
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .factRequest:
//                return .run { send in
//                    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.github.com/users")!)
//                    let userList = try JSONDecoder().decode([UserList].self, from: data)
//                    await send(.factResponse(userList))
//                }
                return .run { send in
                    await send(.factResponse(try await self.factClient.fetch()))
                }
            case let .factResponse(users):
                state.users = users
                return .none
            }
        }
    }
}
