//
//  ViewController.swift
//  CodeChallenge
//
//  Created by Anh Dinh on 3/13/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var array = ["Hello Kitty", "Saturday", "Monday"]
    
    // TableView
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.rowHeight = 100
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        // register CustomTableViewCell
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        // Using Snapkit to make constraints for TableView
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
    }

//MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
      //  cell.textLabel?.text = array[indexPath.row]
        
//        cell.contentView.addSubview(cell.cellLabel)
//        cell.contentView.addSubview(cell.cellType)
        
        
//
        cell.cellLabel.text = array[indexPath.row]
        cell.cellType.text = array[indexPath.row]
        return cell
    }

//MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

