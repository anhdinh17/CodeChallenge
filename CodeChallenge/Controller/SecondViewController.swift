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
import SDWebImage
import Alamofire
import AlamofireImage

class SecondViewController: UIViewController {
    
    // Variables to receive values from Viewcontroller.
    var id: String?
    var date: String?
    var type: String?
    var data: String?
    
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
    
    
    var image: UIImageView = {
        let image = UIImageView()
        //        image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    var dataText: UIView = {
        let text = UIView()
        //text.textContainer.lineBreakMode = .byCharWrapping
        //text.isEditable = false
        //text.font = UIFont(name:"Helvetica", size: 18)
        return text
    }()
    
    var resultText: UITextView = {
        let text = UITextView()
        text.textContainer.lineBreakMode = .byCharWrapping
        text.backgroundColor = .clear
        text.isEditable = false
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // url of realm file
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        gradientColor()
        
        configure()
        
        //        let badURL = verifyUrl(urlString: "http://This/will/not/load/")
        //        print(badURL)
        
        //        verifyImageURL(url: "http://This/will/not/load/")
        
        //        checkImageData()
    }
    
    
    
    
    
    // Gradient color
    func gradientColor(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemYellow.cgColor,UIColor.systemGray3.cgColor]
        view.layer.addSublayer(gradientLayer)
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
        dataText.addSubview(resultText)
        
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
        
        resultText.snp.makeConstraints { (make) in
            make.edges.equalTo(dataText)
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
                resultText.text = "This item does not have Data"
            }else if type == "image"{
                addImage()
            }else{
                resultText.text = "\(data)"
            }
        }else {
            resultText.text = "This item does not have Data"
        }
        
        // add action to save button
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        
    }
}


//MARK: - Funcs for Save buttons
extension SecondViewController {
    
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
                // save image to Photos Album
                if type == "image"{
                    if let data = data {
                        if data.contains("any"){
                            guard let image = image.image else {return}
                            // save image to photos album on iphones
                            UIImageWriteToSavedPhotosAlbum(image,
                                                           self,
                                                           #selector(imageSaveToPhotoAlbum(_:didFinishSavingWithError:contextInfo:)),
                                                           nil)
                            
                            // app also saves this item to database
        //                    try realm.write{
        //                        realm.add(savedItem)
        //                    }
                        }
                    }


                }else{
                    try realm.write{
                        realm.add(savedItem)
                    }
                }
                
            }catch{
                print("Error saving this item to Realm Database: \(error)")
            }
            
            itemSavedAlert()
        }
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


//MARK: - func to add image
extension SecondViewController {
    
    func addImage(){
        
        dataText.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.top.equalTo(dataText)
            make.left.equalTo(dataText)
            make.width.equalTo(dataText)
            make.height.equalTo(dataText)
        }
        
        if let imageUrl = data{
            
            AF.request(imageUrl).responseData { (response) in
                if let data = response.data{
                    DispatchQueue.main.async {
                        self.image.image = UIImage(data: data)
                    }
                }else{
                    self.resultText.text = "Invalid url"
                }
            }
        }
        
    }
    
}

//extension SecondViewController {
//    // func to check if url contains image file
//    /*
//     Source: https://stackoverflow.com/questions/44843835/how-to-check-url-is-image-or-video
//    */
//    func verifyImageURL(url: String){
//        let url1 = url
//                let imageExtensions = ["png", "jpg", "gif","any"]
//                //...
//                // Iterate & match the URL objects from your checking results
//                let url: URL? = NSURL(fileURLWithPath: url1) as URL
//                let pathExtention = url?.pathExtension
//                    if imageExtensions.contains(pathExtention!)
//                    {
//                        AF.request(data as! URLConvertible, method: .get).responseImage { response in
//                            if let image = response.data{
//                                DispatchQueue.main.async {
//                                    self.image.image = UIImage(data: image)
//                                }
//                            }else{
//                                self.resultText.text = "Invalid URL"
//                            }
//                        }
//
//                    }else
//                    {
//                        resultText.text = "This item does not have an image"
//                    }
//    }
//}

//extension SecondViewController {
//    func checkImageData(){
//        AF.request("http://This/will/not/load/").responseJSON { (response) in
//            if let response = response.data{
//                print("This link is good")
//            } else {
//                print("Invalid URL")
//            }
//        }
//    }
//}

//MARK: - Codes to save image to Photos Album
extension SecondViewController {
    
    // this part is from hackingwithSwift.com
    /*
     https://www.hackingwithswift.com/read/13/5/saving-to-the-ios-photo-library
     */
    @objc func imageSaveToPhotoAlbum(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
}
