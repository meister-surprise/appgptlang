import SwiftUI

public typealias Variable = [String: String]

@available(macOS 13, iOS 16, *)
struct Preview: View {

    @State var code: String = """
        Image("https://picsum.photos/500/300")
        Text($x, 50, red)
        Text(\"Seokho\", 30, label)
        Text(\"Hello, world!\", 15, label)
        Spacer()
        Button({var(x=\"Hello\");}, \"Hi\", red)
    """
    
    var body: some View {
        AppGPTView(code: $code)
    }
}

#Preview {
    Preview()
}
