import SwiftUI

@available(macOS 13, iOS 16, *)
public struct TextComponent: View {
    
    @Binding public var variable: Variable
    public let text: String
    public let size: CGFloat
    public let color: Color
    
    public init(_ modifiers: [String], variable: Binding<Variable>) {
        self._variable = variable
        if modifiers[0].starts(with: "$") {
            let key = String(modifiers[0].dropFirst())
            self.text = variable[key].wrappedValue ?? "설정되지 않음"
        } else {
            self.text = String(modifiers[0])
        }
        self.size = Double(modifiers[1].trim())!
        self.color = modifiers[2].trim().getColor()
    }
    
    public var body: some View {
        Text(text)
            .font(.system(size: size))
            .foregroundStyle(color)
    }
}
