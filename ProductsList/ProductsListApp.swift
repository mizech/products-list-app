import SwiftUI
import SwiftData

@main
struct ProductsListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [Product.self])
    }
}
