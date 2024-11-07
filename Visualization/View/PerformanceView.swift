import SwiftUI

@Observable
final class SecondObservableViewModel {
    var counter: Int = 99 {
        didSet {
            print(counter)
        }
    }
    
    var values: [Int] = [Int](1...5_000_000)
}

struct PerformanceView: View {
    var viewModel: SecondObservableViewModel
    
    init(viewModel: SecondObservableViewModel) {
        self.viewModel = viewModel
        print(Self.self, #function)
//        POD stand for Plain Old Data (Value type)
//        print("Is POD (\(Self.self)): \(_isPOD(Self.self))")
//        print("Is POD (\(String.self)): \(_isPOD(String.self))")
//        print("Is POD (\(Int.self)): \(_isPOD(Int.self))")
    }
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack(spacing: 20) {
            List {
                ForEach(viewModel.values, id: \.self) {
                    Text(String($0))
                        .padding()
                        .background(Color.randomColor)
                }
            }
            .listStyle(.plain)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            
//            ContentListView(values: viewModel.values)
            
            Text("Counter")
                .font(.largeTitle)
                .fontWeight(.medium)
            
            Text("\(viewModel.counter)")
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

// MARK: - Inside Types
extension PerformanceView {
    
    struct ContentListView: View, Equatable {

        let values: [Int]
        
        init(values: [Int]) {
            self.values = values
            print(Self.self, #function)
//            print("Is POD \(Self.self): \(_isPOD(Self.self))")
        }
        
        var body: some View {
            let _ = Self._printChanges()
            
            List {
                ForEach(values, id: \.self) {
                    Text(String($0))
                        .padding()
                        .background(Color.randomColor)
                }
            }
            .listStyle(.plain)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
        }
    }
}

#Preview {
    PerformanceView(viewModel: SecondObservableViewModel())
}
