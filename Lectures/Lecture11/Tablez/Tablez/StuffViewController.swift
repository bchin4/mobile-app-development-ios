//
//  ViewController.swift
//  Tablez
//
//  Created by Robert Stjacques Jr on 10/19/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class StuffViewController: UITableViewController {
    let COMICS = 0
    let MOVIES = 1
    let BOOKS = 2
    
    
    var stuff: Stuff!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
        stuff = Stuff()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleEditMode(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        }
        else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
    @IBAction func addComic(_ sender: AnyObject) {
        if let index = stuff.addRandomComic() {
            let indexPath = NSIndexPath(row: index, section: COMICS)
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        }
    }
    
    @IBAction func addMovie(_ sender: AnyObject) {
        if let index = stuff.addRandomMovie() {
            let indexPath = NSIndexPath(row: index, section: MOVIES)
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        }
    }
    
    @IBAction func addBook(_ sender: AnyObject) {
        if let index = stuff.addRandomBook() {
            let indexPath = NSIndexPath(row: index, section: BOOKS)
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func getSectionHeader(_ sectionNumber: Int) -> String? {
        switch sectionNumber {
        case COMICS:
            return "Comics"
        case MOVIES:
            return "Movies"
        case BOOKS:
            return "Books"
        default:
            return nil
        }
    }
    
    func getNumberOfRowsInSection(_ sectionNumber: Int) -> Int {
        switch(sectionNumber) {
        case COMICS:
            return stuff.comics.count
        case MOVIES:
            return stuff.movies.count
        case BOOKS:
            return stuff.books.count
        default:
            return 0
        }
    }
    
    func getTableCell(_ path: IndexPath ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StuffCell", for: path) as! StuffCell
        
        switch(path.section) {
        case COMICS:
            let comic = stuff.comics[path.row]
            cell.title?.text = comic.title
            cell.detail1?.text = "\(comic.author)"
            cell.detail2?.text = "\(comic.artist)"
        case MOVIES:
            let movie = stuff.movies[path.row]
            cell.title?.text = movie.title
            cell.detail1?.text = "\(movie.releaseYear)"
        case BOOKS:
            let book = stuff.books[path.row]
            cell.title?.text = book.title
            cell.detail1?.text = "\(book.author)"
            cell.detail2?.text = ""
        default:
            cell.title?.text = "Unknown"
        }
        
        return cell
    }
    
    func deleteRow(_ path: IndexPath) {
        switch(path.section) {
        case COMICS:
            let comic = stuff.comics[path.row]
            verifyDelete(comic.title, {
                (action) -> Void in
                    self.stuff.removeComic(comic)
                    self.tableView.deleteRows(at: [path], with: .automatic)
            })
        case MOVIES:
            let movie = stuff.movies[path.row]
            verifyDelete(movie.title, {
                (action) -> Void in
                self.stuff.removeMovie(movie)
                self.tableView.deleteRows(at: [path], with: .automatic)
            })
        case BOOKS:
            let book = stuff.books[path.row]
            verifyDelete(book.title, {
                (action) -> Void in
                self.stuff.removeBook(book)
                self.tableView.deleteRows(at: [path], with: .automatic)
            })        default:
            break
        }
    }
    
    //
    // helper function that deletes an item from the collection
    //
    func verifyDelete(_ name: String, _ delete: @escaping (UIAlertAction) -> Void) {
        let title = "Delete \(name)?"
        let message = "Are you sure that you want to delete this item?"
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: delete)
        ac.addAction(deleteAction)
        
        present(ac, animated: true, completion: nil)
    }
    
    func moveRow(_ from: IndexPath, _ to: IndexPath) {
        switch(from.section) {
        case COMICS:
            stuff.moveComic(from.row, to.row)
        case MOVIES:
            stuff.moveMovie(from.row, to.row)
        case BOOKS:
            stuff.moveBook(from.row, to.row)
        default:
            break
        }
    }
    
    //
    // delgate functions; mostly call helper functions (above)
    //
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // call the helper function
        return getSectionHeader(section)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // call the helper function
        return getNumberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // call the helper function
        return getTableCell(indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // call the helper function
            deleteRow(indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveRow(sourceIndexPath, destinationIndexPath)
    }
}

