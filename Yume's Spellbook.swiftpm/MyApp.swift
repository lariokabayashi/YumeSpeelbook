import SwiftUI
import AVKit
import AVFAudio
import AVFoundation
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            InitView()
                .onAppear{
                    
                    Bundle.main.url(forResource: "media/mygpt2", withExtension:"mlmodel")
                    
                    let cfURL = Bundle.main.url(forResource: "media/Pixelify", withExtension: "ttf")! as CFURL

                    CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
                    
                    AudioManager.shared.playBackgroundMusic()
            }
        }
    }
}
extension View {
    func getWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func getHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
}
