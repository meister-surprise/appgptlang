import SwiftUI

@available(macOS 13, iOS 16, *)
public struct Component: View {
    
    @Binding public var variable: Variable
    public let type: ComponentType
    public let modifiers: [String]
    
    public init(code: String, variable: Binding<Variable>) {
        self._variable = variable
        let cmd = code.splitOpcode()
        self.type = ComponentType(rawValue: cmd.0)!
        let drop = String(cmd.1)
        self.modifiers = drop.quoteAwareSplit()
    }
    
    public var body: some View {
        Group {
            switch type {
            case .button:
                ButtonComponent(modifiers, variable: $variable)
            case .text:
                TextComponent(modifiers, variable: $variable)
            case .image:
                ImageComponent(modifiers)
            case .spacer:
                Spacer()
            }
        }
    }

    public enum ComponentType: String {
        case button = "Button"
        case text = "Text"
        case image = "Image"
        case spacer = "Spacer"
    }
}
