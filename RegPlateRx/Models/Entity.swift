//
//  Entity.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

// Entity
protocol EntityCRUDProtocol: AnyObject {
    associatedtype EntityType
    
    static func create() -> EntityType
}

protocol EntityProvider {
    associatedtype EntityType
    associatedtype EntityFilterType
    associatedtype EntityCRUDType
    
    func plates(with filter : EntityFilterType) -> [EntityType]
    
    var crudInterface : EntityCRUDType { get }
}

