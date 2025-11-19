import SwiftUI
import Shared

struct ContentView: View {

   @ObservedObject private(set) var viewModel: ViewModel

   let phrases = Greeting().greet()

   var body: some View {
       ListView(phrases: viewModel.greetings)
            .task { await self.viewModel.startObserving() }
   }
}

extension ContentView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var greetings: Array<String> = []

        func startObserving() {

        }
    }
}

struct ListView: View {
    let phrases: Array<String>

    var body: some View {
        List(phrases, id: \.self) {
            Text($0)
        }
    }
}