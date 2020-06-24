//
//  Users+CoreDataProperties.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/24.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var signupDate: Date?

}
