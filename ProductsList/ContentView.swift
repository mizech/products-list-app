import SwiftUI

struct ContentView: View {
    @State private var mainVM = MainViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! \(mainVM.products.count)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
