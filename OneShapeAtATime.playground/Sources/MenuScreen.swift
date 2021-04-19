import Foundation
import UIKit
import PlaygroundSupport

public class MenuScreen: UIView {
    var viewWidth = 500
    var viewHeight = 500
    
    var startTitle = UILabel()
    var startDesc = UILabel()
    var circleView = UIView()
    var squareView = UIView()
    var triangleView = UIView()
    var introButton = UIButton()
    var playBottleButton = UIButton()
    var playmonasButton = UIButton()
    
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
        
        circleView = circleShape()
        self.addSubview(circleView)
        
        squareView = squareShape()
        self.addSubview(squareView)
        
        triangleView = triangleShape()
        self.addSubview(triangleView)
        
        introButton.setTitle("Intro", for: .normal)
        introButton.backgroundColor = UIColor.black
        introButton.frame = CGRect(x: 175, y: 330, width: 150, height: 40)
        introButton.titleLabel?.font = UIFont(name: "Futura", size: 24)
        introButton.layer.cornerRadius = 10
        introButton.addTarget(self, action: #selector(introButtonPressed), for: .touchUpInside)
        self.addSubview(introButton)
        
        playBottleButton.setTitle("Play Bottle", for: .normal)
        playBottleButton.backgroundColor = UIColor.black
        playBottleButton.frame = CGRect(x: 175, y: 380, width: 150, height: 40)
        playBottleButton.titleLabel?.font = UIFont(name: "Futura", size: 24)
        playBottleButton.layer.cornerRadius = 10
        playBottleButton.addTarget(self, action: #selector(playBottleButtonPressed), for: .touchUpInside)
        self.addSubview(playBottleButton)
        
        playmonasButton.setTitle("Play Monas", for: .normal)
        playmonasButton.backgroundColor = UIColor.black
        playmonasButton.frame = CGRect(x: 175, y: 430, width: 150, height: 40)
        playmonasButton.titleLabel?.font = UIFont(name: "Futura", size: 24)
        playmonasButton.layer.cornerRadius = 10
        playmonasButton.addTarget(self, action: #selector(playMonasButtonPressed), for: .touchUpInside)
        self.addSubview(playmonasButton)

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
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
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
    
    @objc func introButtonPressed(sender: UIButton) {
        playButtonSfx()
        self.removeFromSuperview()
        introductionPage()
    }
    
    @objc func playBottleButtonPressed(sender: UIButton) {
        playButtonSfx()
        self.removeFromSuperview()
        scenario0Page()
    }
    
    @objc func playMonasButtonPressed(sender: UIButton) {
        playButtonSfx()
        self.removeFromSuperview()
        scenario1Page()
    }
}

///Displays the Start Page
public func menuPage() {
    PlaygroundPage.current.liveView = MenuScreen(scene: UIView())
}
