//
//  ContainerVC.swift
//  MPGridView_Example
//
//  Created by Maxim Pervushin on 10/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class ContainerVC<LayoutView: UIView>: UIViewController {
    
    var adjustsPreferredContentSize = false {
        didSet {
            view.setNeedsLayout()
        }
    }
    
    var layoutView: LayoutView? {
        return view as? LayoutView
    }
    
    override func loadView() {
        view = LayoutView()
    }
    
    override func viewWillLayoutSubviews() {
        if adjustsPreferredContentSize {
            preferredContentSize = view.intrinsicContentSize
        }
        super.viewWillLayoutSubviews()
    }
}
