//
//  ViewModel.swift
//  Colors
//
//  Created by Abhishek Mishra on 07/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

protocol ViewModel {
    func viewDidAppear(_ animated: Bool)
    func setView(delegate:AnyObject?) -> Void
}
