import Foundation
import UIKit
import PlaygroundSupport

public class Finish1: UIView {
    var viewWidth = 500
    var viewHeight = 500
    
    var monasImage = UIImageView()
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
        
        monasImage.image = UIImage(named: "monas-small.jpg")
        monasImage.frame = CGRect(x: 140, y: 0, width: 400, height: 500)
        monasImage.contentMode = .scaleAspectFit
        monasImage.alpha = 1
        self.addSubview(monasImage)
        
        monasTitle.text = "Monas"
        monasTitle.textColor = UIColor.black
        monasTitle.font = UIFont(name: "Futura", size: 32)
        monasTitle.frame = CGRect(x: 0, y: 50, width: viewWidth, height: viewHeight)
        monasTitle.textAlignment = .center
        monasTitle.alpha = 0
        self.addSubview(monasTitle)
        
        monasSubtitle.text = "National Monument"
        monasSubtitle.textColor = UIColor.darkGray
        monasSubtitle.font = UIFont(name: "Futura", size: 14)
        monasSubtitle.frame = CGRect(x: 0, y: 74, width: viewWidth, height: viewHeight)
        monasSubtitle.textAlignment = .center
        monasSubtitle.alpha = 0
        self.addSubview(monasSubtitle)
        
        monasDesc.text = "Monas is the national monument of the Republic of Indonesia, built to commemorate the struggle for Indonesian independence. It is topped by a flame covered with gold foil."
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
            self.monasImage.transform = CGAffineTransform(scaleX: 0.55, y: 0.55).translatedBy(x: -160, y: -210)
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
        scenario0Page()
    }
}

///Displays Finish1 Page
public func finish1Page() {
    PlaygroundPage.current.liveView = Finish1(scene: UIView())
}
