//
//  HostingViewController.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 29.09.2021.
//  Copyright © 2021 Andriy Morgunov. All rights reserved.
//

import UIKit
import SwiftUI
import Foundation

final class HostingViewController: UIViewController
{
    private let contentView = UIHostingController(rootView: PlateListUIView(models: []))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChild(self.contentView)
        self.view.addSubview(self.contentView.view)

        self.contentView.view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.contentView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.contentView.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.contentView.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
}
