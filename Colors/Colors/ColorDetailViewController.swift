//
//  ColorDetailViewController.swift
//  Colors
//
//  Created by Abhishek Mishra on 01/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

     var viewModel:ColorDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let viewModel = viewModel {
            viewModel.viewDidAppear(animated)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ColorDetailViewController : ColorDetailViewControllerDelegate {
    func setNavigationTitle(_ title:String) -> Void {
        self.title = title
    }
    
    func setBackgroundColor(red:Float, blue:Float, green:Float, alpha:Float) -> Void {
        self.view.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
}
