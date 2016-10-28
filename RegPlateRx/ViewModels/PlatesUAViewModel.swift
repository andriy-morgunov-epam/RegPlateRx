//
//  PlatesUAViewModel.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/21/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation
import RxSwift

class PlatesUAViewModel
{
    var disposeBag = DisposeBag()
    
    let model : UA.CountryPlates
    
    var search : Variable<String?> = Variable("AA")
    var items : Observable<[PlateUAViewModel]> = Observable<[PlateUAViewModel]>.empty()
    
    init (_ model : UA.CountryPlates)
    {
        self.model = model
        
        // testing ONLY
        // model.plug_stub()
        
        search.asObservable().subscribe(onNext:{ [weak self] (text) in
            
            self?.refresh(text ?? "")
            
        }).addDisposableTo(disposeBag)
    }
    
    func refresh(_ filter : String) -> Void
    {
        if let items = self.model.provider?.getWithFilter(filter: filter)
        {
            var vms : [PlateUAViewModel] = []
            
            for item in items
            {
                vms.append(createViewModelWithModel(model: item))
            }
            self.items = Observable.just(vms)
        }
    }
    
    private func createViewModelWithModel(model : UA.CountryPlate) -> PlateUAViewModel
    {
        let result = PlateUAViewModel(model)
        
        return result
    }
}
