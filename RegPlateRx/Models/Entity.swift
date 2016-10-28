//
//  Entity.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

// Entity

protocol EntityCRUDProtocol : class
{
    associatedtype EntityType
    
    static func create() -> EntityType
}

protocol EntityProvider
{
    associatedtype EntityType
    associatedtype EntityFilterType
    associatedtype EntityCRUDType
    
    func getWithFilter(filter : EntityFilterType) -> [EntityType]
    
    var crudInterface : EntityCRUDType { get }
}

