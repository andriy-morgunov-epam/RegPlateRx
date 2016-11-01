//
//  PlatesUAViewController.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PlatesUAViewController: UIViewController
{
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var searchBar : UISearchBar!
    
    var viewModel : PlatesUAViewModel = PlatesUAViewModel(UA.CountryPlates())
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName:"PlateUACell", bundle: nil), forCellReuseIdentifier: "PlateUACell")

        viewModel.items.rx_elements()
            .bindTo(tableView.rx.items(cellIdentifier: "PlateUACell", cellType: PlateUACell.self)) {
            
            (index, plateViewModel: PlateUAViewModel, cell) in
            
            cell.plate = plateViewModel
            
            }.addDisposableTo(disposeBag)
        
        (searchBar.rx.text<->viewModel.search).addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PlatesUAViewController: UITableViewDelegate
{
}



