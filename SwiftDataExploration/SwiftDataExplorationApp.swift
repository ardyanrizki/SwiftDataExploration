import SwiftUI
import SwiftData

@main
struct SwiftDataExplorationApp: App {

    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: Settings.self, inMemory: false)
    }
}

struct RootView: View {
    @Environment(\.modelContext) private var context
    @Query private var settings: [Settings]
    
    var body: some View {
        ContentView()
            .onAppear(perform: {
                if settings.isEmpty {
                    context.insert(Settings())
                }
            })
            .environment(settings.first ?? Settings())
    }
}
