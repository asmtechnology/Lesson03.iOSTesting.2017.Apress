//
//  TableViewModel.swift
//  Colors
//
//  Created by Abhishek Mishra on 03/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

protocol TableViewModel : ViewModel {
    
    var tableTitle:String {get set}
    
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath:IndexPath) -> CellViewModel?
    
    func viewModelForSelectedRow() -> ColorDetailViewModel?
    func selectRow(atIndexPath indexPath:IndexPath)
    
    func model(forIndexPath indexPath:IndexPath) -> AnyObject?
}
