import SwiftUI
import URLImage

public struct UnsplashView: View {

    var source: UnsplashSource

    public init(_ terms: String...) {
        source = UnsplashSource(scope: .none, time: .all, size: .init(width: 512, height: 512), terms: terms)
    }

    var body: some View {
        URLImage(self.source.url, placeholder: { (progressWrapper: DownloadProgressWrapper) in

            ProgressView(progressWrapper) { progress in
                ZStack {
                    if progress > 0.0 {
                        // The download has started. CircleProgressView displays the progress.
                        CircleProgressView(progress).stroke(lineWidth: 8.0)
                    }
                    else {
                        // The download has not yet started. CircleActivityView is animated activity indicator that suits this case.
                        CircleActivityView().stroke(lineWidth: 50.0)
                    }
                }
            }
            //.frame(width: 50.0, height: 50.0)

        }) {
            $0.image.resizable()
        }
    }
}

struct UnsplashView_Preview: PreviewProvider {
    static var previews: some View {
        UnsplashView("Cat")
    }
}
