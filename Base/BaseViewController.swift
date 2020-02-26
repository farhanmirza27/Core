//
//  BaseViewController.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 12/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

// BaseViewController that handles Save Area configuration.

class BaseViewController: UIViewController {
    var saveAreaView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // Setup sub-views
    private func setupView() {
        view.addSubview(saveAreaView)
        
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                saveAreaView.topAnchor.constraint(equalTo: guide.topAnchor),
                saveAreaView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
                saveAreaView.leftAnchor.constraint(equalTo: guide.leftAnchor),
                saveAreaView.rightAnchor.constraint(equalTo: guide.rightAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                saveAreaView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                saveAreaView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                saveAreaView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
                saveAreaView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
            ])
        }
    }
    
    // load view
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.AppColor.defaultWhite
        setupView()
    }
    
}

