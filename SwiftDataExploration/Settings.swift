import Foundation
import SwiftData

@Model
final class Settings {
    var darkMode: Bool
    
    init(darkMode: Bool = false) {
        self.darkMode = darkMode
    }
}
