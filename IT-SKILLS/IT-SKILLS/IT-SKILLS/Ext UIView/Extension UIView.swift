//
//  Extension UIView.swift
//  IT-SKILLS
//
//  Created by Haydar Bekmuradov on 19.09.22.
//

import Foundation
import UIKit

public extension UIView {
    func setGradients(colorOne: UIColor,
                      colorTwo: UIColor,
                      startPoint: CGPoint,
                      endPoint: CGPoint) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint

        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setThreeGradients(colorOne: UIColor,
                           colorTwo: UIColor,
                           colorThree: UIColor,
                           startPoint: CGPoint,
                           endPoint: CGPoint) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint

        layer.insertSublayer(gradientLayer, at: 0)
    }


    private static let kLayerNameGradientBorder = "GradientBorderLayer"

    func setGradientBorder(width: CGFloat, colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        let existedBorder = gradientBorderLayer()
        let border = existedBorder ?? CAGradientLayer()
        border.frame = bounds
        border.colors = colors.map { $0.cgColor }
        border.startPoint = startPoint
        border.endPoint = endPoint

        let mask = CAShapeLayer()
        mask.path = UIBezierPath(roundedRect: bounds, cornerRadius: 0).cgPath
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        mask.lineWidth = width

        border.mask = mask

        let exists = existedBorder != nil
        if !exists {
            layer.addSublayer(border)
        }
    }

    func removeGradientBorder() {
        self.gradientBorderLayer()?.removeFromSuperlayer()
    }

    private func gradientBorderLayer() -> CAGradientLayer? {
        let borderLayers = layer.sublayers?.filter { $0.name == UIView.kLayerNameGradientBorder }
        if borderLayers?.count ?? 0 > 1 {
            fatalError()
        }
        return borderLayers?.first as? CAGradientLayer
    }
}
