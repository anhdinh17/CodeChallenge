//
//  SecondViewController.swift
//  CodeChallenge
//
//  Created by Anh Dinh on 3/13/21.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

//    var holder : UIView = {
//        let holder = UIView()
//        return holder
//    }()
    
    var idLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    var typeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    var dataText: UITextView = {
        let text = UITextView()
        text.textContainer.lineBreakMode = .byCharWrapping
        text.font = UIFont(name:"Helvetica", size: 18)
        return text
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
 
        configure()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        // éo hiểu tại sao có dòng này
//        if holder.subviews.count == 0 {
//            configure()
//        }
//    }
 

    func configure(){
        view.addSubview(idLabel)
        view.addSubview(typeLabel)
        view.addSubview(dateLabel)
        view.addSubview(dataText)
        view.addSubview(saveButton)
        
        idLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(20)
            make.top.equalTo(view.snp.top).offset(20)
            make.width.equalTo(view.snp.width).offset(40)
            make.height.equalTo(40)
        }
        
        typeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(20)
            make.top.equalTo(idLabel.snp.bottom).offset(20)
            make.width.equalTo(view.snp.width).offset(40)
            make.height.equalTo(40)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(20)
            make.top.equalTo(typeLabel.snp.bottom).offset(20)
            make.width.equalTo(view.snp.width).offset(40)
            make.height.equalTo(40)
        }
        
        dataText.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(20)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.size.equalTo(CGSize(width: view.frame.size.width - 40 , height: view.frame.size.height
                                        - 400 ))
            //make.bottom.equalTo(view.snp.bottom).offset(100)
        }
        
        saveButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(dataText.snp.bottom).offset(30)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        if let id = id {
            idLabel.text = "Id: \(id)"
        }else {
            idLabel.text = "This item doesnt have an ID"
        }
        
        if let type = type {
            typeLabel.text = "Type: \(type)"
        }else {
            typeLabel.text = "Type: This item doesnt have a Type"
        }
        
        if let date = date {
            if date.isEmpty == true{
                dateLabel.text = "Date: This item doesnt have a Date"
            }else{
                dateLabel.text = "Date: \(date)"
            }
        }else {
            dateLabel.text = "Date: This item doesnt have a Date"
        }
        
        if let data = data {
            if data.isEmpty == true{
                dataText.text = "Data: This item has no Data"
            }else{
                dataText.text = "Data: \(data)"
            }
        }else {
            dataText.text = "Data: This item has no Data"
        }
        
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        
        
//        typeLabel.text = "Text image other"
//        dateLabel.text = "03/13/2021"
//        dataText.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
    }

    @objc func didTapSaveButton(){
        print("Save Button is tapped")
    }
    
}
