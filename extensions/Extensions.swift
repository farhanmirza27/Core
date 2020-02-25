//
//  Extensions.swift
//  JustEat
//
//  Created by Farhan Mirza on 14/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation


import UIKit

// MARK: UIView
extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func addSubViews(views : UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    func addHConstraint(leftInset: Float = 0, rightInset: Float = 0, view : UIView) {
        self.addConstraintsWithFormat("H:|-\(leftInset)-[v0]-\(rightInset)-|", views: view)
    }
    
    func addHConstraint(leftInset: Float = 0, rightInset: Float = 0, width : Float = 0 ,view : UIView) {
        self.addConstraintsWithFormat("H:|-\(leftInset)-[v0(\(width))]-\(rightInset)-|", views: view)
    }
    
    func addHConstraint(leftInset: Float = 0, rightInset: Float = 0, views : [UIView]) {
        for view in views {
            self.addConstraintsWithFormat("H:|-\(leftInset)-[v0]-\(rightInset)-|", views: view)
        }
        
    }
    
    func addVConstraint(topInset: Float = 0, bottomInset: Float = 0, view : UIView) {
        self.addConstraintsWithFormat("V:|-\(topInset)-[v0]-\(bottomInset)-|", views: view)
    }
    
    
    func addVConstraint(topInset: Float = 0, bottomInset: Float = 0, height : Float = 0 ,view : UIView) {
        self.addConstraintsWithFormat("V:|-\(topInset)-[v0(\(height))]-\(bottomInset)-|", views: view)
    }
    
    
    func centerHorizontally(toView : UIView) {
        self.centerXAnchor.constraint(equalTo: toView.centerXAnchor).isActive = true
    }
    
    func centerVertically(toView : UIView) {
        self.centerYAnchor.constraint(equalTo: toView.centerYAnchor).isActive = true
    }
    
    
    func addShadow(radius:CGFloat = 5,color:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25),opacity:Float = 0.7) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
}




// MARK: UIColor
extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    
    struct AppColor {
        static let defaultBlue =  UIColor(hexString: "#1c2841")
        static let defaultWhite = UIColor(hexString: "#f9f9f9")
        static let defaultRed = UIColor(hexString: "#E7516D")
        static let defaultGray =  UIColor(hexString: "#EFEDED")
        static let defaultDarkGray = UIColor(hexString: "#8F8F94")
        
    }
    
}


// MARK: UIViewController
var vSpinner : UIView?
extension UIViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }

}



// MARK: UIImageView
// Cache Images Extension
let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func loadImageUsingCacheWithUrlString(_ urlString: String) {
        self.image = nil
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        //otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //download hit an error so lets return out
            if error != nil {
                print(error ?? ":(")
                return
            }
            DispatchQueue.main.async(execute: {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    self.image = downloadedImage
                }
            })
        }).resume()
    }
}





// MARK: JSONDecoder
extension JSONDecoder.KeyDecodingStrategy {
    static var convertFromUpperCamelCase: JSONDecoder.KeyDecodingStrategy {
        return .custom { codingKeys in
            var key = AnyCodingKey(codingKeys.last!)
            // lowercase first letter
            if let firstChar = key.stringValue.first {
                let i = key.stringValue.startIndex
                key.stringValue.replaceSubrange(
                    i ... i, with: String(firstChar).lowercased()
                )
            }
            return key
        }
    }
}

