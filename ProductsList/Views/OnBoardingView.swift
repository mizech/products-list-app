import SwiftUI

struct OnBoardingView: View {
    @AppStorage("doesNeedOnboarding") private var doesNeedOnboarding = true
    
    var body: some View {
        TabView {
            VStack {
                Text("Products-list app")
                    .font(.largeTitle)
                Text("Swipe left to see instructions")
                    .font(.subheadline)
                Image(.onboard)
                    .resizable()
                    .scaledToFill()
            }
            VStack(alignment: .leading, spacing: 25) {
                Text("How to use the app")
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
                        .fontWeight(.bold)
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
