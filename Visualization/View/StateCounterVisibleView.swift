import SwiftUI

struct StateCounterVisibleView: View {
    // MARK: - PROPERTIES
    @State private var counter: Int = 99
    
    init() {
        print(Self.self, #function)
    }
        
    // MARK: - BODY
    var body: some View {
        let _ = Self._printChanges()
        VStack(spacing: 20) {
            Text("Counter")
                .font(.largeTitle)
                .fontWeight(.medium)
            
            Text("\(counter)")
                .font(.system(size: 90))
                .fontWeight(.black)
            
            Button(action: {
                counter += 1
            }, label: {
                Text("Increase counter +1")
            })
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color.randomColor)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .navigationTitle("Reconstructing STATE View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW
#Preview("State counter visible") {
    StateCounterVisibleView()
}
