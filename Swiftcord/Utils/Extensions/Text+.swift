//
//  Text+.swift
//  Swiftcord
//
//  Created by Vincent Kwok on 5/6/22.
//

import Foundation
import SwiftUI

extension Text {
	init(markdown: String, fallback: AttributedString = "") {
		self.init(
			(try? AttributedString(
				markdown: markdown,
				options: AttributedString.MarkdownParsingOptions(
					interpretedSyntax: .inlineOnlyPreservingWhitespace
				)
			)) ?? fallback
		)
	}
}
