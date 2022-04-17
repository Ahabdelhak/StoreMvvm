//
//  HomeTableViewCell.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 16/04/2022.
//

import UIKit

class HomeTableViewCell: TableViewCell {
    
    var option: Product? {
        didSet {
            if let options = self.option {
                detailLabel.text = "\(options.title ) - \(options.category)"
                if let url = URL(string: options.image) {
                    UIImage.loadFrom(url: url, completion: { image in
                        DispatchQueue.main.async {
                            self.rockerImageView.image = image
                        }
                    })
                }
            }
        }
    }
    
    var containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        v.layer.cornerRadius = 12
        return v
    }()
    var rockerImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "placeHolderImage")
        imgView.layer.cornerRadius = 12
        imgView.clipsToBounds = true
        imgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imgView
    }()
    var detailLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //lbl.font = .normsProBold(size: 24)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white
        self.selectionStyle = .none

        self.contentView.isUserInteractionEnabled = true
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupCell() {
        addSubview(containerView)
        containerView.addSubview(rockerImageView)
        containerView.addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            rockerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            rockerImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            rockerImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            rockerImageView.heightAnchor.constraint(equalToConstant: 200),
            
            detailLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            detailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25),
            detailLabel.topAnchor.constraint(equalTo: rockerImageView.bottomAnchor, constant: 20),
            detailLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            
        ])
    }
}
