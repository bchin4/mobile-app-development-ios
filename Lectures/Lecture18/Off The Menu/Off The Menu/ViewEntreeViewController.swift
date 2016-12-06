//
//  ViewEntreeViewController.swift
//  Off The Menu
//
//  Created by Robert Stjacques Jr on 12/4/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewEntreeViewController: UIViewController {
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var detailsLabel: UILabel!
    
    @IBOutlet var foodImage: UIImageView!
    
    var entree: Entree! {
        didSet {
            navigationItem.title = entree.name
        }
    }
    
    var entrees: EntreeDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceLabel.text = entree.price
        detailsLabel.text = entree.details
        foodImage.image = ImageHelper.getImage(forUID: entree.entreeID!)!
    }
    
    @IBAction func deleteEntree(_ sender: Any) {
        entrees.deleteEntree(entree: entree)
        navigationController!.popViewController(animated: true)
    }
}
