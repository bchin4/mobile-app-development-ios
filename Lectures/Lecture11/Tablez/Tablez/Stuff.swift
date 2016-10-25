//
//  Collection.swift
//  Tablez
//
//  Created by Robert Stjacques Jr on 10/24/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

//
// Maintains a collection of books, movies, and comics.
//
class Stuff: NSObject {
    var comics: [Comic] = []
    var movies: [Movie] = []
    var books: [Book] = []
    
    func addMovie(_ movie: Movie) {
        movies.append(movie)
    }
    
    func getMoviesHeader() -> String {
        return "Movies"
    }
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func getBooksHeader() -> String {
        return "Books"
    }
    
    func addComic(comic: Comic) {
        comics.append(comic)
    }
    
    func getComicsHeader() -> String {
        return "Comics"
    }
    
    // 
    // helper functions for making random stuff
    //
    
    func addRandomMovie() {
        let titles = ["Star Wars", "Star Trek", "Cannonball Run", "Lawrence of Arabia", "The Godfather", "Jaws"]
        let years = [1952, 1965, 1977, 1985, 2005, 2014, 2016]
        
        let rTitleIndex = arc4random_uniform(UInt32(titles.count))
        let rTitle = titles[Int(rTitleIndex)]
        
        let rYearIndex = arc4random_uniform(UInt32(years.count))
        let rYear = years[Int(rYearIndex)]
        
        addMovie(Movie(rTitle, rYear))
    }
    
    func addRandomBook() {
        let titles = ["Insomnia", "The Name of the Wind", "Snowcrash", "War and Peace", "A Tale of Two Cities", "Moby Dick"]
        let authors = ["Stephen King", "Patrick Rothfuss", "Neal Stephenson", "Terry Pratchet", "Neil Gaiman", "Tom Clancy", "Lee Child"]
        
        let rTitleIndex = arc4random_uniform(UInt32(titles.count))
        let rTitle = titles[Int(rTitleIndex)]
        
        let rAuthorIndex = arc4random_uniform(UInt32(authors.count))
        let rAuthor = authors[Int(rAuthorIndex)]
        
        addBook(Book(rTitle, rAuthor))
    }
    
    func addRandomComic() {
        let titles = ["Spider-Man", "Batman", "The Avengers", "Action Comics", "Locke & Key", "Ms. Marvel"]
        let authors = ["Peter David", "Jeff Lemire", "Jason Aaron", "Chris Claremont", "Brian Michael Bendis", "Nick Spencer", "Geoff Johns"]
        let artists = ["Jim Lee", "Stuart Immonen", "David Finch", "Greg Capullo", "Frank Cho", "John Romita Jr.", "Andy Kubert"]
        
        let rTitleIndex = arc4random_uniform(UInt32(titles.count))
        let rTitle = titles[Int(rTitleIndex)]
        
        let rAuthorIndex = arc4random_uniform(UInt32(authors.count))
        let rAuthor = authors[Int(rAuthorIndex)]
        
        let rArtistInidex = arc4random_uniform(UInt32(artists.count))
        let rArtist = artists[Int(rArtistInidex)]
        
        addBook(Comic(rTitle, rAuthor, rArtist))
    }
}
