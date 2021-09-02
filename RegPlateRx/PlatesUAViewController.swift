//
//  PlatesUAViewController.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import UIKit
import RxSwift
//import RxCocoa

class PlatesUAViewController: UIViewController
{
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var searchBar : UISearchBar!
    
    private var viewModel : PlatesUAViewModel = PlatesUAViewModel(UA.CountryPlates())
    private var items: [PlateUAViewModel] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName:"PlateUACell", bundle: nil), forCellReuseIdentifier: "PlateUACell")
        self.searchBar.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.viewModel.items.rx_elements()
            .subscribe(
                onNext: {[weak self] items in
                    self?.items = items
                    self?.tableView.reloadData()
                }
            )
            .disposed(by: self.disposeBag)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PlatesUAViewController: UITableViewDelegate {
}

extension PlatesUAViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "PlateUACell", for: indexPath) as? PlateUACell else { return UITableViewCell() }
        
        cell.plate = self.items[indexPath.row]
        
        return cell
    }
}

extension PlatesUAViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.search.onNext(searchText)
    }
}



