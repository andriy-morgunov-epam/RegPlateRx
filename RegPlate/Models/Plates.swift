//
//  Plates.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

// Plates
protocol PlatesProtocol {
    associatedtype FilterType
    associatedtype PlateValueType
    associatedtype PlateType
    associatedtype PlateProviderType
    
    var provider : PlateProviderType? { get }
}

class Plates<F, V, T : PlateProtocol> : PlatesProtocol {
    typealias FilterType = F
    typealias PlateType = T
    typealias PlateValueType = V
    typealias PlateProviderType = PlateProvider<V, F, T>

    var provider : PlateProviderType?
    
    init() {
    }
    
    init(_ provider : PlateProviderType) {
        self.provider = provider
    }
}

