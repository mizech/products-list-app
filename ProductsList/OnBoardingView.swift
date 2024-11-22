import SwiftUI

struct OnBoardingView: View {
    @AppStorage("doesNeedOnboarding") private var doesNeedOnboarding = true
    
    var body: some View {
        TabView {
            VStack {
                Text("Products-List App")
                    .font(.largeTitle)
                
            }
            VStack(alignment: .leading, spacing: 25) {
                Text("How to use it")
                    .font(.title)
                Text("Use the list-screen for scrolling over the existing products.")
                    .font(.headline)
                Text("Use the Add-button (+) for adding further products.")
                    .font(.headline)
                Text("Use a left-swipe to remove existing products.")
                    .font(.headline)
                Text("Tap on a single product in the list to read/update product-details")
                    .font(.headline)
                Spacer()
                Button {
                    doesNeedOnboarding.toggle()
                } label: {
                    Text("Okay. I got it. Let's go!")
                        .padding()
                         .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                Spacer()
            }
        }.interactiveDismissDisabled(true)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .padding()
    }
}

#Preview {
    OnBoardingView()
}
