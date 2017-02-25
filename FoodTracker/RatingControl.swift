//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Daria Daria on 2017-02-23.
//  Copyright © 2017 d.sirous. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0)
    @IBInspectable var starCount: Int = 5
    
    private var ratingButtons = [UIButton]();
    var rating = 0;
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setupButtons();
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder);
        self.setupButtons();
    }
    
    func loadButtonImages(button: UIButton) {
        let bundle = Bundle(for: type(of: self));
        let filledStar = UIImage(named: "FilledStar", in: bundle, compatibleWith: self.traitCollection);
        let emptyStar = UIImage(named:"EmptyStar", in: bundle, compatibleWith: self.traitCollection);
        let highlightedStar = UIImage(named:"HighlitedStar", in: bundle, compatibleWith: self.traitCollection);
        
        button.setImage(emptyStar, for: .normal);
        button.setImage(filledStar, for: .selected);
        button.setImage(highlightedStar, for: .highlighted);
        button.setImage(highlightedStar, for: [.highlighted, .selected]);
    }
    
    private func setupButtons() {
        for _ in 0..<starCount {
            let button = UIButton();
            
            loadButtonImages(button: button);
            button.translatesAutoresizingMaskIntoConstraints = false;
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true;
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true;
        
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside);
            
            addArrangedSubview(button);
            ratingButtons.append(button)
        }
        self.updateButtonSelectionStates();
    }
    
    func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        };
        
        let selectedRating = index + 1;
        
        if (selectedRating == rating) {
            rating = 0;
        } else {
            rating = selectedRating;
        }
        updateButtonSelectionStates();
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = (index < rating);
        }
    }

}
