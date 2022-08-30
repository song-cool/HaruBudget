//
//  PersistentController.swift
//  HaruBudgetWatch
//
//  Created by 송시원 on 2022/08/30.
//

import Foundation
import CoreData

struct PersistentController {
    static let shared = PersistentController()
    ///싱글톤으로 선언
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "AccountBookModel")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores {(storeDesc, error) in
            if let error = error as NSError? {
                fatalError("Failed to load container \(error)")
            }
        }
    }
}
