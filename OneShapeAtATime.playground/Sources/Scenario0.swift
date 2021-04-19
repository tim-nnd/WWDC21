import Foundation
import UIKit
import PlaygroundSupport

public class Scenario0: UIView {
    var viewWidth = 500
    var viewHeight = 500
    
    var tehBotolImage = UIImageView()
    
    var hintButton = UIButton()
    var hintToggled = false
    var opacityButton = UIButton()
    var opacityToggled = false
    
    var bottleLogoHint = UIView()
    var bottleLogoFrame = CGRect(x: 338, y: 188, width: 36, height: 36)
    var bottleTopHint = UIView()
    var bottleTopFrame = CGRect(x: 324.6, y: 48, width: 54, height: 16)
    var bottleNeckHint = UIView()
    var bottleNeckFrame = CGRect(x: 298, y: 56, width: 107, height: 226)
    var bottleMiddleHint = UIView()
    var bottleMiddleFrame = CGRect(x: 298, y: 268, width: 107, height: 28)
    var bottleBodyHint = UIView()
    var bottleBodyFrame = CGRect(x: 297, y: 281, width: 109, height: 189)
    var bottleBottomHint = UIView()
    var bottleBottomFrame = CGRect(x: 298, y: 456, width: 107, height: 28)
    
    var bottleLogo = UIView()
    var bottleTop = UIView()
    var bottleNeck = UIView()
    var bottleMiddle = UIView()
    var bottleBody = UIView()
    var bottleBottom = UIView()
    
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
        
        tehBotolImage.image = UIImage(named: "teh-botol-sosro.jpeg")
        tehBotolImage.frame = CGRect(x: 200, y: 0, width: 300, height: 500)
        tehBotolImage.contentMode = .scaleAspectFill
        tehBotolImage.clipsToBounds = true
        tehBotolImage.alpha = 1
        self.addSubview(tehBotolImage)
        
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
        
        bottleLogoHint = logoShape(color: UIColor.yellow)
        bottleLogoHint.alpha = 0
        self.addSubview(bottleLogoHint)
        
        bottleTopHint = topShape(color: UIColor.yellow)
        bottleTopHint.alpha = 0
        self.addSubview(bottleTopHint)
        
        bottleNeckHint = neckShape(color: UIColor.yellow)
        bottleNeckHint.alpha = 0
        self.addSubview(bottleNeckHint)
        
        bottleMiddleHint = middleShape(color: UIColor.yellow)
        bottleMiddleHint.alpha = 0
        self.addSubview(bottleMiddleHint)
        
        bottleBodyHint = bodyShape(color: UIColor.yellow)
        bottleBodyHint.alpha = 0
        self.addSubview(bottleBodyHint)
        
        bottleBottomHint = bottomShape(color: UIColor.yellow)
        bottleBottomHint.alpha = 0
        self.addSubview(bottleBottomHint)
        
        bottleLogo = logoShape(color: UIColor.red)
        bottleLogo.alpha = 1
        self.addSubview(bottleLogo)
        
        bottleTop = topShape(color: UIColor.black)
        bottleTop.alpha = 1
        self.addSubview(bottleTop)
        
        bottleNeck = neckShape(color: UIColor.black)
        bottleNeck.alpha = 1
        bottleNeck.transform = CGAffineTransform(scaleX: 0.55, y: 0.55)
        self.addSubview(bottleNeck)
        
        bottleMiddle = middleShape(color: UIColor.black)
        bottleMiddle.alpha = 1
        self.addSubview(bottleMiddle)
        
        bottleBody = bodyShape(color: UIColor.black)
        bottleBody.alpha = 1
        bottleBody.transform = CGAffineTransform(scaleX: 0.55, y: 0.55)
        self.addSubview(bottleBody)
        
        bottleBottom = bottomShape(color: UIColor.black)
        bottleBottom.alpha = 1
        self.addSubview(bottleBottom)
        
        setShapesPosition()
    }
    
    func setShapesPosition() {
        bottleLogo.center = CGPoint(x: 55, y: 120)
        bottleTop.center = CGPoint(x: 125, y: 120)
        bottleNeck.center = CGPoint(x: 60, y: 350)
        bottleMiddle.center = CGPoint(x: 100, y: 180)
        bottleBody.center = CGPoint(x: 140, y: 350)
        bottleBottom.center = CGPoint(x: 100, y: 240)
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
        self.bottleLogoHint.alpha = 1
        self.bottleTopHint.alpha = 1
        self.bottleNeckHint.alpha = 1
        self.bottleMiddleHint.alpha = 1
        self.bottleBodyHint.alpha = 1
        self.bottleBottomHint.alpha = 1
    }
    
    func hideHint() {
        self.bottleLogoHint.alpha = 0
        self.bottleTopHint.alpha = 0
        self.bottleNeckHint.alpha = 0
        self.bottleMiddleHint.alpha = 0
        self.bottleBodyHint.alpha = 0
        self.bottleBottomHint.alpha = 0
    }
    
    func fullOpacity() {
        self.tehBotolImage.alpha = 1
    }
    
    func halfOpacity() {
        self.tehBotolImage.alpha = 0.5
    }
    
    func hideShapes() {
        self.bottleLogo.alpha = 0
        self.bottleTop.alpha = 0
        self.bottleNeck.alpha = 0
        self.bottleMiddle.alpha = 0
        self.bottleBody.alpha = 0
        self.bottleBottom.alpha = 0
    }
    
    func hideHintButton() {
        self.hintButton.alpha = 0
    }
    
    func hideOpacityButton() {
        self.opacityButton.alpha = 0
    }
    
    func logoShape(color: UIColor) -> UIView {
        let container = UIView(frame: bottleLogoFrame)
        container.layer.borderWidth = 2
        container.layer.borderColor = color.cgColor
        container.layer.cornerRadius = container.frame.height/2
        return container
    }
    
    func topShape(color: UIColor) -> UIView {
        let container = UIView(frame: bottleTopFrame)
        
        let bezierPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 54, height: 16))
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
        let container = UIView(frame: bottleNeckFrame)
        
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
    
    func middleShape(color: UIColor) -> UIView {
        let container = UIView(frame: bottleMiddleFrame)
        
        let bezierPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 107, height: 28))
        bezierPath.fill()
        
        let shape = CAShapeLayer()
        shape.path = bezierPath.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = color.cgColor
        shape.lineWidth = 2
        container.layer.addSublayer(shape)
        
        return container
    }
    
    func bodyShape(color: UIColor) -> UIView {
        let container = UIView(frame: bottleBodyFrame)
        container.layer.borderWidth = 2
        container.layer.borderColor = color.cgColor
        return container
    }
    
    func bottomShape(color: UIColor) -> UIView {
        let container = UIView(frame: bottleBottomFrame)
        
        let bezierPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 107, height: 28))
        bezierPath.fill()
        
        let shape = CAShapeLayer()
        shape.path = bezierPath.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = color.cgColor
        shape.lineWidth = 2
        container.layer.addSublayer(shape)
        
        return container
    }
    
    func swapMiddleAndBottom() {
        let temp = self.bottleMiddle.center
        self.bottleMiddle.center = bottleBottom.center
        self.bottleBottom.center = temp
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if bottleLogo.frame.contains(location) {
                draggedView = "logo"
                bottleLogo.center = location
            }
            else if bottleTop.frame.contains(location) {
                draggedView = "top"
                bottleTop.center = location
            }
            else if bottleMiddle.frame.contains(location) {
                draggedView = "middle"
                bottleMiddle.center = location
            }
            else if bottleBottom.frame.contains(location) {
                draggedView = "bottom"
                bottleBottom.center = location
            }
            else if bottleNeck.frame.contains(location) {
                draggedView = "neck"
                bottleNeck.transform = CGAffineTransform(scaleX: 1, y: 1)
                bottleNeck.center = location
            }
            else if bottleBody.frame.contains(location) {
                draggedView = "body"
                bottleBody.transform = CGAffineTransform(scaleX: 1, y: 1)
                bottleBody.center = location
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if bottleLogo.frame.contains(location) && draggedView == "logo" {
                bottleLogo.center = location
            }
            else if bottleTop.frame.contains(location) && draggedView == "top" {
                bottleTop.center = location
            }
            else if bottleMiddle.frame.contains(location) && draggedView == "middle" {
                bottleMiddle.center = location
            }
            else if bottleBottom.frame.contains(location) && draggedView == "bottom" {
                bottleBottom.center = location
            }
            else if bottleNeck.frame.contains(location) && draggedView == "neck" {
                bottleNeck.center = location
            }
            else if bottleBody.frame.contains(location) && draggedView == "body" {
                bottleBody.center = location
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
        
        if self.bottleMiddleHint.frame.intersects(self.bottleBottom.frame) {
            self.swapMiddleAndBottom()
            draggedView = "middle"
        }
        if self.bottleBottomHint.frame.intersects(self.bottleMiddle.frame) {
            self.swapMiddleAndBottom()
            draggedView = "bottom"
        }
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            switch self.draggedView {
            case "logo":
                if self.bottleLogoHint.frame.intersects(self.bottleLogo.frame) {
                    self.bottleLogo.center = self.bottleLogoHint.center
                }
            case "top":
                if self.bottleTopHint.frame.intersects(self.bottleTop.frame) {
                    self.bottleTop.center = self.bottleTopHint.center
                }
                else {return}
            case "middle":
                if self.bottleMiddleHint.frame.intersects(self.bottleMiddle.frame) {
                    self.bottleMiddle.center = self.bottleMiddleHint.center
                }
                else {return}
            case "bottom":
                if self.bottleBottomHint.frame.intersects(self.bottleBottom.frame) {
                    self.bottleBottom.center = self.bottleBottomHint.center
                }
                else {return}
            case "neck":
                if self.bottleNeckHint.frame.intersects(self.bottleNeck.frame) {
                    self.bottleNeck.center = self.bottleNeckHint.center
                }
                else {return}
            case "body":
                if self.bottleBodyHint.frame.intersects(self.bottleBody.frame) {
                    self.bottleBody.center = self.bottleBodyHint.center
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
        if !bottleLogoHint.frame.intersects(bottleLogo.frame) {
            return false
        }
        if !bottleTopHint.frame.intersects(bottleTop.frame) {
            return false
        }
        if !bottleNeckHint.frame.intersects(bottleNeck.frame) {
            return false
        }
        if !bottleMiddleHint.frame.intersects(bottleMiddle.frame) {
            return false
        }
        if !bottleBodyHint.frame.intersects(bottleBody.frame) {
            return false
        }
        if !bottleBottomHint.frame.intersects(bottleBottom.frame) {
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
                finish0Page()
            })
        })
    }
}

///Displays Scenario0 Page
public func scenario0Page() {
    PlaygroundPage.current.liveView = Scenario0(scene: UIView())
}
