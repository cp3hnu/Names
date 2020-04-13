//
//  VoiceDetailCtrlr.swift
//  Talk
//
//  Created by CP3 on 10/10/19.
//  Copyright © 2019 CP3. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Bricking

class VoiceDetailCtrlr: UIViewController {

    private let synthesizer = AVSpeechSynthesizer()
    private let voice: AVSpeechSynthesisVoice
    
    init(voice: AVSpeechSynthesisVoice) {
        self.voice = voice
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.setTitle("Talk", for: UIControl.State.normal)
        
        view.asv(button)
        button.width(62).centerInContainer() ~ 30
        button.addTarget(self, action: #selector(talk), for: UIControl.Event.touchUpInside)
    }
    
    @objc func talk() {
        let array = ["小朋友，请找出您听到的单词对应的图片吧！"]

        array.forEach{
            let utterance = AVSpeechUtterance(string: $0)
            utterance.rate = 0.4
            utterance.postUtteranceDelay = 2.0
            utterance.voice = voice
            self.synthesizer.speak(utterance)
        }
    }
}
