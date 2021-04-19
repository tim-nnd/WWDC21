import Foundation
import UIKit
import PlaygroundSupport

public class Introduction: UIView {
    var viewWidth = 500
    var viewHeight = 500
    
    var introText = UILabel()
    var skipButton = UIButton()
    var playButton = UIButton()
    
    let memojiImage = UIImageView()
    let indonesiaImage = UIImageView()
    let blankCanvasImage = UIImageView()
    let monasImage = UIImageView()
    let tehBotolImage = UIImageView()
    
    var bottleLogo = UIView()
    var bottleLogoFrame = CGRect(x: 240, y: 225, width: 28, height: 28)
    var bottleTop = UIView()
    var bottleTopFrame = CGRect(x: 234, y: 130, width: 36, height: 10)
    var bottleNeck = UIView()
    var bottleNeckFrame = CGRect(x: 217, y: 135, width: 70, height: 155)
    var bottleMiddle = UIView()
    var bottleMiddleFrame = CGRect(x: 217, y: 284.6, width: 70, height: 12)
    var bottleBody = UIView()
    var bottleBodyFrame = CGRect(x: 216, y: 290, width: 72, height: 137)
    var bottleBottom = UIView()
    var bottleBottomFrame = CGRect(x: 217, y: 420, width: 70, height: 12)
    
    var introSequence = 0
    var isEasingOut = false
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
        
        introText.text = "Hello! My name is Timothy"
        introText.numberOfLines = 0
        introText.textColor = UIColor.black
        introText.font = UIFont(name: "Futura", size: 24)
        introText.frame = CGRect(x: 0, y: -190, width: viewWidth, height: viewHeight)
        introText.textAlignment = .center
        introText.alpha = 0
        self.addSubview(introText)
        
        memojiImage.image = UIImage(named: "memoji-peace.png")
        memojiImage.frame = CGRect(x: 150, y: 150, width: 200, height: 200)
        memojiImage.contentMode = .scaleAspectFit
        memojiImage.alpha = 0
        self.addSubview(memojiImage)
        
        indonesiaImage.image = UIImage(named: "indonesia-map.png")
        indonesiaImage.frame = CGRect(x: 40, y: 40, width: 420, height: 420)
        indonesiaImage.contentMode = .scaleAspectFit
        indonesiaImage.alpha = 0
        self.addSubview(indonesiaImage)
        
        blankCanvasImage.image = UIImage(named: "blank-canvas.jpg")
        blankCanvasImage.frame = CGRect(x: 50, y: 120, width: 190, height: 300)
        blankCanvasImage.contentMode = .scaleAspectFill
        blankCanvasImage.clipsToBounds = true
        blankCanvasImage.alpha = 0
        self.addSubview(blankCanvasImage)
        
        monasImage.image = UIImage(named: "monas-small.jpg")
        monasImage.frame = CGRect(x: 250, y: 120, width: 200, height: 300)
        monasImage.contentMode = .scaleAspectFill
        monasImage.clipsToBounds = true
        monasImage.alpha = 0
        self.addSubview(monasImage)
        
        tehBotolImage.image = UIImage(named: "teh-botol-sosro.jpeg")
        tehBotolImage.frame = CGRect(x: 100, y: 120, width: 300, height: 300)
        tehBotolImage.contentMode = .scaleAspectFill
        tehBotolImage.alpha = 0
        self.addSubview(tehBotolImage)
        
        skipButton.setTitle("Skip intro", for: .normal)
        skipButton.frame = CGRect(x: 370, y: 440, width: 120, height: 50)
        skipButton.titleLabel?.font = UIFont(name: "Futura", size: 18)
        skipButton.setTitleColor(UIColor.systemBlue, for: .normal)
        skipButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        skipButton.alpha = 1
        self.addSubview(skipButton)
        
        playButton.setTitle("Play", for: .normal)
        playButton.backgroundColor = UIColor.black
        playButton.frame = CGRect(x: 370, y: 440, width: 120, height: 50)
        playButton.titleLabel?.font = UIFont(name: "Futura", size: 30)
        playButton.layer.cornerRadius = 8
        playButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        playButton.alpha = 0
        self.addSubview(playButton)
        
        bottleLogo = logoShape()
        bottleLogo.alpha = 0
        self.addSubview(bottleLogo)
        
        bottleTop = topShape()
        bottleTop.alpha = 0
        self.addSubview(bottleTop)
        
        bottleNeck = neckShape()
        bottleNeck.alpha = 0
        self.addSubview(bottleNeck)
        
        bottleMiddle = middleShape()
        bottleMiddle.alpha = 0
        self.addSubview(bottleMiddle)
        
        bottleBody = bodyShape()
        bottleBody.alpha = 0
        self.addSubview(bottleBody)
        
        bottleBottom = bottomShape()
        bottleBottom.alpha = 0
        self.addSubview(bottleBottom)
        
        startIntroSequence()
    }
    
    func logoShape() -> UIView {
        let container = UIView(frame: bottleLogoFrame)
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.red.cgColor
        container.layer.cornerRadius = 14
        return container
    }
    
    func topShape() -> UIView {
        let container = UIView(frame: bottleTopFrame)
        
        let bezierPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 36, height: 10))
        bezierPath.fill()
        
        let shape = CAShapeLayer()
        shape.path = bezierPath.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        shape.lineWidth = 2
        container.layer.addSublayer(shape)
        
        return container
    }
    
    func neckShape() -> UIView {
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
        shape.strokeColor = UIColor.black.cgColor
        shape.lineWidth = 2
        container.layer.addSublayer(shape)
        
        return container
    }
    
    func middleShape() -> UIView {
        let container = UIView(frame: bottleMiddleFrame)
        
        let bezierPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 70, height: 12))
        bezierPath.fill()
        
        let shape = CAShapeLayer()
        shape.path = bezierPath.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        shape.lineWidth = 2
        container.layer.addSublayer(shape)
        
        return container
    }
    
    func bodyShape() -> UIView {
        let container = UIView(frame: bottleBodyFrame)
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.black.cgColor
        return container
    }
    
    func bottomShape() -> UIView {
        let container = UIView(frame: bottleBottomFrame)
        
        let bezierPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 70, height: 12))
        bezierPath.fill()
        
        let shape = CAShapeLayer()
        shape.path = bezierPath.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        shape.lineWidth = 2
        container.layer.addSublayer(shape)
        
        return container
    }
    
    func startIntroSequence() {
        switch introSequence {
        case 0:
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {
                self.introText.alpha = 1
                self.memojiImage.alpha = 1
            }, completion: {_ in
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
                    self.introSequence = 1
                    self.isEasingOut = true
                    self.startIntroSequence()
                })
            })
        case 1:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                    self.memojiImage.alpha = 0
                }, completion: {_ in
                    self.introText.text = "..from Indonesia"
                    self.indonesiaImage.transform = CGAffineTransform(translationX: 0, y: 500)
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                    self.indonesiaImage.alpha = 1
                    self.indonesiaImage.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
                        self.introSequence = 2
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 2:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                    self.indonesiaImage.alpha = 0
                    self.indonesiaImage.transform = CGAffineTransform(translationX: 0, y: 500)
                }, completion: {_ in
                    self.introText.text = "I was always bad at drawing,\nbut I didn't know where to start learning"
                    self.memojiImage.image = UIImage(named: "memoji-sweat.png")
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                    self.memojiImage.alpha = 1
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (time) in
                        self.introSequence = 3
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 3:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                    self.memojiImage.alpha = 0
                }, completion: {_ in
                    self.introText.text = "A blank canvas can be scary\nEspecially with a complex reference"
                    self.blankCanvasImage.transform = CGAffineTransform(translationX: -400, y: 0)
                    self.monasImage.transform = CGAffineTransform(translationX: 400, y: 0)
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                    self.blankCanvasImage.alpha = 1
                    self.monasImage.alpha = 1
                    self.blankCanvasImage.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.monasImage.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 3.5, repeats: false, block: { (time) in
                        self.introSequence = 4
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 4:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                    self.blankCanvasImage.alpha = 0
                    self.monasImage.alpha = 0
                    self.blankCanvasImage.transform = CGAffineTransform(translationX: -400, y: 0)
                    self.monasImage.transform = CGAffineTransform(translationX: 400, y: 0)
                }, completion: {_ in
                    self.introText.text = "However, we can break down\nthe reference into simple shapes\nThat way it will be easier to draw"
                    self.memojiImage.image = UIImage(named: "memoji-showing.png")
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                    self.memojiImage.alpha = 1
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 3.5, repeats: false, block: { (time) in
                        self.introSequence = 5
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 5:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                    self.memojiImage.alpha = 0
                }, completion: {_ in
                    self.introText.text = "Let's start with something simple\nStarring the staple drink in Indonesia.."
                    self.memojiImage.image = UIImage(named: "emoji-drum.png")
                    self.memojiImage.transform = CGAffineTransform(translationX: 0, y: 400)
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                    self.memojiImage.alpha = 1
                    self.memojiImage.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 2.8, repeats: false, block: { (time) in
                        self.introSequence = 6
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 6:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                    self.memojiImage.alpha = 0
                    self.memojiImage.transform = CGAffineTransform(translationX: 0, y: 400)
                }, completion: {_ in
                    self.introText.text = "Teh Botol Sosro!\n*not sponsored btw"
                    self.tehBotolImage.transform = CGAffineTransform(translationX: 0, y: -500)
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                    self.tehBotolImage.alpha = 1
                    self.tehBotolImage.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (time) in
                        self.introSequence = 7
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 7:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                }, completion: {_ in
                    self.introText.text = "Imagine cutting up the bottle into simple shapes"
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                    self.tehBotolImage.alpha = 0.3
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
                        self.introSequence = 8
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 8:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.bottleBody.alpha = 1
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: { (time) in
                        self.introSequence = 9
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 9:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.bottleNeck.alpha = 1
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: { (time) in
                        self.introSequence = 10
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 10:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                }, completion: {_ in
                    self.introText.text = "Then the smaller shapes for more detail"
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: { (time) in
                        self.introSequence = 11
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 11:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.bottleTop.alpha = 1
                    self.bottleMiddle.alpha = 1
                    self.bottleBottom.alpha = 1
                    self.bottleLogo.alpha = 1
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: { (time) in
                        self.introSequence = 12
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 12:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                    self.tehBotolImage.alpha = 0
                }, completion: {_ in
                    self.introText.text = "Doesn't it look easier to draw?"
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
                        self.introSequence = 13
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 13:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                }, completion: {_ in
                    self.introText.text = "When split up,\nthey are just simple shapes"
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                }, completion: {_ in
                    self.animateDrawingSplit()
                    Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
                        self.introSequence = 14
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        case 14:
            if isEasingOut {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 0
                    self.skipButton.alpha = 0
                }, completion: {_ in
                    self.introText.text = "Try it out for yourself!"
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                        self.isEasingOut = false
                        self.startIntroSequence()
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.introText.alpha = 1
                    self.playButton.alpha = 1
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
                        self.introSequence = 15
                        self.isEasingOut = true
                        self.startIntroSequence()
                    })
                })
            }
        default:
            return
        }
    }
    
    func animateDrawingSplit() {
        
        self.bottleLogo.alpha = 1
        self.bottleTop.alpha = 1
        self.bottleNeck.alpha = 1
        self.bottleMiddle.alpha = 1
        self.bottleBody.alpha = 1
        self.bottleBottom.alpha = 1
        
        UIView.animate(withDuration: 1.2, delay: 0, options: .curveEaseOut, animations: {
            self.bottleLogo.center = CGPoint(x: 110, y: 320)
            self.bottleTop.center = CGPoint(x: 110, y: 270)
            self.bottleNeck.center = CGPoint(x: 185, y: 300)
            self.bottleMiddle.center = CGPoint(x: 390, y: 270)
            self.bottleBody.center = CGPoint(x: 290, y: 300)
            self.bottleBottom.center = CGPoint(x: 390, y: 320)
        }, completion: {_ in
            Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: { (time) in
                
            })
        })
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if introSequence < 14 {
                return
            }
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
        draggedView = ""
    }
    
    @objc func nextButtonPressed(sender: UIButton) {
        playButtonSfx()
        self.removeFromSuperview()
        scenario0Page()
    }
}

///Displays the Introduction Page
public func introductionPage() {
    PlaygroundPage.current.liveView = Introduction(scene: UIView())
}
