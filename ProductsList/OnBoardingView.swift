import SwiftUI

struct OnBoardingView: View {
    @AppStorage("doesNeedOnboarding") private var doesNeedOnboarding = true
    
    var body: some View {
        VStack {
            Text("Product-List App")
                .font(.largeTitle)
            Text("How to use")
                .font(.title)
            Button("Okay. I got it.") {
                doesNeedOnboarding.toggle()
            }
        }.interactiveDismissDisabled(true)
    }
}

#Preview {
    OnBoardingView()
}
