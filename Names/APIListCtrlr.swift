//
//  APIListCtrlr.swift
//  Names
//
//  Created by CP3 on 11/27/19.
//  Copyright © 2019 CP3. All rights reserved.
//

import Foundation
import UIKit
import Bricking

final class APIListCtrlr: UIViewController {
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "API"
        view.backgroundColor = UIColor.white
        setupView()
        
        
    }
}

private extension APIListCtrlr {
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

// MARK: - UITableViewDataSource
extension APIListCtrlr: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return API.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        let item = API.allCases[indexPath.item]
        cell.textLabel?.text = item.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = API.allCases[indexPath.item]
        let ctrlr = FontNamesListCtrlr(api: item)
        self.navigationController?.pushViewController(ctrlr, animated: true)
    }
}
