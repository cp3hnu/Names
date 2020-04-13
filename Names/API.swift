//
//  API.swift
//  Names
//
//  Created by CP3 on 11/27/19.
//  Copyright © 2019 CP3. All rights reserved.
//

import Foundation

enum API: CaseIterable, CustomStringConvertible {
    case font
    case voice
    
    var description: String {
        switch self {
        case .font:
            return "UIFont.familyNames"
        case .voice:
            return "AVSpeechSynthesisVoice.speechVoices"
        }
    }
}
