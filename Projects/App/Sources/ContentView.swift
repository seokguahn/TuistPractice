import SwiftUI
import CommonUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<ContentCore>
    @State private var isTapped: Bool = false
    
    var body: some View {
        WithPerceptionTracking {
            NavigationStack {
                TabView {
                    VStack {
                        Text("Hello, World!")
                            .padding()
                        
                        CommonView(isTapped: $isTapped)
                    }
                    .tabItem {
                        Label("Home", systemImage: "flame")
                    }
                    
                    VStack {
                        VStack {
                            Text("Counter Count : \(store.count)")
                                .fontWeight(.semibold)
                            
                            HStack {
                                Button(action: {
                                    store.send(.decrementBtnTapped)
                                }) {
                                    HStack {
                                        Text("-")
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 5)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(20)
                                }
                                
                                Button(action: {
                                    store.send(.incrementBtnTapped)
                                }) {
                                    HStack {
                                        Text("+")
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 5)
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                                }
                            }
                        }
                    }
                    .tabItem {
                        Label("Counter", systemImage: "drop")
                    }
                }
                .navigationDestination(isPresented: $isTapped) {
                    ListView(
                        store: Store(initialState: ListCore.State()) {
                            ListCore()
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView(
        store: Store(initialState: ContentCore.State()) {
            ContentCore()
        }
    )
}
