import SwiftUI
import ComposableArchitecture

@main
struct TuistPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: ContentCore.State()) {
                    ContentCore()
                }
            )
        }
    }
}
