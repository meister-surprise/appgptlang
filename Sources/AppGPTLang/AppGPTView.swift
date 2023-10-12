import SwiftUI

@available(macOS 13, iOS 16, *)
public struct AppGPTView: View {
    
    @Binding public var code: String
    @State public var variable: Variable = ["x": "Hi"]
    
    public var body: some View {
        VStack {
            ForEach({ () -> [String] in
                var array = [String]()
                code.enumerateLines { line, _ in
                    if !line.isEmpty {
                        array.append(line.trim())
                    }
                }
                return array
            }(), id: \.self) { line in
                Component(code: line, variable: $variable)
            }
        }
        .padding(26)
        .onChange(of: code) { _ in
            variable = [:]
        }
    }
}
