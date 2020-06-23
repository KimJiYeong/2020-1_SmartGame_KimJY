//
//  Entity+CoreDataProperties.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/24.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var datatarano: String?
    @NSManaged public var id: Int64
    @NSManaged public var devices: [String]?

}
