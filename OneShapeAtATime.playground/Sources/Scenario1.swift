import Foundation
import UIKit
import PlaygroundSupport

public class Scenario1: UIView {
    var viewWidth = 500
    var viewHeight = 500
    
    var monasImage = UIImageView()
    
    var hintButton = UIButton()
    var hintToggled = false
    var opacityButton = UIButton()
    var opacityToggled = false
    
    var monasTopHint = UIView()
    var monasTopFrame = CGRect(x: 330, y: 80, width: 22, height: 34)
    
    var monasNeckHint = UIView()
    var monasNeckFrame = CGRect(x: 315, y: 113, width: 51, height: 23)
    
    var monasBodyHint = UIView()
    var monasBodyFrame = CGRect(x: 321, y: 136, width: 38, height: 277)
    
    var monasBottomNeckHint = UIView()
    var monasBottomNeckFrame = CGRect(x: 236, y: 412, width: 208, height: 14)
    
    var monasBottomHint = UIView()
    var monasBottomFrame = CGRect(x: 252, y: 426, width: 176, height: 28)
    
    var monasTop = UIView()
    var monasNeck = UIView()
    var monasBody = UIView()
    var monasBottomNeck = UIView()
    var monasBottom = UIView()
    
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
        
        monasImage.image = UIImage(named: "monas-small.jpg")
        monasImage.frame = CGRect(x: 140, y: 0, width: 400, height: 500)
        monasImage.contentMode = .scaleAspectFit
        monasImage.alpha = 1
        self.addSubview(monasImage)
        
        hintButton.setTitle("Hint", for: .normal)
        hintButton.frame = CGRect(x: 10, y: 10, width: 65, height: 30)
        hintButton.titleLabel?.font = UIFont(name: "Futura", size: 18)
        hintButton.backgroundColor = UIColor.gray
        hintButton.layer.cornerRadius = 6
        hintButton.addTarget(self, action: #selector(hintButtonPressed), for: .touchUpInside)
        self.addSubview(hintButton)
        
        opacityButton.setTitle("Opacity", for: .normal)
        opacityButton.frame = CGRect(x: 85, y: 10, width: 80, height: 30)
        opacityButton.titleLabel?.font = UIFont(name: "Futura", size: 18)
        opacityButton.backgroundColor = UIColor.gray
        opacityButton.layer.cornerRadius = 6
        opacityButton.addTarget(self, action: #selector(opacityButtonPressed), for: .touchUpInside)
        self.addSubview(opacityButton)
        
        monasTopHint = topShape(color: UIColor.red)
        monasTopHint.alpha = 0
        self.addSubview(monasTopHint)
        
        monasNeckHint = neckShape(color: UIColor.red)
        monasNeckHint.alpha = 0
        self.addSubview(monasNeckHint)
        
        monasBodyHint = bodyShape(color: UIColor.red)
        monasBodyHint.alpha = 0
        self.addSubview(monasBodyHint)
        
        monasBottomNeckHint = bottomNeckShape(color: UIColor.red)
        monasBottomNeckHint.alpha = 0
        self.addSubview(monasBottomNeckHint)
        
        monasBottomHint = bottomShape(color: UIColor.red)
        monasBottomHint.alpha = 0
        self.addSubview(monasBottomHint)
        
        monasTop = topShape(color: UIColor.black)
        monasTop.alpha = 1
        self.addSubview(monasTop)
        
        monasNeck = neckShape(color: UIColor.black)
        monasNeck.alpha = 1
        self.addSubview(monasNeck)
        
        monasBody = bodyShape(color: UIColor.black)
        monasBody.alpha = 1
        monasBody.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.addSubview(monasBody)
        
        monasBottomNeck = bottomNeckShape(color: UIColor.black)
        monasBottomNeck.alpha = 1
        monasBottomNeck.transform = CGAffineTransform(scaleX: 0.55, y: 0.55)
        self.addSubview(monasBottomNeck)
        
        monasBottom = bottomShape(color: UIColor.black)
        monasBottom.alpha = 1
        monasBottom.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        self.addSubview(monasBottom)
        
        setShapesPosition()
    }
    
    func setShapesPosition() {
        monasTop.center = CGPoint(x: 130, y: 80)
        monasNeck.center = CGPoint(x: 70, y: 80)
        monasBody.center = CGPoint(x: 100, y: 270)
        monasBottomNeck.center = CGPoint(x: 100, y: 405)
        monasBottom.center = CGPoint(x: 100, y: 125)
    }
    
    @objc func hintButtonPressed(sender: UIButton) {
        playButtonSfx()
        hintToggled.toggle()
        
        if hintToggled {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.hintButton.backgroundColor = UIColor.systemBlue
                self.showHint()
            }, completion: {_ in
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (time) in
                    
                })
            })
        }
        else {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.hintButton.backgroundColor = UIColor.gray
                self.hideHint()
            }, completion: {_ in
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (time) in
                    
                })
            })
        }
    }
    
    @objc func opacityButtonPressed(sender: UIButton) {
        playButtonSfx()
        opacityToggled.toggle()
        
        if opacityToggled {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.opacityButton.backgroundColor = UIColor.systemBlue
                self.halfOpacity()
            }, completion: {_ in
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (time) in
                    
                })
            })
        }
        else {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.opacityButton.backgroundColor = UIColor.gray
                self.fullOpacity()
            }, completion: {_ in
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (time) in
                    
                })
            })
        }
    }
    
    func showHint() {
        self.monasTopHint.alpha = 1
        self.monasNeckHint.alpha = 1
        self.monasBodyHint.alpha = 1
        self.monasBottomNeckHint.alpha = 1
        self.monasBottomHint.alpha = 1
    }
    
    func hideHint() {
        self.monasTopHint.alpha = 0
        self.monasNeckHint.alpha = 0
        self.monasBodyHint.alpha = 0
        self.monasBottomNeckHint.alpha = 0
        self.monasBottomHint.alpha = 0
    }
    
    func fullOpacity() {
        self.monasImage.alpha = 1
    }
    
    func halfOpacity() {
        self.monasImage.alpha = 0.5
    }
    
    func hideShapes() {
        self.monasTop.alpha = 0
        self.monasNeck.alpha = 0
        self.monasBody.alpha = 0
        self.monasBottomNeck.alpha = 0
        self.monasBottom.alpha = 0
    }
    
    func hideHintButton() {
        self.hintButton.alpha = 0
    }
    
    func hideOpacityButton() {
        self.opacityButton.alpha = 0
    }
    
    func topShape(color: UIColor) -> UIView {
        let container = UIView(frame: monasTopFrame)
        
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
        shape.strokeColor = color.cgColor
        shape.lineWidth = 2
        container.layer.addSublayer(shape)
        
        return container
    }
    
    func neckShape(color: UIColor) -> UIView {
        let container = UIView(frame: monasNeckFrame)
        container.layer.borderWidth = 2
        container.layer.borderColor = color.cgColor
        return container
    }
    
    func bodyShape(color: UIColor) -> UIView {
        let container = UIView(frame: monasBodyFrame)
        
        let layerHeight = container.layer.frame.height
        let layerWidth = container.layer.frame.width
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: layerHeight))
        bezierPath.addLine(to: CGPoint(x: layerWidth, y: layerHeight))
        bezierPath.addLine(to: CGPoint(x: (layerWidth * 3) / 4, y: 0))
        bezierPath.addLine(to: CGPoint(x: layerWidth / 4, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: layerHeight))
        bezierPath.close()
        bezierPath.fill()
        
        let shape = CAShapeLayer()
        shape.path = bezierPath.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = color.cgColor
        shape.lineWidth = 2
        container.layer.addSublayer(shape)
        
        return container
    }
    
    func bottomNeckShape(color: UIColor) -> UIView {
        let container = UIView(frame: monasBottomNeckFrame)
        container.layer.borderWidth = 2
        container.layer.borderColor = color.cgColor
        return container
    }
    
    func bottomShape(color: UIColor) -> UIView {
        let container = UIView(frame: monasBottomFrame)
        
        let layerHeight = container.layer.frame.height
        let layerWidth = container.layer.frame.width
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: layerWidth, y: 0))
        bezierPath.addLine(to: CGPoint(x: (layerWidth * 3) / 4, y: layerHeight))
        bezierPath.addLine(to: CGPoint(x: layerWidth / 4, y: layerHeight))
        bezierPath.addLine(to: CGPoint(x: 0, y: 0))
        bezierPath.close()
        bezierPath.fill()
        
        let shape = CAShapeLayer()
        shape.path = bezierPath.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = color.cgColor
        shape.lineWidth = 2
        container.layer.addSublayer(shape)
        
        return container
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if monasTop.frame.contains(location) {
                draggedView = "top"
                monasTop.center = location
            }
            else if monasNeck.frame.contains(location) {
                draggedView = "neck"
                monasNeck.center = location
            }
            else if monasBody.frame.contains(location) {
                draggedView = "body"
                monasBody.transform = CGAffineTransform(scaleX: 1, y: 1)
                monasBody.center = location
            }
            else if monasBottomNeck.frame.contains(location) {
                draggedView = "bottomNeck"
                monasBottomNeck.transform = CGAffineTransform(scaleX: 1, y: 1)
                monasBottomNeck.center = location
            }
            else if monasBottom.frame.contains(location) {
                draggedView = "bottom"
                monasBottom.transform = CGAffineTransform(scaleX: 1, y: 1)
                monasBottom.center = location
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if monasTop.frame.contains(location) && draggedView == "top" {
                monasTop.center = location
            }
            else if monasNeck.frame.contains(location) && draggedView == "neck" {
                monasNeck.center = location
            }
            else if monasBody.frame.contains(location) && draggedView == "body" {
                monasBody.center = location
            }
            else if monasBottomNeck.frame.contains(location) && draggedView == "bottomNeck" {
                monasBottomNeck.center = location
            }
            else if monasBottom.frame.contains(location) && draggedView == "bottom" {
                monasBottom.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        checkLocationMatch()
        draggedView = ""
        
        if isComplete() {
            playCompleteSfx()
            finish()
        }
    }
    
    func checkLocationMatch() {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            switch self.draggedView {
            case "top":
                if self.monasTopHint.frame.intersects(self.monasTop.frame) {
                    self.monasTop.center = self.monasTopHint.center
                }
                else {return}
            case "neck":
                if self.monasNeckHint.frame.intersects(self.monasNeck.frame) {
                    self.monasNeck.center = self.monasNeckHint.center
                }
                else {return}
            case "body":
                if self.monasBodyHint.frame.intersects(self.monasBody.frame) {
                    self.monasBody.center = self.monasBodyHint.center
                }
                else {return}
            case "bottomNeck":
                if self.monasBottomNeckHint.frame.intersects(self.monasBottomNeck.frame) {
                    self.monasBottomNeck.center = self.monasBottomNeckHint.center
                }
                else {return}
            case "bottom":
                if self.monasBottomHint.frame.intersects(self.monasBottom.frame) {
                    self.monasBottom.center = self.monasBottomHint.center
                }
                else {return}
            default:
                return
            }
        }, completion: {_ in
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (time) in
                
            })
        })
        
        
    }
    
    func isComplete() -> Bool {
        if !monasTopHint.frame.intersects(monasTop.frame) {
            return false
        }
        if !monasNeckHint.frame.intersects(monasNeck.frame) {
            return false
        }
        if !monasBodyHint.frame.intersects(monasBody.frame) {
            return false
        }
        if !monasBottomNeckHint.frame.intersects(monasBottomNeck.frame) {
            return false
        }
        if !monasBottomHint.frame.intersects(monasBottom.frame) {
            return false
        }
        return true
    }
    
    func finish() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.hideHint()
            self.hideShapes()
            self.hideHintButton()
            self.hideOpacityButton()
            self.fullOpacity()
        }, completion: {_ in
            Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false, block: { (time) in
                self.removeFromSuperview()
                finish1Page()
            })
        })
    }
}

///Displays Scenario1 Page
public func scenario1Page() {
    PlaygroundPage.current.liveView = Scenario1(scene: UIView())
}
