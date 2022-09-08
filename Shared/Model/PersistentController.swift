//
//  PersistentController.swift
//  HaruBudgetWatch
//
//  Created by 송시원 on 2022/08/30.
//

import Foundation
import CoreData
import CloudKit

struct PersistentController {
    static let shared = PersistentController()
    ///싱글톤으로 선언
    
    //클라우드킷으로 변경.
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "AccountBookModel")
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
