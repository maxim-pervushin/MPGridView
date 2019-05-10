//
//  ViewController.swift
//  MPGridView
//
//  Created by Maxim Pervushin on 05/10/2019.
//  Copyright (c) 2019 Maxim Pervushin. All rights reserved.
//

import UIKit
import MPGridView

extension UIColor {
    
    static let gridBackground = UIColor(red: 0.50, green: 0.69, blue: 0.85, alpha: 1.00)
    static let itemBackground = UIColor(red: 0.00, green: 0.39, blue: 0.69, alpha: 1.00)
    static let itemText = UIColor(red: 0.50, green: 0.69, blue: 0.85, alpha: 1.00)
    static let tint = UIColor(red: 0.00, green: 0.39, blue: 0.69, alpha: 1.00)
}

class ViewControllerLayout: UIView {
    
    let directionSegmentedControl = UISegmentedControl(items: ["Left to Right", "Right to Left", "Top to Bottom", "Bottom to Top"])
    
    let insetsTitleLabel = UILabel()
    let insetsStepper = UIStepper()
    let insetsValueLabel = UILabel()
    
    let spacingTitleLabel = UILabel()
    let spacingStepper = UIStepper()
    let spacingValueLabel = UILabel()
    
    let columnsOrRowsTitleLabel = UILabel()
    let columnsOrRowsStepper = UIStepper()
    let columnsOrRowsValueLabel = UILabel()
    
    let heightOrWidthTitleLabel = UILabel()
    let heightOrWidthStepper = UIStepper()
    let heightOrWidthValueLabel = UILabel()
    
    let scrollView = UIScrollView()
    let gridView = GridView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        
        backgroundColor = .white
        
        addSubview(directionSegmentedControl)
        directionSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        directionSegmentedControl.tintColor = .tint
        
        addSubview(insetsTitleLabel)
        insetsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        insetsTitleLabel.text = "Insets"
        
        addSubview(insetsStepper)
        insetsStepper.translatesAutoresizingMaskIntoConstraints = false
        insetsStepper.autorepeat = true
        insetsStepper.minimumValue = 0.0
        insetsStepper.maximumValue = 50.0
        insetsStepper.tintColor = .tint
        
        addSubview(insetsValueLabel)
        insetsValueLabel.translatesAutoresizingMaskIntoConstraints = false
        insetsValueLabel.text = "[Insets]"
        
        
        addSubview(spacingTitleLabel)
        spacingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        spacingTitleLabel.text = "Spacing"
        
        addSubview(spacingStepper)
        spacingStepper.translatesAutoresizingMaskIntoConstraints = false
        spacingStepper.autorepeat = true
        spacingStepper.minimumValue = 0.0
        spacingStepper.maximumValue = 50.0
        spacingStepper.tintColor = .tint
        
        addSubview(spacingValueLabel)
        spacingValueLabel.translatesAutoresizingMaskIntoConstraints = false
        spacingValueLabel.text = "[Spacing]"
        
        
        addSubview(columnsOrRowsTitleLabel)
        columnsOrRowsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        columnsOrRowsTitleLabel.text = "Columns"
        
        addSubview(columnsOrRowsStepper)
        columnsOrRowsStepper.translatesAutoresizingMaskIntoConstraints = false
        columnsOrRowsStepper.autorepeat = true
        columnsOrRowsStepper.minimumValue = 1.0
        columnsOrRowsStepper.maximumValue = 20.0
        columnsOrRowsStepper.tintColor = .tint
        
        addSubview(columnsOrRowsValueLabel)
        columnsOrRowsValueLabel.translatesAutoresizingMaskIntoConstraints = false
        columnsOrRowsValueLabel.text = "[Columns]"
        
        
        addSubview(heightOrWidthTitleLabel)
        heightOrWidthTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        heightOrWidthTitleLabel.text = "Width"
        
        addSubview(heightOrWidthStepper)
        heightOrWidthStepper.translatesAutoresizingMaskIntoConstraints = false
        heightOrWidthStepper.autorepeat = true
        heightOrWidthStepper.value = 50
        heightOrWidthStepper.minimumValue = 10.0
        heightOrWidthStepper.maximumValue = 200.0
        heightOrWidthStepper.tintColor = .tint
        
        addSubview(heightOrWidthValueLabel)
        heightOrWidthValueLabel.translatesAutoresizingMaskIntoConstraints = false
        heightOrWidthValueLabel.text = "[Width]"
        
        
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(gridView)
        gridView.translatesAutoresizingMaskIntoConstraints = false
        gridView.backgroundColor = .gridBackground
        gridView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        gridView.setContentHuggingPriority(.defaultLow, for: .vertical)
        gridView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        gridView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        NSLayoutConstraint.activate([
            directionSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            directionSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            directionSegmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            directionSegmentedControl.heightAnchor.constraint(equalToConstant: 24),
            
            insetsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            insetsTitleLabel.topAnchor.constraint(equalTo: directionSegmentedControl.bottomAnchor, constant: 6),
            
            insetsStepper.leadingAnchor.constraint(greaterThanOrEqualTo: insetsTitleLabel.trailingAnchor, constant: 6),
            insetsStepper.centerXAnchor.constraint(equalTo: centerXAnchor),
            insetsStepper.topAnchor.constraint(equalTo: insetsTitleLabel.topAnchor),
            insetsStepper.bottomAnchor.constraint(equalTo: insetsTitleLabel.bottomAnchor),
            
            insetsValueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: insetsStepper.trailingAnchor, constant: 6),
            insetsValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            insetsValueLabel.topAnchor.constraint(equalTo: insetsTitleLabel.topAnchor),
            insetsValueLabel.bottomAnchor.constraint(equalTo: insetsTitleLabel.bottomAnchor),
            
            spacingTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            spacingTitleLabel.topAnchor.constraint(equalTo: insetsTitleLabel.bottomAnchor, constant: 6),
            
            spacingStepper.leadingAnchor.constraint(greaterThanOrEqualTo: spacingTitleLabel.trailingAnchor, constant: 6),
            spacingStepper.centerXAnchor.constraint(equalTo: centerXAnchor),
            spacingStepper.topAnchor.constraint(equalTo: spacingTitleLabel.topAnchor),
            spacingStepper.bottomAnchor.constraint(equalTo: spacingTitleLabel.bottomAnchor),
            
            spacingValueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: spacingStepper.trailingAnchor, constant: 6),
            spacingValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            spacingValueLabel.topAnchor.constraint(equalTo: spacingTitleLabel.topAnchor),
            spacingValueLabel.bottomAnchor.constraint(equalTo: spacingTitleLabel.bottomAnchor),
            
            columnsOrRowsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            columnsOrRowsTitleLabel.topAnchor.constraint(equalTo: spacingTitleLabel.bottomAnchor, constant: 6),
            
            columnsOrRowsStepper.leadingAnchor.constraint(greaterThanOrEqualTo: columnsOrRowsTitleLabel.trailingAnchor, constant: 6),
            columnsOrRowsStepper.centerXAnchor.constraint(equalTo: centerXAnchor),
            columnsOrRowsStepper.topAnchor.constraint(equalTo: columnsOrRowsTitleLabel.topAnchor),
            columnsOrRowsStepper.bottomAnchor.constraint(equalTo: columnsOrRowsTitleLabel.bottomAnchor),
            
            columnsOrRowsValueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: columnsOrRowsStepper.trailingAnchor, constant: 6),
            columnsOrRowsValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            columnsOrRowsValueLabel.topAnchor.constraint(equalTo: columnsOrRowsTitleLabel.topAnchor),
            columnsOrRowsValueLabel.bottomAnchor.constraint(equalTo: columnsOrRowsTitleLabel.bottomAnchor),
            
            heightOrWidthTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            heightOrWidthTitleLabel.topAnchor.constraint(equalTo: columnsOrRowsTitleLabel.bottomAnchor, constant: 6),
            
            heightOrWidthStepper.leadingAnchor.constraint(greaterThanOrEqualTo: heightOrWidthTitleLabel.trailingAnchor, constant: 6),
            heightOrWidthStepper.centerXAnchor.constraint(equalTo: centerXAnchor),
            heightOrWidthStepper.topAnchor.constraint(equalTo: heightOrWidthTitleLabel.topAnchor),
            heightOrWidthStepper.bottomAnchor.constraint(equalTo: heightOrWidthTitleLabel.bottomAnchor),
            
            heightOrWidthValueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: heightOrWidthStepper.trailingAnchor, constant: 6),
            heightOrWidthValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            heightOrWidthValueLabel.topAnchor.constraint(equalTo: heightOrWidthTitleLabel.topAnchor),
            heightOrWidthValueLabel.bottomAnchor.constraint(equalTo: heightOrWidthTitleLabel.bottomAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            scrollView.topAnchor.constraint(equalTo: heightOrWidthTitleLabel.bottomAnchor, constant: 12),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            ])
    }
}

class ViewController: ContainerVC<ViewControllerLayout> {
    
    var constraints = [NSLayoutConstraint]()
    
    override func loadView() {
        super.loadView()
        
        layoutView?.directionSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        layoutView?.directionSegmentedControl.selectedSegmentIndex = 0
        
        layoutView?.insetsStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        layoutView?.spacingStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        layoutView?.columnsOrRowsStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        layoutView?.heightOrWidthStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        
        //        for i in stride(from: 0, to: 200, by: 1) {
        for i in stride(from: 0, to: 20, by: 1) {
            let arrangedView = UILabel()
            arrangedView.text = "\(i)"
            arrangedView.textAlignment = .center
            arrangedView.backgroundColor = .itemBackground
            arrangedView.textColor = .itemText
            arrangedView.translatesAutoresizingMaskIntoConstraints = false
            layoutView?.gridView.addArrangedSubview(arrangedView)
        }
        
        reloadData()
    }
    
    func reloadData() {
        guard let layoutView = layoutView else {
            return
        }
        
        layoutView.gridView.spacing = CGFloat(layoutView.spacingStepper.value)
        layoutView.spacingValueLabel.text = "\(layoutView.spacingStepper.value)"
        
        layoutView.gridView.insets = UIEdgeInsets(
            top: CGFloat(layoutView.insetsStepper.value),
            left: CGFloat(layoutView.insetsStepper.value),
            bottom: CGFloat(layoutView.insetsStepper.value),
            right: CGFloat(layoutView.insetsStepper.value)
        )
        layoutView.insetsValueLabel.text = "\(layoutView.gridView.insets.top)"
        
        let columnsOrRows = Int(layoutView.columnsOrRowsStepper.value)
        layoutView.columnsOrRowsValueLabel.text = "\(columnsOrRows)"
        
        let heightOrWidth = CGFloat(layoutView.heightOrWidthStepper.value)
        layoutView.heightOrWidthValueLabel.text = "\(heightOrWidth)"
        
        if layoutView.directionSegmentedControl.selectedSegmentIndex == 0 {
            layoutView.columnsOrRowsTitleLabel.text = "Columns"
            layoutView.heightOrWidthTitleLabel.text = "Height"
            
            NSLayoutConstraint.deactivate(self.constraints)
            layoutView.gridView.direction = .leftToRight(columnCount: columnsOrRows, height: heightOrWidth)
            
            self.constraints = [
                layoutView.gridView.leadingAnchor.constraint(equalTo: layoutView.scrollView.leadingAnchor),
                layoutView.gridView.widthAnchor.constraint(equalTo: layoutView.scrollView.widthAnchor),
                layoutView.gridView.topAnchor.constraint(equalTo: layoutView.scrollView.topAnchor),
                layoutView.gridView.bottomAnchor.constraint(equalTo: layoutView.scrollView.bottomAnchor),
            ]
            NSLayoutConstraint.activate(self.constraints)
            
        } else if layoutView.directionSegmentedControl.selectedSegmentIndex == 1 {
            layoutView.columnsOrRowsTitleLabel.text = "Columns"
            layoutView.heightOrWidthTitleLabel.text = "Height"
            
            NSLayoutConstraint.deactivate(self.constraints)
            layoutView.gridView.direction = .rightToLeft(columnCount: columnsOrRows, height: heightOrWidth)
            
            self.constraints = [
                layoutView.gridView.leadingAnchor.constraint(equalTo: layoutView.scrollView.leadingAnchor),
                layoutView.gridView.widthAnchor.constraint(equalTo: layoutView.scrollView.widthAnchor),
                layoutView.gridView.topAnchor.constraint(equalTo: layoutView.scrollView.topAnchor),
                layoutView.gridView.bottomAnchor.constraint(equalTo: layoutView.scrollView.bottomAnchor),
            ]
            NSLayoutConstraint.activate(self.constraints)
            
        } else if layoutView.directionSegmentedControl.selectedSegmentIndex == 2 {
            layoutView.columnsOrRowsTitleLabel.text = "Rows"
            layoutView.heightOrWidthTitleLabel.text = "Width"
            
            NSLayoutConstraint.deactivate(self.constraints)
            layoutView.gridView.direction = .topToBottom(rowCount: columnsOrRows, width: heightOrWidth)
            
            self.constraints = [
                layoutView.gridView.leadingAnchor.constraint(equalTo: layoutView.scrollView.leadingAnchor),
                layoutView.gridView.trailingAnchor.constraint(equalTo: layoutView.scrollView.trailingAnchor),
                layoutView.gridView.topAnchor.constraint(equalTo: layoutView.scrollView.topAnchor),
                layoutView.gridView.heightAnchor.constraint(equalTo: layoutView.scrollView.heightAnchor),
            ]
            NSLayoutConstraint.activate(self.constraints)
            
        } else {
            layoutView.columnsOrRowsTitleLabel.text = "Rows"
            layoutView.heightOrWidthTitleLabel.text = "Width"
            
            NSLayoutConstraint.deactivate(self.constraints)
            layoutView.gridView.direction = .bottomToTop(rowCount: columnsOrRows, width: heightOrWidth)
            
            self.constraints = [
                layoutView.gridView.leadingAnchor.constraint(equalTo: layoutView.scrollView.leadingAnchor),
                layoutView.gridView.trailingAnchor.constraint(equalTo: layoutView.scrollView.trailingAnchor),
                layoutView.gridView.topAnchor.constraint(equalTo: layoutView.scrollView.topAnchor),
                layoutView.gridView.heightAnchor.constraint(equalTo: layoutView.scrollView.heightAnchor),
            ]
            NSLayoutConstraint.activate(self.constraints)
        }
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        reloadData()
    }
    
    @objc private func stepperValueChanged(_ sender: UIStepper) {
        reloadData()
    }
}
