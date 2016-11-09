//
//  ColorTableViewModel.swift
//  Colors
//
//  Created by Abhishek Mishra on 01/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

class ColorTableViewModel: NSObject {
    
    var tableTitle:String
    
    fileprivate var coulorData:[Color]
    fileprivate var selectedIndexPath:IndexPath?
    fileprivate weak var view:ColorListTableViewControllerDelegate?
    
    init (view:ColorListTableViewControllerDelegate?, title:String) {
        self.view = view
        self.tableTitle = title
        
        self.coulorData = []
        
        if let redModel = Color(name: "Red", red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
            let blueModel = Color(name: "Blue", red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0),
            let greenModel = Color(name: "Green", red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0) {
            self.coulorData.append(redModel)
            self.coulorData.append(blueModel)
            self.coulorData.append(greenModel)
            
        }
    }
}

extension ColorTableViewModel : TableViewModel {
    
    func setView(delegate:AnyObject?) -> Void {
        self.view = delegate as? ColorListTableViewControllerDelegate
    }
    
    func numberOfRows() -> Int {
        return coulorData.count
    }
    
    func cellViewModel(forIndexPath indexPath:IndexPath) -> CellViewModel? {
        let row = indexPath.row
        if row < 0 || row >= self.coulorData.count {
            return nil
        }
        
        let cellText = coulorData[row].name
        return TableViewCellViewModel(view:nil, cellText: cellText)
    }
    
    func selectRow(atIndexPath indexPath:IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> ColorDetailViewModel? {
        guard let selectedIndexPath = selectedIndexPath else {
            return nil
        }
        
        if selectedIndexPath.row < 0 || selectedIndexPath.row >= coulorData.count {
            return nil
        }

        return ColorDetailViewModel(view:nil, model:coulorData[selectedIndexPath.row])
    }
    
    func viewDidAppear(_ animated: Bool) {
        guard let view = view else {
            return
        }
        view.setNavigationTitle(tableTitle)
    }
    
    func model(forIndexPath indexPath:IndexPath) -> AnyObject? {
        let row = indexPath.row
        if row < 0 || row >= self.coulorData.count {
            return nil
        }
        
        return coulorData[row] as AnyObject
    }
    
}




