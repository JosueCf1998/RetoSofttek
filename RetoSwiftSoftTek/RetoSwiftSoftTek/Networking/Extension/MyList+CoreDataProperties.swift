//
//  MyList+CoreDataProperties.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 6/10/24.
//

import Foundation
import CoreData
import UIKit

extension Movie {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var overview: String?
    @NSManaged public var posterPath: String?
    @NSManaged public var voteAverage: String?
}



//extension Movie: Identifiable {
//
//}

extension Movie {
    
//    @objc(addRemindersObject:)
//    @NSManaged public func addToReminders(_ value: Reminder)
//
//    @objc(removeRemindersObject:)
//    @NSManaged public func removeFromReminders(_ value: Reminder)
//
//    @objc(addReminders:)
//    @NSManaged public func addToReminders(_ values: NSSet)
//
//    @objc(removeReminders:)
//    @NSManaged public func removeFromReminders(_ values: NSSet)
    
}

extension Movie {
//    func toMovie() -> Movie {
//        return Movie(
//            id: self.objectID.uriRepresentation().lastPathComponent as! UUID,
//            title: self.title,
//            releaseDate: self.releaseDate,
//            rating: self.rating,
//            genre: self.genre,
//            description: self.movieDescription
//        )
//    }
}

//extension Movie {
//    init(from entity: MovieEntity) {
//        self.id = entity.objectID.uriRepresentation().lastPathComponent as! UUID
//        self.title = entity.title
//        self.releaseDate = entity.releaseDate
//        self.rating = entity.rating
//        self.genre = entity.genre
//        self.description = entity.movieDescription
//    }
//}


