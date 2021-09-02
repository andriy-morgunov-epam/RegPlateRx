//
//  PlateUACell.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/25/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
//import RxCocoa

class PlateUACell : UITableViewCell
{
    private var disposeBag = DisposeBag()
    
    @IBOutlet weak var bodyLabel : UILabel!
    
    var plate : PlateUAViewModel? {
        
        didSet {
            
            guard let plateVM = plate else {
                return
            }
            
            plateVM.body?
                .subscribe(
                    onNext: {[weak self] body in
                        self?.bodyLabel.text = body
                    }
                )
                .disposed(by: self.disposeBag)
            
        }
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
}
