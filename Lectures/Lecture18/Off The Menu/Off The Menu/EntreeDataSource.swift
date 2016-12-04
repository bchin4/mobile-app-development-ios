//
//  EntreeDataSource.swift
//  Off The Menu
//
//  Created by Robert Stjacques Jr on 12/4/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit
import CoreData

class EntreeDataSource: NSObject, UICollectionViewDataSource {
    var entrees = [Entree]()
    
    func addEntree(name: String, price: String, details: String) -> Entree? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Entree", in: managedContext)!
        
        let entree = Entree(entity: entity, insertInto: managedContext)
        
        entree.name = name
        entree.price = price
        entree.details = details
        entree.entreeID = NSUUID().uuidString
        
        do {
            try managedContext.save()
            entrees.append(entree)
            return entree
        }
        catch let error as NSError {
            print("Failed to save Entree.  \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entrees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "UICollectionViewCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! EntreeViewCell
        
        let entree = entrees[indexPath.row]
        cell.imageView.image = ImageHelper.getImage(forUID: entree.entreeID!)!
        
        return cell
    }
}
