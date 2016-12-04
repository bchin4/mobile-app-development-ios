//
//  ViewController.swift
//  Off The Menu
//
//  Created by Robert Stjacques Jr on 12/4/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    let entreeDataSource = EntreeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = entreeDataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewEntree" {
            let newEntreeVC = segue.destination as! EditEntreeViewController
            newEntreeVC.entrees = entreeDataSource
        }
        else if segue.identifier == "ViewEntree" {
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                let entree = entreeDataSource.entrees[selectedIndexPath.row]
                
                let viewEntreeVC = segue.destination as! ViewEntreeViewController
                viewEntreeVC.entree = entree
            }
        }
    }
}

