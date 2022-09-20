//
//  ViewController.swift
//  IT-SKILLS
//
//  Created by Haydar Bekmuradov on 19.09.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var smartScanButton: UIButton!
    @IBOutlet weak var proView: GradientView!
    @IBOutlet var fourViews: [UIView]!
    @IBOutlet var thinViews: [UIView]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradients()
        setupIcon()
    }
    
    // STATUS BAR change to light
    override var preferredStatusBarStyle: UIStatusBarStyle {
       return .lightContent
   }
    
    // TAbBAR Icon
    private func setupIcon() {
        tabBarItem.selectedImage = UIImage(named: "cleanerPressed")
        tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: -10, bottom: -6, right: -10);
    }
    
    // GRADIENTS
    private func setupGradients() {
        buttonGradient()
        proViewGradient()
        fourViewsGradient()
        thinViewsGradient()
    }
    
    private func buttonGradient() {
        let buttonColorFirst = #colorLiteral(red: 0.8784313725, green: 1, blue: 0.9568627451, alpha: 1)
        let buttonColorSecond = #colorLiteral(red: 0.6745098039, green: 0.7294117647, blue: 0.9764705882, alpha: 1)
        
        smartScanButton.setGradients(colorOne: buttonColorFirst,
                                     colorTwo: buttonColorSecond,
                                     startPoint: Point.leading.point,
                                     endPoint: Point.trailing.point)
    }
    
    private func proViewGradient() {
        let proViewColorFirst = #colorLiteral(red: 0.8784313725, green: 1, blue: 0.8862745098, alpha: 1)
        let proViewColorSecond = #colorLiteral(red: 0.6745098039, green: 0.7294117647, blue: 0.9764705882, alpha: 1)
        
        proView.setGradients(colorOne: proViewColorFirst,
                                     colorTwo: proViewColorSecond,
                                     startPoint: Point.top.point,
                                     endPoint: Point.bottom.point)
    }
    
    private func fourViewsGradient() {
        let planetViewsColorFirst = #colorLiteral(red: 0.07843137255, green: 0.1176470588, blue: 0.368627451, alpha: 1)
        let planetViewsColorSecond = #colorLiteral(red: 0.03137254902, green: 0.05098039216, blue: 0.2, alpha: 1)
        fourViews.forEach { view in
            view.setGradients(colorOne: planetViewsColorFirst,
                              colorTwo: planetViewsColorSecond,
                              startPoint: Point.top.point,
                              endPoint: Point.bottom.point)

            let borderColorOne = #colorLiteral(red: 0.04705882353, green: 0.7137254902, blue: 0.8588235294, alpha: 0)
            let borderColorTwo = #colorLiteral(red: 0.2823529412, green: 0.337254902, blue: 0.6745098039, alpha: 0.6)
            view.setGradientBorder(width: 5,
                                   colors: [borderColorOne,borderColorTwo],
                                   startPoint: Point.top.point,
                                   endPoint: Point.bottom.point)
        }
    }
    
    private func thinViewsGradient() {
        let colorOneThree = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        let colorTwo = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.29)
        thinViews.forEach { view in
            view.setThreeGradients(colorOne: colorOneThree,
                                   colorTwo: colorTwo,
                                   colorThree: colorOneThree,
                                   startPoint: Point.leading.point,
                                   endPoint: Point.trailing.point)
        }
    }
}
