//
//  ColorListTableViewController.swift
//  Colors
//
//  Created by Abhishek Mishra on 01/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import UIKit

class ColorListTableViewController: UITableViewController {

    private var viewModel:TableViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        self.viewModel = ColorTableViewModel(view: self, title:"Select a color")
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

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        
        return viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorListtCell", for: indexPath) as? ColorListTableViewCell
        
        guard let viewModel = viewModel,
            let colorListTableViewCell = cell else {
                return UITableViewCell()
        }
        
        let detailViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        colorListTableViewCell.viewModel = detailViewModel
        return colorListTableViewCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.selectRow(atIndexPath:indexPath)
        self.performSegue(withIdentifier: "colorDetailSegue", sender: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = viewModel else {
            return
        }
        
        if identifier.compare("colorDetailSegue") != .orderedSame {
            return
        }
        
        if let colorDetailViewController = segue.destination as? ColorDetailViewController,
            let destinationViewModel = viewModel.viewModelForSelectedRow() {
            
            destinationViewModel.setView(delegate: colorDetailViewController)
            colorDetailViewController.viewModel = destinationViewModel
        }
    
    }
}

extension ColorListTableViewController : ColorListTableViewControllerDelegate {
    func setNavigationTitle(_ title:String) -> Void {
        self.title = title
    }
}
