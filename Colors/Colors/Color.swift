//
//  Color.swift
//  Colors
//
//  Created by Abhishek Mishra on 01/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

class Color {
    private static let zero = Float(floatLiteral: 0.0)
    private static let one = Float(floatLiteral: 1.0)
    
    var name:String
    var red:Float
    var green:Float
    var blue:Float
    var alpha:Float
    
    init?(name:String, red:Float, green:Float, blue:Float, alpha:Float) {
        if (red < Color.zero || red > Color.one) {
            return nil
        }
        
        if (green < Color.zero || green > Color.one) {
            return nil
        }
        
        if (blue < Color.zero || blue > Color.one) {
            return nil
        }
        
        if (alpha < Color.zero || alpha > Color.one) {
            return nil
        }
        
        self.name = name
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}
