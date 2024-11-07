import SwiftUI

@Observable
final class ObservableViewModel {
    var counter: Int = 99 {
        didSet {
            print(counter)
        }
    }
}

struct ObservableCounterView: View {
    var viewModel: ObservableViewModel
    
    init(viewModel: ObservableViewModel) {
        self.viewModel = viewModel
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
            }, label: {
                Text("Increase counter +1")
            })
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .background(Color.randomColor)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding()
        .navigationTitle("Observable Object View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ObservableCounterView(viewModel: ObservableViewModel())
}
