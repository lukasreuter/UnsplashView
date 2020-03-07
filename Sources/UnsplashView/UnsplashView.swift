///
///  UnsplashView.swift
///  UnsplashView
///
///  Created by Lukas Reuter on 07.03.20.
///  Copyright © 2020 Lukas Reuter. All rights reserved.

import SwiftUI
import URLImage

public struct UnsplashView: View {

    private var source: UnsplashSource
    private var configuration: (Image) -> Image

    private let cache = TemporaryImageCache()

    public init(_ terms: String..., random: Bool = false, configuration: @escaping (Image) -> Image = { $0.resizable() }) {
        self.source = UnsplashSource(scope: random ? .random : .none, time: .all, size: .init(width: 512, height: 512), terms: terms)
        self.configuration = configuration
    }

    public var body: some View {
        AsyncImage(url: self.source.url, cache: self.cache, placeholder: Text("Loading ..."), configuration: self.configuration)
    }
}

struct UnsplashView_Preview: PreviewProvider {
    static var previews: some View {
        UnsplashView("Cat")
    }
}
