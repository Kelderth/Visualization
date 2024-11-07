import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: StateCounterVisibleView()) {
                    Text("State 1")
                        .font(.title2)
                        .fontWeight(.heavy)
                }
                
                NavigationLink {
                    StateCounterInvisibleView()
                } label: {
                    Text("State 2")
                        .font(.title2)
                        .fontWeight(.heavy)
                }
                
                NavigationLink {
                    ObservableObjectCounterView()
                } label: {
                    Text("ObservableObject")
                        .font(.title2)
                        .fontWeight(.heavy)
                }

                NavigationLink {
                    ObservableCounterView(viewModel: ObservableViewModel())
                } label: {
                    Text("Observable")
                        .font(.title2)
                        .fontWeight(.heavy)
                }

                Spacer()
                NavigationLink {
                    PerformanceView(viewModel: SecondObservableViewModel())
                } label: {
                    Text("Performance")
                        .font(.title2)
                        .fontWeight(.heavy)
                }
            }
            .navigationTitle("Visualization")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
