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
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)

        gradientColor()
        
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
