//
//  SoundIdentifier.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-08.
//

import Foundation

struct SoundIdentifier: Hashable {
    var labelName: String

    var displayName: String

    init(labelName: String) {
        self.labelName = labelName
        self.displayName = SoundIdentifier.displayNameForLabel(labelName)
    }

    static func displayNameForLabel(_ label: String) -> String {
        let localizationTable = "SoundNames"
        print(label)
        let unlocalized = label.replacingOccurrences(of: "_", with: " ").capitalized
        return Bundle.main.localizedString(forKey: unlocalized,
                                        value: unlocalized,
                                        table: localizationTable)
    }
}
