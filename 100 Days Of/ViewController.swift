//
//  ViewController.swift
//  100 Days Of
//
//  Created by Mustafa Adnan Tatlıcı on 27.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let shape = CAShapeLayer()
    var durationTimer = 100
    var trackPath: UIProgressView!
    var text: String?

    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Days of"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLabelTap()
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
       
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 200, y: 100)
        label.textAlignment = .center
        label.text = "#100DaysOf\(text!)"
        self.view.addSubview(label)
        label.textColor = UIColor(red: 0.3819528222, green: 0.8536232114, blue: 0.4215450883, alpha: 1)
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: 150,
                                      startAngle: -(.pi / 2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        let trackPath = CAShapeLayer()
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
        
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = shape.strokeEnd
        animation.toValue = min(1, shape.strokeEnd + 0.01)
        animation.duration = CFTimeInterval(durationTimer)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true
        shape.add(animation, forKey: "animation")
        shape.strokeEnd = animation.toValue as! CGFloat
        let percent = Int(shape.strokeEnd * 100)
        label.text = "\(percent) of Days"
        
        if shape.strokeEnd == 1 {
               shape.removeAnimation(forKey: "animation")
               shape.strokeEnd = 0
               label.text = "Days of"
           } else {
               shape.strokeEnd = animation.toValue as! CGFloat
           }
        

    }

    
    
    
    func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.label.isUserInteractionEnabled = true
        self.label.addGestureRecognizer(labelTap)
        
    }
    
   
    
}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag && shape.strokeEnd == 1 {
            shape.removeAnimation(forKey: "animation")
            shape.strokeEnd = 0
            label.text = "Days of"
        }
    }
}
