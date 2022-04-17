//
//  DetailViewController.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 16/04/2022.
//

import UIKit

class DetailViewController: BaseViewController {
    
    //MARK:  - UI Elements
    var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 12
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "placeHolderImage")
        return imgView
    }()
    let headingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = .normsProMedium(size: 34)
        label.textColor = .black
        return label
    }()
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = .normsProRegular(size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1.0)
        return label
    }()
    let upcomingLaunchButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Get Product Price", for: .normal)
        //btn.titleLabel?.font = .normsProMedium(size: 16)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(productPrice), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - Variables
    var product: Product

    
    //MARK: - Initializers
    init(product: Product) {
        self.product=product
        super.init(nibName: nil, bundle: nil)
        setupInfo(product: product)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    override func setupViews() {
        view.addSubview(headingLabel)
        view.addSubview(imageView)
        view.addSubview(detailLabel)
        view.addSubview(upcomingLaunchButton)
        
        NSLayoutConstraint.activate([
        
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            headingLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            headingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            
            detailLabel.leadingAnchor.constraint(equalTo: headingLabel.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            detailLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 15),
            
            upcomingLaunchButton.leadingAnchor.constraint(equalTo: detailLabel.leadingAnchor),
            upcomingLaunchButton.trailingAnchor.constraint(equalTo: detailLabel.trailingAnchor),
            upcomingLaunchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            upcomingLaunchButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }

    //MARK: - Selectors
    @objc func productPrice() {
        self.showSingleButtonError(title: "Price", errorText: "The Price Of product is \(product.price) !", errorButtonTitle: "Wow, Ok")
    }
    
    //MARK: - Functions
    func setupInfo(product: Product) {
        self.headingLabel.text = product.welcomeDescription
        self.detailLabel.text = product.title
        if let url = URL(string:product.image) {
            UIImage.loadFrom(url: url) { image in
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
}
