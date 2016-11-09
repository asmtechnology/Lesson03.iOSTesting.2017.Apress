//
//  TableViewCellViewModel.swift
//  Colors
//
//  Created by Abhishek Mishra on 01/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

class TableViewCellViewModel: NSObject, CellViewModel {
    
    var cellText:String
    private var view:TableViewCellDelegate?
    
    init(view:TableViewCellDelegate?, cellText:String) {
        self.cellText = cellText
        super.init()
    }
    
    override init() {
        cellText = ""
        super.init()
    }
    
    func setView(delegate:AnyObject?) -> Void {
        view = delegate as? TableViewCellDelegate
    }
    
    func viewDidAppear(_ animated: Bool) {
        
    }
}
