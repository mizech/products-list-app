import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("doesNeedOnboarding") private var doesNeedOnboarding = true

    @State private var searchText: String = ""
    @State private var selectedProducts = [Product]()
    @State private var isAddSheetShown = false
    
    var body: some View {
        NavigationStack {
            ProductsListView(searchText: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        isAddSheetShown.toggle()
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for products")
                .textInputAutocapitalization(.never)
             .navigationTitle("Products available")
             .listStyle(.plain)
             .onChange(of: searchText) {}
             .sheet(isPresented: $doesNeedOnboarding) {
                 OnBoardingView()
             }
             .sheet(isPresented: $isAddSheetShown) {
                 AddProductView()
             }
        }
    }
}

#Preview {
    ContentView()
}
