//
//  UIView+Layout.swift
//  UIKitExtensions
//
//  Created by Miras Karazhigitov on 6/27/19.
//

import UIKit

public extension UIView {
    /// Метод для добавления констрейнтов через код.
    ///
    /// - Parameters:
    ///   - attribute1: Собственный атрибут констрейта (.top, .bottom, .left итд)
    ///   - view: Экран к которому привязываемся. по умолчанию view = superview
    ///   - attribute2: Атрибут экрана к которому привязываеся
    ///   - relation: Тип связи между перввым и вторым атрибутами
    ///   - constant: константа = 0
    ///   - priority: приоритет
    /// - Returns: Готовый констрейнт.
    
    @discardableResult func pin(on attribute1: NSLayoutConstraint.Attribute,
                                to view: UIView? = nil,
                                on attribute2: NSLayoutConstraint.Attribute? = nil,
                                relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                constant: CGFloat = 0,
                                multiplier: CGFloat = 1,
                                priority: Float? = nil) -> NSLayoutConstraint? {
        guard let view = view ?? superview else {
            return nil
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        let attribute2 = attribute2 ?? attribute1
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: attribute1,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: attribute2,
                                            multiplier: multiplier,
                                            constant: constant)
        if let priority = priority {
            constraint.priority = UILayoutPriority(priority)
        }
        
        constraint.isActive = true
        
        return constraint
    }
    
    /// Покрывает собой выбронное view со всех сторон через констрейнты
    ///
    /// - Parameter view: выбранное view для покрытия. по умолчанию view = superview
    @objc func pinToEdges(of view: UIView? = nil) {
        pin(on: .top, to: view)
        pin(on: .bottom, to: view)
        pin(on: .left, to: view)
        pin(on: .right, to: view)
    }
    
    @discardableResult func pinWidth(relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                     to constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .width,
                                            relatedBy: relation,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: 1,
                                            constant: constant)
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult func pinHeight(relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                      to constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .height,
                                            relatedBy: relation,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: 1,
                                            constant: constant)
        constraint.isActive = true
        
        return constraint
    }
    
    func pin(size: CGSize) {
        pinWidth(to: size.width)
        pinHeight(to: size.height)
    }
    
    @discardableResult
    func pinAspectRatio(_ ratio: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        return NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: ratio, constant: 0)
    }
}

extension UIView {
    func addCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.cornerCurve = .continuous
        layer.masksToBounds = true
    }
    
    func addShadow(color: UIColor, radius: CGFloat, opacity: Float, shadowOffset: CGSize) {
        let cgcolor = color.cgColor
        
        layer.shadowColor = cgcolor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = shadowOffset
    }
    
    func addBorders(color: UIColor, width: CGFloat) {
        let cgcolor = color.cgColor
        layer.borderWidth = width
        layer.borderColor = cgcolor
    }
}
