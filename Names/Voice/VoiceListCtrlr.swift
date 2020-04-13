//
//  VoiceListCtrlr.swift
//  Talk
//
//  Created by CP3 on 11/1/19.
//  Copyright © 2019 CP3. All rights reserved.
//

import UIKit
import AVFoundation

class VoiceListCtrlr: UIViewController {

    private let tableView = UITableView()
    private let identifier = "identifier"
    private var voices = [AVSpeechSynthesisVoice]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VoiceTableCell.self, forCellReuseIdentifier: VoiceTableCell.reuseIdentifier)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        view.asv(tableView)
        tableView.fillContainer()
        
        voices = AVSpeechSynthesisVoice.speechVoices()
        for voice in voices {
            print(voice.language)
        }
        
        print("currentLanguageCode =", AVSpeechSynthesisVoice.currentLanguageCode())
    }
}


// MARK: - UITableViewDataSource
extension VoiceListCtrlr: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VoiceTableCell.reuseIdentifier, for: indexPath) as! VoiceTableCell
        let voice = voices[indexPath.row]
        cell.voice = voice
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let voice = voices[indexPath.row]
        UIPasteboard.general.string = voice.identifier
        print(voice.identifier)
        let ctrlr = VoiceDetailCtrlr(voice: voice)
        self.navigationController?.pushViewController(ctrlr, animated: true)
    }
}
