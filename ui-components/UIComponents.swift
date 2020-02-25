//
//  UIComponents.swift
//  Muzmatch_Exercise
//
//  Created by Farhan Mirza on 04/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit


// view components class
class UIComponents {
    static let shared = UIComponents()
    
    
    // MARK: UILabel
    func label(text: String? = nil, alignment: NSTextAlignment = .left, color: UIColor = UIColor.AppColor.defaultBlue, fontName : String = FontName.Regular ,fontSize : CGFloat = 14) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.textAlignment = alignment
        label.numberOfLines = 0
        label.font = UIFont(name: fontName, size: fontSize)
        return label
    }
    
    func labelSecondary(text: String? = nil, alignment: NSTextAlignment = .left, color: UIColor = UIColor(r: 168, g: 168, b: 168),fontSize : CGFloat = 14) -> UILabel {
        return label(text:text, alignment: alignment, color:color,fontSize: fontSize)
    }
    
    
    
    // MARK: UIButton
    func button(text: String? = nil, backgroundColor : UIColor = UIColor.AppColor.defaultBlue, titleColor : UIColor = .white, fontSize : CGFloat = 16) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = UIFont(name: FontName.Medium, size: fontSize)
        button.layer.cornerRadius = 10
        return button
    }
    
    
    func secondaryButton(text : String, fontSize : CGFloat = 16) -> UIButton  {
        return button(text: text, backgroundColor: .clear, titleColor : UIColor.AppColor.defaultBlue, fontSize : fontSize)
    }
    
    
    // MARK: UIView
    func container(bgColor : UIColor = .white, cornerRadius : CGFloat = 0, addShadow : Bool = false) -> UIView {
        let view = UIView()
        view.backgroundColor = bgColor
        view.layer.cornerRadius = cornerRadius
        if addShadow {
            view.addShadow()
        }
        
        return view
    }
    
    
    // MARK: UITableView
    func tableView() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }
    
    // MARK: UIImageView
    func imageView(name: String, contentMode : UIView.ContentMode = .scaleToFill) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: name)
        imageView.contentMode = contentMode
        return imageView
    }
    
    
    // MARK: UITextView
    func textView(text : String = "", fontName : String = FontName.Regular, textColor : UIColor = .black, fontSize : CGFloat = 14) -> UITextView {
    let textView  = UITextView()
        textView.isEditable = false
        textView.text = text
        textView.font = UIFont(name: fontName, size: fontSize)
        textView.textColor = textColor
        textView.backgroundColor = .clear
        return textView
    }
    
    
    // MARK: Collection View
    // Collection View
    func collectionview(lineSpacing : CGFloat = 10, itemSpacing : CGFloat = 13 ) -> UICollectionView {
        let cv : UICollectionView = {
            let flowLayout: UICollectionViewFlowLayout = {
                
                let layout = UICollectionViewFlowLayout()
                layout.minimumLineSpacing = lineSpacing
                layout.minimumInteritemSpacing = itemSpacing
                layout.scrollDirection = .horizontal
                
                if #available(iOS 9.0, *) {
                    layout.sectionHeadersPinToVisibleBounds = false
                }
                return layout
            }()
            return UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        }()
        cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false
        return cv
    }

}
