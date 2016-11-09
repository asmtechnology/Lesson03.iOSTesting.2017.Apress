//
//  ColorDetailViewControllerDelegate.swift
//  Colors
//
//  Created by Abhishek Mishra on 03/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

protocol ColorDetailViewControllerDelegate : class {
    func setBackgroundColor(red:Float, blue:Float, green:Float, alpha:Float) -> Void
    func setNavigationTitle(_ title:String) -> Void
}
