//
//  ViewController.swift
//  100 Days Of
//
//  Created by Mustafa Adnan Tatlıcı on 27.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    /// layer that draws a cubic Bezier spline in its coordinate space.
    let shape = CAShapeLayer()
    var durationTimer = 100
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Days of "
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLabelTap()
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
        
        ///path that consists of straight and curved line segments that you can render in your custom views.
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: 150, //size of the circle
                                      startAngle: -(.pi / 2), //.pi = 180/2 = 90
                                      endAngle: .pi * 2, //.pi = 180*2 = 360
                                      clockwise: true) // draws the circle in clockwise fashion way.
        
        let trackPath = CAShapeLayer() ///A layer that draws a cubic Bezier spline in its coordinate space.
        trackPath.path = circlePath.cgPath
        trackPath.fillColor = UIColor.clear.cgColor
        trackPath.strokeColor = UIColor(red: 0.3001555204, green: 0.3101341724, blue: 0.5038499832, alpha: 1).cgColor
        trackPath.lineWidth = 15
        view.layer.addSublayer(trackPath)
        
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor(red: 0.3819528222, green: 0.8536232114, blue: 0.4215450883, alpha: 1).cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        
        view.layer.addSublayer(shape)
     
    }
    
    //animation method
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = CFTimeInterval(durationTimer)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true
        shape.add(animation, forKey: "animation")
        
    }
    
    func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.label.isUserInteractionEnabled = true
        self.label.addGestureRecognizer(labelTap)
        
    }
    
   
    
}
