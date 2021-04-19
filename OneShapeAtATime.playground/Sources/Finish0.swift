import Foundation
import UIKit
import PlaygroundSupport

public class Finish0: UIView {
    var viewWidth = 500
    var viewHeight = 500
    
    var tehBotolImage = UIImageView()
    var monasTitle = UILabel()
    var monasSubtitle = UILabel()
    var monasDesc = UILabel()
    var menuButton = UIButton()
    var playMoreButton = UIButton()
    
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
        
        monasTitle.text = "Teh Botol"
        monasTitle.textColor = UIColor.black
        monasTitle.font = UIFont(name: "Futura", size: 32)
        monasTitle.frame = CGRect(x: 0, y: 50, width: viewWidth, height: viewHeight)
        monasTitle.textAlignment = .center
        monasTitle.alpha = 0
        self.addSubview(monasTitle)
        
        monasSubtitle.text = "Sosro Brand"
        monasSubtitle.textColor = UIColor.darkGray
        monasSubtitle.font = UIFont(name: "Futura", size: 14)
        monasSubtitle.frame = CGRect(x: 0, y: 74, width: viewWidth, height: viewHeight)
        monasSubtitle.textAlignment = .center
        monasSubtitle.alpha = 0
        self.addSubview(monasSubtitle)
        
        monasDesc.text = "Teh Botol is a jasmine tea drink produced by the Indonesian company Sosro. It has been a staple drink for a long time. Locals often refer other jasmine tea brands as Teh Botol."
        monasDesc.numberOfLines = 0
        monasDesc.textColor = UIColor.black
        monasDesc.font = UIFont(name: "Futura", size: 18)
        monasDesc.frame = CGRect(x: 30, y: 140, width: viewWidth-60, height: viewHeight)
        monasDesc.textAlignment = .justified
        monasDesc.alpha = 0
        self.addSubview(monasDesc)
        
        menuButton.setTitle("Menu", for: .normal)
        menuButton.backgroundColor = UIColor.black
        menuButton.frame = CGRect(x: 380, y: 440, width: 100, height: 40)
        menuButton.titleLabel?.font = UIFont(name: "Futura", size: 18)
        menuButton.layer.cornerRadius = 5
        menuButton.addTarget(self, action: #selector(menuButtonPressed), for: .touchUpInside)
        menuButton.alpha = 0
        self.addSubview(menuButton)
        
        playMoreButton.setTitle("Play More", for: .normal)
        playMoreButton.backgroundColor = UIColor.black
        playMoreButton.frame = CGRect(x: 270, y: 440, width: 100, height: 40)
        playMoreButton.titleLabel?.font = UIFont(name: "Futura", size: 18)
        playMoreButton.layer.cornerRadius = 5
        playMoreButton.addTarget(self, action: #selector(playMoreButtonPressed), for: .touchUpInside)
        playMoreButton.alpha = 0
        self.addSubview(playMoreButton)
        
        animateSetup()
    }
    
    func animateSetup() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.tehBotolImage.transform = CGAffineTransform(scaleX: 0.55, y: 0.55).translatedBy(x: -180, y: -210)
        }, completion: {_ in
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { (time) in
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.monasTitle.alpha = 1
                    self.monasSubtitle.alpha = 1
                    self.monasDesc.alpha = 1
                    self.menuButton.alpha = 1
                    self.playMoreButton.alpha = 1
                }, completion: {_ in
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                    })
                })
            })
        })
    }
    
    @objc func menuButtonPressed(sender: UIButton) {
        playButtonSfx()
        self.removeFromSuperview()
        menuPage()
    }
    
    @objc func playMoreButtonPressed(sender: UIButton) {
        playButtonSfx()
        self.removeFromSuperview()
        scenario1Page()
    }
}

///Displays Finish1 Page
public func finish0Page() {
    PlaygroundPage.current.liveView = Finish0(scene: UIView())
}
