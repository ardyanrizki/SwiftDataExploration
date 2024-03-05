import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(Settings.self) private var settings: Settings
    
    @State private var isPresented: Bool = false

    var body: some View {
        VStack {
            Button("Open Settings") {
                isPresented = true
            }
        }
        .sheet(isPresented: $isPresented, content: {
            SettingsView(settings: settings)
                .preferredColorScheme(settings.darkMode ? .dark : .light)
        })
        .preferredColorScheme(settings.darkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Settings.self, inMemory: true)
}

struct SettingsView: View {
    @Bindable var settings: Settings
    
    var body: some View {
        Toggle(isOn: $settings.darkMode) {
            Text("Dark mode")
        }
        .padding(.horizontal)
    }
}
