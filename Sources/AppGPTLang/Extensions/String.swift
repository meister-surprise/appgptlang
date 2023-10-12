import SwiftUI

public extension String {
    
    func trim() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func cut() -> String {
        String(self.dropFirst().dropLast())
    }
    
    func splitOpcode() -> (String, String) {
        let split = self.split(separator: "(", maxSplits: 1)
        return (String(split.first!), String(split.last!.dropLast()))
    }
    
    func quoteAwareSplit() -> [String] {
        var result: [String] = []
        var currentToken = ""
        var isInsideQuotes = false

        for character in self {
            if character == "\"" {
                isInsideQuotes.toggle()
            } else if character == "," && !isInsideQuotes {
                result.append(currentToken)
                currentToken = ""
            } else {
                currentToken.append(character)
            }
        }

        result.append(currentToken)

        return result
    }

    func splitLines() -> [String] {
        var array = [String]()
        self.enumerateLines { line, _ in
            if !line.isEmpty {
                array.append(line.trim())
            }
        }
        return array
    }
    
    func getColor() -> Color {
        switch self {
        case "red": return .red
        case "orange": return .orange
        case "yellow": return .yellow
        case "green": return .green
        case "blue": return .blue
        case "indigo": return .indigo
        case "purple": return .purple
        default: return Color(.label)
        }
    }
}
