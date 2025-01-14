//
//  LoadingView.swift
//  Swiftcord
//
//  Created by Vincent Kwok on 28/2/22.
//

import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var state: UIState

	@Environment(\.colorScheme) private var colorScheme

    private let loadingTips = [
        "You can use Streamer Mode to hide personal details while streaming.",
        "You can type /tableflip and /unflip to spice up your messages.",
        "Characters like @, #, ! and * will narrow Quick Switcher results.",
        "Click a server name in the emoji picker to hide that server\'s emojis.",
        "Hover a GIF and click the star to save it to your favourites.",
        "The top-most role for a user defines that user\'s colour.",
        "A red mic icon means that person has been muted by a server admin.",
        "You can temporarily mute a server or channel by right-clicking it.",
        "Click your avatar in the lower-left corner to set a custom status.",
        "Group DMs can have up to ten members.",
        "Click the compass in your server list to find new servers.",
        "Drag and drop servers on top of each other to create server folders.",
        "Type /tenor or /giphy + anything to find a GIF for that topic!",
        "Share what you\'re playing by using the game activity settings.",
        "Highlight text in your chat bar to bold, use italics and more.",
        "Hide muted channels in a server by right-clicking the server name.",
        "Customise Discord\'s appearance in the user settings menu.",
        "Link your favourite social media accounts in the connections settings.",
        "You can create channel categories to group and organise your channels.",
        "You can join up to 100 servers, and up to 200 servers with Nitro!",
        "You can drag and drop files onto Discord to upload them.",
        "Change each participant\'s volume by right-clicking them in a call.",
        "Right click to pin messages in a channel or DM to save them for later.",
        "Type a plus sign before an emoji name to turn it into a reaction.",
        "You can type /nick to quickly change your nickname in a server.",
        "You can type / to view bot commands and other built-in commands",
        "You can type !!{asterisks}!! around your words to make them **bold**."
    ]

    @State private var displayedTip = ""

    var body: some View {
		let loading = state.loadingState != .messageLoad

        VStack(spacing: 4) {
            LottieView(
                name: "discord-loading-animation",
                play: .constant(loading),
                width: 280,
                height: 280
            )
            .frame(width: 280, height: 150)
            .lottieLoopMode(.loop)
			.if(colorScheme == .light) { view in view.colorInvert() }

			Text("loader.tip.header").font(.headline).textCase(.uppercase)
            Text(.init(displayedTip))
                .multilineTextAlignment(.center)
                .padding(.top, 8)
                .frame(maxWidth: 320)
                .onAppear {
                    displayedTip = loadingTips.randomElement()! // Will never be nil because loadingTips can never be empty
                }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .allowsHitTesting(loading)
        .background(Color(NSColor.windowBackgroundColor))
		.opacity(loading ? 1 : 0)
        .scaleEffect(loading ? 1 : 2)
        .animation(.interpolatingSpring(stiffness: 200, damping: 120), value: loading)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
