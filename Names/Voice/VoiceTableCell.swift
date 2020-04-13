//
//  VoiceTableCell.swift
//  Talk
//
//  Created by CP3 on 11/1/19.
//  Copyright © 2019 CP3. All rights reserved.
//

import UIKit
import Bricking
import AVFoundation

final class VoiceTableCell: UITableViewCell {
    
    static let reuseIdentifier = "\(VoiceTableCell.self)"
    
    var voice: AVSpeechSynthesisVoice! {
        didSet {
            idLabel.text = voice.identifier
            nameLabel.text = voice.name
            languageLabel.text = voice.language
            qualityLabel.text = voice.quality == .default ? "default"  : "enhanced"
            if #available(iOS 13.0, *) {
                switch voice.gender {
                case .female:
                    genderLabel.text = "female"
                case .male:
                   genderLabel.text = "male"
                default:
                   genderLabel.text = "unknown"
                }
            }
        }
    }
    
    let idLabel = UILabel()
    let nameLabel = UILabel()
    let languageLabel = UILabel()
    let qualityLabel = UILabel()
    let genderLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        asv(idLabel, nameLabel, languageLabel, qualityLabel, genderLabel)
        layout(
            10,
            |-idLabel,
            |-nameLabel,
            |-languageLabel,
            |-qualityLabel,
            |-genderLabel,
            10
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
