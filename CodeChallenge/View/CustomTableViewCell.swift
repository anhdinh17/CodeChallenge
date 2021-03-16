//
//  TableViewCell.swift
//  CodeChallenge
//
//  Created by Anh Dinh on 3/13/21.
//

import UIKit
import SnapKit
import ChameleonFramework

class CustomTableViewCell: UITableViewCell {
    
    static let identifier: String = "test_cell_identifier"

    var cellLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        return label
    }()
    
    var cellType: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 17)
        return label
    }()
    
    /* this is to set gradient color for the cell. Source:https://gist.github.com/hcn1519/5de2a631649b769398c5bfbc29e30ca9 */
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)

        gradientColor()
        
        //contentView.backgroundColor = UIColor.randomFlat()
        
        configure()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
//        gradientLayer.frame = contentView.bounds
//        gradientLayer.colors = [UIColor.systemRed.cgColor,UIColor.systemYellow.cgColor]
//        contentView.layer.addSublayer(gradientLayer)
        
        //contentView.backgroundColor = .red
        
        
        //configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(){
        
        // add subviews to contentview
        self.contentView.addSubview(cellLabel)
        self.contentView.addSubview(cellType)
        
        // make constraints for cellLabel and cellType
        cellLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(self.contentView).offset(20)
        }
        
        cellType.snp.makeConstraints { (make) in
            make.top.equalTo(cellLabel.snp.bottom).offset(10)
            make.centerX.equalTo(self.contentView)
        }
    }
    
    func gradientColor(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = contentView.bounds
        gradientLayer.colors = [UIColor.systemYellow.cgColor,UIColor.systemGray3.cgColor]
        contentView.layer.addSublayer(gradientLayer)
    }
    
}
