import SwiftUI

@available(macOS 13, iOS 16, *)
public struct AppGPTView: View {
    
    @Binding public var code: String
    @State public var variable: Variable = ["x": "Hi"]
    
    public init(code: Binding<String>) {
        self._code = code
    }
    
    public var body: some View {
        VStack {
            if code.trim().isEmpty {
                Text("코드가 비었습니다.")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(Color(.label))
                    .frame(maxHeight: .infinity)
            } else {
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
        }
        .padding(26)
        .onChange(of: code) { _ in
            variable = [:]
        }
    }
}
