//
//  ColorListTableViewCell.swift
//  Colors
//
//  Created by Abhishek Mishra on 01/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import UIKit

class ColorListTableViewCell: UITableViewCell {

    var viewModel:CellViewModel? {
        willSet(newViewModel) {
            guard let vm = newViewModel else {
                self.textLabel?.text = ""
                return
            }
            self.textLabel?.text = vm.cellText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension ColorListTableViewCell : TableViewCellDelegate {
    
}
