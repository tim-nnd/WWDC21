import Foundation
import UIKit
import PlaygroundSupport

public class StartScreen: UIView {
    var viewWidth = 500
    var viewHeight = 500
    
    var startTitle = UILabel()
    var startDesc = UILabel()
    var circleView = UIView()
    var squareView = UIView()
    var triangleView = UIView()
    var startButton = UIButton()
    
    var infoLabel = UILabel()
    
    var draggedView = ""
    
    public init(scene: UIView) {
        super.init(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = UIColor.white
        
        startTitle.text = "One Shape at a Time"
        startTitle.textColor = UIColor.black
        startTitle.font = UIFont(name: "Futura", size: 30)
        startTitle.frame = CGRect(x: 0, y: -190, width: viewWidth, height: viewHeight)
        startTitle.textAlignment = .center
        self.addSubview(startTitle)
        
        startDesc.text = "Compose your canvas with simple shapes!"
        startDesc.textColor = UIColor.black
        startDesc.font = UIFont(name: "Futura", size: 18)
        startDesc.frame = CGRect(x: 0, y: -150, width: viewWidth, height: viewHeight)
        startDesc.textAlignment = .center
        self.addSubview(startDesc)
        
        infoLabel.text = "These shapes can be moved by dragging them!"
        infoLabel.textColor = UIColor.black
        infoLabel.font = UIFont(name: "Futura", size: 16)
        infoLabel.frame = CGRect(x: 0, y: 55, width: viewWidth, height: viewHeight)
        infoLabel.textAlignment = .center
        infoLabel.alpha = 1
        self.addSubview(infoLabel)
        
        circleView = circleShape()
        self.addSubview(circleView)
        
        squareView = squareShape()
        self.addSubview(squareView)
        
        triangleView = triangleShape()
        self.addSubview(triangleView)
        
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = UIColor.black
        startButton.frame = CGRect(x: 190, y: 380, width: 120, height: 50)
        startButton.titleLabel?.font = UIFont(name: "Futura", size: 30)
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        self.addSubview(startButton)
    }
    
    func circleShape() -> UIView {
        let container = UIView(frame: CGRect(x: 170, y: 205, width: 80, height: 80))
        container.layer.borderWidth = 5
        container.layer.borderColor = UIColor.black.cgColor
        container.layer.cornerRadius = 40
        return container
    }
    
    func squareShape() -> UIView {
        let container = UIView(frame: CGRect(x: 265, y: 210, width: 70, height: 70))
        container.layer.borderWidth = 5
        container.layer.borderColor = UIColor.black.cgColor
        return container
    }
    
    func triangleShape() -> UIView {
        let container = UIView(frame: CGRect(x: 210, y: 160, width: 90, height: 80))
        
        let layerHeight = container.layer.frame.height
        let layerWidth = container.layer.frame.width
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: layerHeight))
        bezierPath.addLine(to: CGPoint(x: layerWidth, y: layerHeight))
        bezierPath.addLine(to: CGPoint(x: layerWidth / 2, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: layerHeight))
        bezierPath.close()
        bezierPath.fill()
        
        let shape = CAShapeLayer()
        shape.path = bezierPath.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        shape.lineWidth = 5
        container.layer.addSublayer(shape)
        
        return container
    }
    
    func hideInfoLabel() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.infoLabel.alpha = 0
        }, completion: {_ in
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                
            })
        })
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if infoLabel.alpha == 1 {
                hideInfoLabel()
            }
            
            if circleView.frame.contains(location) {
                draggedView = "circle"
                circleView.center = location
            }
            else if squareView.frame.contains(location) {
                draggedView = "square"
                squareView.center = location
            }
            else if triangleView.frame.contains(location) {
                draggedView = "triangle"
                triangleView.center = location
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if circleView.frame.contains(location) && draggedView == "circle" {
                circleView.center = location
            }
            else if squareView.frame.contains(location) && draggedView == "square" {
                squareView.center = location
            }
            else if triangleView.frame.contains(location) && draggedView == "triangle" {
                triangleView.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        draggedView = ""
    }
    
    @objc func startButtonPressed(sender: UIButton) {
        playPlaygroundBgm()
        self.removeFromSuperview()
        introductionPage()
    }
}

///Displays the Start Page
public func startPage() {
    PlaygroundPage.current.liveView = StartScreen(scene: UIView())
}
