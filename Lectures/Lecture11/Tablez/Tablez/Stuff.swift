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
    
    //
    // comics
    //
    
    func addComic(_ comic: Comic) -> Int? {
        comics.append(comic)
        return comics.index(of: comic)
    }
    
    func removeComic(_ comic: Comic) {
        if let index = comics.index(of: comic) {
            comics.remove(at: index)
        }
    }
    
    func moveComic(_ fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let comic = comics[fromIndex]
            comics.remove(at: fromIndex)
            comics.insert(comic, at: toIndex)
        }
    }
    
    //
    // movies
    //
    
    func addMovie(_ movie: Movie) -> Int? {
        movies.append(movie)
        return movies.index(of: movie)
    }
    
    func removeMovie(_ movie: Movie) {
        if let index = movies.index(of: movie) {
            movies.remove(at: index)
        }
    }
    
    func moveMovie(_ fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let movie = movies[fromIndex]
            movies.remove(at: fromIndex)
            movies.insert(movie, at: toIndex)
        }
    }
    
    //
    // books
    //
    
    func addBook(_ book: Book) -> Int? {
        books.append(book)
        return books.index(of: book)
    }
    
    func removeBook(_ book: Book) {
        if let index = books.index(of: book) {
            books.remove(at: index)
        }
    }
    
    func moveBook(_ fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let book = books[fromIndex]
            books.remove(at: fromIndex)
            books.insert(book, at: toIndex)
        }
    }
    
    // 
    // helper functions for making random stuff
    //
    
    func addRandomMovie() -> Int? {
        let titles = ["Star Wars", "Star Trek", "Cannonball Run", "Lawrence of Arabia", "The Godfather", "Jaws"]
        let years = [1952, 1965, 1977, 1985, 2005, 2014, 2016]
        
        let rTitleIndex = arc4random_uniform(UInt32(titles.count))
        let rTitle = titles[Int(rTitleIndex)]
        
        let rYearIndex = arc4random_uniform(UInt32(years.count))
        let rYear = years[Int(rYearIndex)]
        
        return addMovie(Movie(rTitle, rYear))
    }
    
    func addRandomBook() -> Int? {
        let titles = ["Insomnia", "The Name of the Wind", "Snowcrash", "War and Peace", "A Tale of Two Cities", "Moby Dick"]
        let authors = ["Stephen King", "Patrick Rothfuss", "Neal Stephenson", "Terry Pratchet", "Neil Gaiman", "Tom Clancy", "Lee Child"]
        
        let rTitleIndex = arc4random_uniform(UInt32(titles.count))
        let rTitle = titles[Int(rTitleIndex)]
        
        let rAuthorIndex = arc4random_uniform(UInt32(authors.count))
        let rAuthor = authors[Int(rAuthorIndex)]
        
        return addBook(Book(rTitle, rAuthor))
    }
    
    func addRandomComic() -> Int? {
        let titles = ["Spider-Man", "Batman", "The Avengers", "Action Comics", "Locke & Key", "Ms. Marvel"]
        let authors = ["Peter David", "Jeff Lemire", "Jason Aaron", "Chris Claremont", "Brian Michael Bendis", "Nick Spencer", "Geoff Johns"]
        let artists = ["Jim Lee", "Stuart Immonen", "David Finch", "Greg Capullo", "Frank Cho", "John Romita Jr.", "Andy Kubert"]
        
        let rTitleIndex = arc4random_uniform(UInt32(titles.count))
        let rTitle = titles[Int(rTitleIndex)]
        
        let rAuthorIndex = arc4random_uniform(UInt32(authors.count))
        let rAuthor = authors[Int(rAuthorIndex)]
        
        let rArtistInidex = arc4random_uniform(UInt32(artists.count))
        let rArtist = artists[Int(rArtistInidex)]
        
        return addComic(Comic(rTitle, rAuthor, rArtist))
    }
}
