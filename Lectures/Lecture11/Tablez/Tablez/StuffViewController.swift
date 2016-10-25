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
            stuff.removeComic(comic)
        case MOVIES:
            let movie = stuff.movies[path.row]
            stuff.removeMovie(movie)
        case BOOKS:
            let book = stuff.books[path.row]
            stuff.removeBook(book)
        default:
            break
        }
        
        tableView.deleteRows(at: [path], with: .automatic)
    }
    
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
}

