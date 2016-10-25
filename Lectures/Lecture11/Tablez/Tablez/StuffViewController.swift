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
        
        //init the collection with some random stuff
        stuff = Stuff()
        for _ in 0..<15 {
            stuff.addRandomComic()
        }
        
        for _ in 0..<5 {
            stuff.addRandomMovie()
        }
        
        for _ in 0..<10 {
            stuff.addRandomBook()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func getSectionHeader(_ sectionNumber: Int) -> String? {
        switch sectionNumber {
        case COMICS:
            return stuff.getComicsHeader()
        case MOVIES:
            return stuff.getMoviesHeader()
        case BOOKS:
            return stuff.getBooksHeader()
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
        default:
            cell.title?.text = "Unknown"
        }
        
        return cell
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
}

