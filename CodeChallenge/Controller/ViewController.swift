//
//  ViewController.swift
//  CodeChallenge
//
//  Created by Anh Dinh on 3/13/21.
//

import UIKit
import SnapKit
import ChameleonFramework

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // array of DataModel
    var dataArray = [DataModel]()
    
    // array after being sorted
    var sortedArray = [DataModel]()
    
    // TableView
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.rowHeight = 100
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableViewConfigure()
        
        DataManager.shared.delegate = self
        DataManager.shared.fetchData()
        
    }

//MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell

        cell.cellLabel.text = "Data Item #\(indexPath.row + 1)"
        cell.cellType.text = "Type: \(sortedArray[indexPath.row].type!)"
        
        return cell
    }

//MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // check the secondViewController
        guard let secondVC = storyboard?.instantiateViewController(identifier: "secondViewController") as? SecondViewController else {
            return
        }
        
        // set values for secondViewController variables
        secondVC.id = sortedArray[indexPath.row].id
        secondVC.type = sortedArray[indexPath.row].type
        secondVC.date = sortedArray[indexPath.row].date
        secondVC.data = sortedArray[indexPath.row].data
        
        present(secondVC, animated: true, completion: nil)
        
    }
    
    func tableViewConfigure(){
        
        self.view.addSubview(tableView)
        
        // register CustomTableViewCell
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        // Using Snapkit to make constraints for TableView
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
}

//MARK: - DataDelegate function
extension ViewController: DataDelegate{
    
    func updateArray(_ data: String) {
        do{
            dataArray = try JSONDecoder().decode([DataModel].self,from: data.data(using: .utf8)!)
            
            // sort array based on type
            sortedArray = dataArray.sorted(by: {$0.type! < $1.type!})

        }catch{
            print("Failed to decode: \(error)")
        }
        
        // reload tableView
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }

}
