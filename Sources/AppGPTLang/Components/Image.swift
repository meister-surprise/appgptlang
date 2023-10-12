import SwiftUI

@available(macOS 13, iOS 16, *)
public struct ImageComponent: View {
    
    public let url: URL?
    
    public init(_ modifiers: [String]) {
        self.url = URL(string: modifiers.first!)
    }
    
    public var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
        } placeholder: {
            ProgressView()
        }
        .scaledToFit()
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
