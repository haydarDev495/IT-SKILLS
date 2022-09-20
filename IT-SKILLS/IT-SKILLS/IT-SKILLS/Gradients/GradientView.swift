//
//  GradientView.swift
//  IT-SKILLS
//
//  Created by Haydar Bekmuradov on 19.09.22.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradient()
        }
    }
    
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradient()
        }
    }
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        setupGradientColors()
        gradientLayer.startPoint = Point.top.point
        gradientLayer.endPoint = Point.bottom.point
        
    }
    
    private func setupGradientColors() {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    
}
