//
//  TableViewCell.swift
//  CodeChallenge
//
//  Created by Anh Dinh on 3/13/21.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier: String = "test_cell_identifier"
    
    var cellLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.frame = CGRect(x:150,
                             y: 10,
                             width: 120,
                             height: 50)
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        return label
    }()
    
    var cellType: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.frame = CGRect(x:150,
                             y: 40,
                             width: 100,
                             height: 50)
        label.font = UIFont(name: "Helvetica", size: 17)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(cellLabel)
        self.contentView.addSubview(cellType)
//        cellLabel.snp.makeConstraints {
//            $0.left.equalToSuperview().offset(10)
//            $0.right.equalToSuperview().offset(-10)
//            $0.top.equalToSuperview().offset(50)
//            $0.bottom.equalToSuperview().offset(-50)
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
