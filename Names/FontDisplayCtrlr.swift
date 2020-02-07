//
//  FontDisplayCtrlr.swift
//  Names
//
//  Created by CP3 on 11/27/19.
//  Copyright © 2019 CP3. All rights reserved.
//

import Foundation
import UIKit
import Bricking

final class FontDisplayCtrlr: UIViewController {
    
    private let font: UIFont
    init(fontName: String) {
        font = UIFont(name: fontName, size: 40)!
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = font.fontName
        view.backgroundColor = UIColor.white
        setupView()
    }
}

private extension FontDisplayCtrlr {
    func setupView() {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = font
        label.text = "Family"
        view.asv(label)
        label.centerInContainer()
    }
}
