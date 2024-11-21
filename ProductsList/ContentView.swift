import SwiftUI

struct ContentView: View {
    @AppStorage("doesNeedOnboarding") private var doesNeedOnboarding = true
    
    @State private var mainVM = MainViewModel()
    @State private var searchText: String = ""
    @State private var selectedProducts = [Product]()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(selectedProducts) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(product.name)
                                .font(.title2.bold())
                            Text(product.description)
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
            }.searchable(text: $searchText, prompt: "Search for devices")
                .textInputAutocapitalization(.never)
             .navigationTitle("Devices available")
             .listStyle(.plain)
             .background(
                LinearGradient(
                    colors: [
                        .lightGray,
                        .white
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
             )
             .onAppear() {
                 selectedProducts = mainVM.products
             }
             .onChange(of: searchText) {
                 selectedProducts = mainVM.products.filter {
                     guard searchText.isEmpty == false else {
                         return true
                     }
                     
                     let searchLC = searchText.lowercased()
                     let nameLC = $0.name.lowercased()
                     let brandLC = $0.brand.lowercased()
                     let descLC = $0.description.lowercased()
                     
                     return nameLC.contains(searchText) ||
                            brandLC.contains(searchLC) ||
                            descLC.contains(searchLC)
                 }
             }
             .sheet(isPresented: $doesNeedOnboarding) {
                 OnBoardingView()
             }
        }
    }
}

#Preview {
    ContentView()
}
