//
//  SecondViewController.swift
//  CodeChallenge
//
//  Created by Anh Dinh on 3/13/21.
//

import UIKit
import SnapKit
import RealmSwift
import ChameleonFramework

class SecondViewController: UIViewController {

    var itemIsSaved = false
    
    let realm = try! Realm()
    
    var idLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "ID: "
        return label
    }()
    
    var idText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size: 18)
        return label
    }()
    
    var typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type: "
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    var typeText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Date: "
        return label
    }()
    
    var dateText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    var dataLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Data:"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    var dataText: UITextView = {
        let label = UITextView()
        label.textContainer.lineBreakMode = .byCharWrapping
        label.backgroundColor = .clear
        label.isEditable = false
        label.font = UIFont(name:"Helvetica", size: 18)
        return label
    }()
    
    var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 9
        return button
    }()
    
    // Variables to receive values from Viewcontroller.
    var id: String?
    var date: String?
    var type: String?
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // url of realm file
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        gradientColor()
        
        configure()
    }
   
    
    
    @objc func didTapSaveButton(){
        
        // create an object to save to Realm
        let savedItem = SavedData()
        savedItem.id = id
        savedItem.type = type
        savedItem.date = date
        savedItem.data = data
        
        // retrieve database
        let results = realm.objects(SavedData.self)
        
        // check if the object already exists in database
        for result in results {
            if (result.id == savedItem.id) && (result.type == savedItem.type) && (result.date == savedItem.date) && (result.data == savedItem.data){
                existingItemAlert()
                itemIsSaved = true
            }
        }
        
        // if object doesn't exist, we add new object to database
        if itemIsSaved == false {
            do{
                try realm.write{
                    realm.add(savedItem)
                }
            }catch{
                print("Error saving this item to Realm Database: \(error)")
            }
            
            itemSavedAlert()
        }
    }
    
    // Gradient color
    func gradientColor(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemYellow.cgColor,UIColor.systemGray3.cgColor]
        view.layer.addSublayer(gradientLayer)
    }
    
    // Alert for saving item
    func itemSavedAlert(){
        let alert = UIAlertController(title: "Alert", message: "This item has been saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // Alert for existing items
    func existingItemAlert(){
        let alert = UIAlertController(title: "Alert", message: "This item was already saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - configure for labels, texts, buttons
extension SecondViewController {
    
    func configure(){
        view.addSubview(idLabel)
        view.addSubview(idText)
        view.addSubview(typeLabel)
        view.addSubview(typeText)
        view.addSubview(dateLabel)
        view.addSubview(dateText)
        view.addSubview(dataLabel)
        view.addSubview(dataText)
        view.addSubview(saveButton)
        
        idLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(20)
            make.top.equalTo(view.snp.top).offset(20)
            make.width.equalTo(25)
            make.height.equalTo(40)
        }
        
        idText.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(20)
            make.left.equalTo(idLabel.snp.right).offset(5)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(idLabel.snp.height)
        }
        
        typeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(20)
            make.top.equalTo(idLabel.snp.bottom).offset(20)
            make.width.equalTo(50)
            make.height.equalTo(40)
        }
        
        typeText.snp.makeConstraints { (make) in
            make.top.equalTo(typeLabel.snp.top)
            make.left.equalTo(typeLabel.snp.right).offset(5)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(typeLabel.snp.height)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(20)
            make.top.equalTo(typeLabel.snp.bottom).offset(20)
            make.width.equalTo(50)
            make.height.equalTo(40)
        }
        
        dateText.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel)
            make.left.equalTo(dateLabel.snp.right).offset(5)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(40)
        }
        
        dataLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.left.equalTo(dateLabel)
            make.width.equalTo(50)
            make.right.equalTo(dateLabel)
        }
        
        dataText.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(20)
            make.top.equalTo(dataLabel.snp.bottom).offset(5)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(view.frame.size.height - 400)

        }
        
        saveButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(dataText.snp.bottom).offset(30)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        // Set texts for labels
        if let id = id {
            if id.isEmpty == true {
                idText.text = "This item does not have an ID"
            }else{
                idText.text = "\(id)"
            }
        }else {
            idText.text = "This item does not have an ID"
        }
        
        if let type = type {
            if type.isEmpty == true {
                typeText.text = "This item does not have a Type"
            }else{
                typeText.text = "\(type)"
            }
        }else {
            typeText.text = "This item does not have a Type"
        }
        
        if let date = date {
            if date.isEmpty == true{
                dateText.text = "This item does not have a Date"
            }else{
                dateText.text = "\(date)"
            }
        }else {
            dateText.text = "This item does not have a Date"
        }
        
        if let data = data {
            if data.isEmpty == true{
                dataText.text = "This item does not have Data"
            }else{
                dataText.text = "\(data)"
            }
        }else {
            dataText.text = "This item does not have Data"
        }
        
        // add action to save button
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)

    }
}
