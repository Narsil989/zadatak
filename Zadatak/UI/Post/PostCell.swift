//
//  PostCell.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//

import UIKit

class PostCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PostCell: Configurable {
    func configure(with data: Post) {
        
    }
}
