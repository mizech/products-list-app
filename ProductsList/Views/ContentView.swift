import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("doesNeedOnboarding") private var doesNeedOnboarding = true
    @Environment(\.modelContext) private var modelContext
    @Query private var products: [Product]
    
    @State private var searchText: String = ""
    @State private var selectedProducts = [Product]()
    @State private var isAddSheetShown = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(products) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(product.name)
                                .font(.title2.bold())
                            Text(product.desc)
                                .lineLimit(2)
                            HStack {
                                Text(product.basePrice, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                                    .fontWeight(.bold)
                                Spacer()
                                Text("\(product.inStock ? "In Stock" : "Out of Stock")")
                            }
                        }
                    }
                }
            }
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
