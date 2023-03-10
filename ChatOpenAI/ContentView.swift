
import SwiftUI

struct ContentView: View {

  @State private var searchText = ""
  @State private var answerText = ""
  
  var body: some View {
    NavigationStack {
      List {
        VStack {
          TextField("Ask everything...", text: $searchText)
            .onSubmit {
              handleAnswer()
            }
            .padding(.all)
          Text("Chatbot says: ")
          .italic()
          .foregroundColor(.cyan)
          Label("\(answerText)", systemImage: "")
            .labelStyle(.titleOnly)
          Spacer()
        }
        .padding()
      }
      .navigationTitle("Test OpenAI")
    }
  }
  
  private func handleAnswer() {
    APICaller.shared.getResponse(input: searchText) { result in
      switch result {
      case .success(let output):
        answerText = output
      case .failure:
        print("Failure")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
