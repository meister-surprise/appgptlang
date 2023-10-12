import SwiftUI

@available(macOS 13, iOS 16, *)
public struct ButtonComponent: View {
    
    @Binding public var variable: Variable
    public let action: [String]
    public let text: String
    public let color: Color
    
    public init(_ modifiers: [String], variable: Binding<Variable>) {
        self._variable = variable
        self.action = modifiers[0].cut().components(separatedBy: ";")
        self.text = String(modifiers[1].trim())
        self.color = modifiers[2].trim().getColor()
    }
    
    public var body: some View {
        Button {
            action.forEach {
                if !$0.isEmpty {
                    let cmd = $0.splitOpcode()
                    switch cmd.0 {
                    case "var":
                        let split = cmd.1.components(separatedBy: "=")
                        variable[split[0]] = split.last!
                    case "open":
                        print("Open")
                    default:
                        break
                    }
                }
            }
        } label: {
            Text(text)
                .foregroundStyle({ () -> Color in
                    var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0
                    guard UIColor(color)
                        .getRed(&red, green: &green, blue: &blue, alpha: nil) else {
                        return .white
                    }
                    let lum = 0.2126 * red + 0.7152 * green + 0.0722 * blue
                    return lum < 0.5 ? .white : .black
                }())
                .font(.system(size: 20, weight: .bold))
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
                .background(color)
                .clipShape(Capsule())
        }
    }
}
