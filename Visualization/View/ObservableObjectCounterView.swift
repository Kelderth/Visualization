import SwiftUI

class ObservableObjectViewModel: ObservableObject {
    @Published var counter: Int = 99
}

struct ObservableObjectCounterView: View {
    @StateObject private var viewModel: ObservableObjectViewModel = ObservableObjectViewModel()
    
    init() {
        print(Self.self, #function)
    }
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack(spacing: 20) {
            Text("Counter")
                .font(.largeTitle)
                .fontWeight(.medium)
            
//            Text("\(viewModel.counter)")
                .font(.system(size: 90))
                .fontWeight(.black)
            
            Button(action: {
                viewModel.counter += 1
//                print(viewModel.counter)
            }, label: {
                Text("Increase counter +1")
            })
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color.randomColor)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .navigationTitle("Observable Object View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ObservableObjectCounterView()
}
