//
//  Categorie+CoreDataProperties.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//
//

import Foundation
import CoreData


extension Categorie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categorie> {
        return NSFetchRequest<Categorie>(entityName: "Categorie")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var total: Int16
    @NSManaged public var spent: Int16
    @NSManaged public var color: String?
    
    var left: Int {
        Int(total - spent)
    }
    
    var progress: Float {
        Float(spent) / Float(total)
    }

}

extension Categorie : Identifiable {

}
