//
//  ViewController.swift
//  CodeChallenge
//
//  Created by Anh Dinh on 3/13/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

//    var array = ["Hello Kitty","Sunday", "Saturday", "Monday","Tuesday","Wednesday","Thursday","Friday","Apple","Orange","Grape","Kiwi"]
    
    // array of DataModel
    var dataArray = [DataModel]()
    
    // array after being sorted
    var sortedArray = [DataModel]()
    
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
        
        DataManager.shared.delegate = self
        DataManager.shared.fetchData()
        
    }

//MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
      //  cell.textLabel?.text = array[indexPath.row]
        
//        cell.contentView.addSubview(cell.cellLabel)
//        cell.contentView.addSubview(cell.cellType)

        cell.accessoryType = .disclosureIndicator
        cell.cellLabel.text = "Data Item #\(indexPath.row + 1)"
        cell.cellType.text = "Type: \(sortedArray[indexPath.row].type!)"
        return cell
    }

//MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell number \(indexPath.row + 1) has been clicked")
        
        // check the secondViewController
        guard let secondVC = storyboard?.instantiateViewController(identifier: "secondViewController") as? SecondViewController else {
            return
        }
        
        secondVC.id = sortedArray[indexPath.row].id
        secondVC.type = sortedArray[indexPath.row].type
        secondVC.date = sortedArray[indexPath.row].date
        secondVC.data = sortedArray[indexPath.row].data
        
        present(secondVC, animated: true, completion: nil)
        
    }

}

//MARK: - DataDelegate function
extension ViewController: DataDelegate{
    
    func updateArray(_ data: String) {
        do{
            dataArray = try JSONDecoder().decode([DataModel].self,from: data.data(using: .utf8)!)
            
            sortedArray = dataArray.sorted(by: {$0.type! < $1.type!})
            
            print(sortedArray)
          //  print("Data array: \n \(dataArray)") ko cần nữa
        }catch{
            print("Failed to decode: \(error)")
        }
        
        // reload tableView
        tableView.reloadData()
    }

}
