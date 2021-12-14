//
//  Plate.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

// Plate
protocol PlateProtocol {

    associatedtype PlateType
    var value : PlateType? { get set }
    
    var properties : [String: AnyObject] { get set }
    
    func asString() -> String
}

class Plate<V> : PlateProtocol, Identifiable {

    var value : V?
    
    var properties : [String: AnyObject] = [:]
    
    init() {
    }

    init(_ value : V) {
        self.value = value
    }

    func asString() -> String {
        var result = ""
        
        if let val = self.value as? String {
            result = val
        }
        return result
    }
}

class PlateFactory<V, T : PlateProtocol> : EntityCRUDProtocol {

    static func create() -> T? {
        return Plate<V>() as? T
    }
    
    static func create(value : V) -> T? {
        return Plate<V>(value) as? T
    }
}

class PlateProvider<V, F, T : PlateProtocol> : EntityProvider {
    
    func plates(with filter : F) -> [T] {
        return []
    }
    
    var crudInterface = PlateFactory<V, T>()
}
