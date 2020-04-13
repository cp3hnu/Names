//
//  FontNamesListCtrlr.swift
//  Names
//
//  Created by CP3 on 11/27/19.
//  Copyright © 2019 CP3. All rights reserved.
//

import Foundation
import UIKit
import Bricking

final class FontNamesListCtrlr: UIViewController {
    
    private let tableView = UITableView()
    private let familyNames: [String]
    private let fontsNames: [[String]]
    
    init() {
        familyNames = UIFont.familyNames.sorted()
        var names = [[String]]()
        for familyName in familyNames {
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(fontNames)
            names.append(fontNames)
        }
        fontsNames = names
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Names"
        view.backgroundColor = UIColor.white
        setupView()
    }
}

private extension FontNamesListCtrlr {
    func setupView() {
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "identifier")
        tableView.rowHeight = 64
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        view.asv(tableView)
        tableView.fillContainer()
    }
}

// MARK: - UITableViewDelegate
extension FontNamesListCtrlr: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return familyNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontsNames[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        let name = fontsNames[indexPath.section][indexPath.row]
        let font = UIFont(name: name, size: 20)!
        cell.textLabel?.font = font
        cell.textLabel?.text = "\(name)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let familyName = familyNames[section]
        return familyName
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
        
        let name = fontsNames[indexPath.section][indexPath.row]
        let ctrlr = FontDisplayCtrlr(fontName: name)
        self.navigationController?.pushViewController(ctrlr, animated: true)
    }
}
