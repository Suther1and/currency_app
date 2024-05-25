//
//  ViewController.swift
//  currency_app
//
//  Created by Pavel Barto on 24.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var btn1 = createButton(title: "1", action: btn1Action)
    private lazy var btn2 = createButton(title: "2", action: btn2Action)
    private lazy var btn3 = createButton(title: "3", action: btn3Action)
    private lazy var btn4 = createButton(title: "4", action: btn4Action)
    private lazy var btn5 = createButton(title: "5", action: btn5Action)
    private lazy var btn6 = createButton(title: "6", action: btn6Action)
    private lazy var btn7 = createButton(title: "7", action: btn7Action)
    private lazy var btn8 = createButton(title: "8", action: btn8Action)
    private lazy var btn9 = createButton(title: "9", action: btn9Action)
    private lazy var btn0 = createButton(title: "0", action: btn0Action)
    private lazy var undoBtn = {
        let btn = UIButton()
        btn.tintColor = UIColor.white
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)
        let largeBoldSymbol = UIImage(systemName: "delete.left", withConfiguration: largeConfig)
        btn.setImage(largeBoldSymbol, for: .normal)
        return btn
    }()
    
    private lazy var swapButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "swap"), for: .normal)
        btn.addAction(swapAction, for: .touchUpInside)
        return btn
    }()
 
    private lazy var changeTop = {
        let btn = UIButton(primaryAction: changeAction)
        btn.setTitle("Change", for: .normal)
        btn.setTitleColor(.yellow, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return btn
    }()
    private lazy var changeBottom = {
        let btn = UIButton(primaryAction: changeAction)
        btn.setTitle("Change", for: .normal)
        btn.setTitleColor(.yellow, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return btn
    }()

    
    private lazy var line1 = createLine(xStart: 50, xEnd: 350, y: 740)
    private lazy var line2 = createLine(xStart: 50, xEnd: 350, y: 660)
    private lazy var line3 = createLine(xStart: 50, xEnd: 350, y: 578)
    private lazy var line4 = createLine(xStart: 25, xEnd: 278, y: 180)
    
    
    
    private lazy var mockImage1 = createImage(image: UIImage(named: "ruFlag")!)
    private lazy var mockImage2 = createImage(image: UIImage(named: "usaFlag")!)

    
    private lazy var fromLabel = createLabel(title: "From", size: 14, color: .yellow, font: "AlNile")
    private lazy var toLabel = createLabel(title: "To", size: 14, color: .yellow, font: "AlNile")
  
    
    private lazy var convertView = {
        let view = UIView()
        view.backgroundColor = .accent
        view.layer.cornerRadius = 25
        let blur = UIBlurEffect(style: .dark)
        let blurEffect = UIVisualEffectView(effect: blur)
        view.addSubview(blurEffect)
        return view
    }()
    
    private lazy var mainLabel = createLabel(title: "Currency converter", size: 28, color: .white, font: "AlNile-Bold")
    
    private lazy var appIcon = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.image = UIImage(named: "CurrencyIcon")
        return img
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bg

        [line1,
         line2,
         line3,
        ].forEach{view.layer.addSublayer($0)}
        
        convertView.layer.addSublayer(line4)
        
        
        [mockImage1,
         mockImage2,
         changeTop,
         swapButton,
         changeBottom,
         fromLabel,
         toLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            convertView.addSubview($0)
        }
        
        [mainLabel,
         appIcon,
         convertView,
         btn1,
         btn2,
         btn3,
         btn4,
         btn5,
         btn6,
         btn7,
         btn8,
         btn9,
         btn0,
         undoBtn].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        
        //MARK: Contraints
        
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            
            appIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            appIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            appIcon.heightAnchor.constraint(equalToConstant: 50),
            appIcon.widthAnchor.constraint(equalToConstant: 50),
            
            convertView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            convertView.heightAnchor.constraint(equalToConstant: 380),
            convertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            convertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            btn1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            btn1.topAnchor.constraint(equalTo: convertView.bottomAnchor, constant: 10),
            btn2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn2.topAnchor.constraint(equalTo: convertView.bottomAnchor, constant: 10),
            btn3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            btn3.topAnchor.constraint(equalTo: convertView.bottomAnchor, constant: 10),
            btn4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            btn4.topAnchor.constraint(equalTo: btn1.bottomAnchor, constant: 10),
            btn5.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn5.topAnchor.constraint(equalTo: btn1.bottomAnchor, constant: 10),
            btn6.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            btn6.topAnchor.constraint(equalTo: btn1.bottomAnchor, constant: 10),
            btn7.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            btn7.topAnchor.constraint(equalTo: btn4.bottomAnchor, constant: 10),
            btn8.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn8.topAnchor.constraint(equalTo: btn4.bottomAnchor, constant: 10),
            btn9.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            btn9.topAnchor.constraint(equalTo: btn4.bottomAnchor, constant: 10),
            btn0.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn0.topAnchor.constraint(equalTo: btn8.bottomAnchor, constant: 10),
            
            undoBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            undoBtn.topAnchor.constraint(equalTo: btn9.bottomAnchor, constant: 25),
            
            mockImage1.leadingAnchor.constraint(equalTo: convertView.leadingAnchor, constant: 25),
            mockImage1.topAnchor.constraint(equalTo: convertView.topAnchor, constant: 25),
            
            mockImage2.leadingAnchor.constraint(equalTo: convertView.leadingAnchor, constant: 25),
            mockImage2.topAnchor.constraint(equalTo: convertView.centerYAnchor, constant: 25),
            
            fromLabel.leadingAnchor.constraint(equalTo: mockImage1.leadingAnchor, constant: 75),
            fromLabel.topAnchor.constraint(equalTo: convertView.topAnchor, constant: 25),
            
            toLabel.leadingAnchor.constraint(equalTo: mockImage2.leadingAnchor, constant: 75),
            toLabel.topAnchor.constraint(equalTo: convertView.centerYAnchor, constant: 25),
            
            changeTop.trailingAnchor.constraint(equalTo: convertView.trailingAnchor, constant: -25),
            changeTop.topAnchor.constraint(equalTo: convertView.topAnchor, constant: 25),
            
            changeBottom.trailingAnchor.constraint(equalTo: convertView.trailingAnchor, constant: -25),
            changeBottom.topAnchor.constraint(equalTo: convertView.centerYAnchor, constant: 25),
            
            swapButton.trailingAnchor.constraint(equalTo: convertView.trailingAnchor, constant: -15),
            swapButton.topAnchor.constraint(equalTo: convertView.centerYAnchor, constant: -35),
            swapButton.widthAnchor.constraint(equalToConstant: 50),
            swapButton.heightAnchor.constraint(equalToConstant: 50)
            
            
            
        ])
    }
    
    //MARK: Actions
    private lazy var btn1Action = UIAction { _ in
        print("1 pressed")
    }
    private lazy var btn2Action = UIAction { _ in
    }
    private lazy var btn3Action = UIAction { _ in
    }
    private lazy var btn4Action = UIAction { _ in
    }
    private lazy var btn5Action = UIAction { _ in
    }
    private lazy var btn6Action = UIAction { _ in
    }
    private lazy var btn7Action = UIAction { _ in
    }
    private lazy var btn8Action = UIAction { _ in
    }
    private lazy var btn9Action = UIAction { _ in
    }
    private lazy var btn0Action = UIAction { _ in
    }
    private lazy var undoAction = UIAction { _ in
    }
    private lazy var changeAction = UIAction { _ in
    }
    private lazy var swapAction = UIAction { _ in
        print("swap pressed")
    }
    
    func createLabel(title: String, size: Int, color: UIColor, font: String) -> UILabel{
        {
            lazy var label = UILabel()
            label.text = title
            label.font = UIFont(name: font, size: CGFloat(size))
            label.numberOfLines = 1
            label.textColor = color
            return label
        }()
    }
    
    func createButton(title: String, action: UIAction) -> UIButton {
        {
            lazy var btn = UIButton(primaryAction: action)
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 48)
            btn.backgroundColor = .clear
            
            return btn
        }()
    }
    
    func createLine(xStart: Int,xEnd: Int, y: Int) -> CALayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: xStart, y: y))
        path.addLine(to: CGPoint(x: xEnd, y: y))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.whiteAccent.cgColor
        shapeLayer.lineWidth = 0.5
        
        return shapeLayer
    }
    
    func createImage(image: UIImage) -> UIImageView {
        {
            lazy var img = UIImageView()
            img.image = image
            img.translatesAutoresizingMaskIntoConstraints = false
            img.heightAnchor.constraint(equalToConstant: 60).isActive = true
            img.widthAnchor.constraint(equalToConstant: 60).isActive = true
            img.contentMode = .scaleAspectFill
            img.clipsToBounds = true
            img.layer.cornerRadius = 30
            return img
        }()
    }
    
    
}


#Preview {
let vc = ViewController()
return vc
}
