//
//  DataManager.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 1/07/22.
//

import Foundation
import CoreData

class DataManager {
    
    static let current = DataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "Peliculas")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR EN LA LECTURA DE LA BASE DE DATOS: \(error.localizedDescription)")
            }
        }
  
        return container
    }()
    
    func saveContext() {
        let context = self.persistentContainer.viewContext
        if context.hasChanges {
            try? context.save()
        }
    }
}
