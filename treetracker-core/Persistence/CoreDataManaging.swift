//
//  CoreDataManaging.swift
//  Treetracker-Core
//
//  Created by Alex Cornforth on 18/09/2023.
//

import CoreData

public protocol CoreDataManaging {
    var viewContext: NSManagedObjectContext { get }
    func saveContext()
    func perform<T: NSFetchRequestResult>(fetchRequest: NSFetchRequest<T>) -> [T]?
}

extension CoreDataManaging {

    func perform<T: NSFetchRequestResult>(fetchRequest: NSFetchRequest<T>) -> [T]? {
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            return nil
        }
    }
}
