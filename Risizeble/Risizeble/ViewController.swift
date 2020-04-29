//
//  ViewController.swift
//  Risizeble
//
//  Created by Agamenon Rocha Dos Santos on 27/04/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let SCREEN_SIZE = UIScreen.main.bounds
    private let GAP_BETWEEN_VIEWS:CGFloat = 0.08
    
    
    var topLeftView = UIView()
    var topRightView = UIView()
    var bottomLeftView = UIView()
    var bottomRightView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        addViews()
        addConstraints()
    }
    
    func addViews() {
    let heightOfSubView = SCREEN_SIZE.height / 2 - SCREEN_SIZE.height * GAP_BETWEEN_VIEWS/2
    let widthOfSubView = SCREEN_SIZE.width / 2 - SCREEN_SIZE.height * GAP_BETWEEN_VIEWS/2
    // Calculate the height and size of each views
    topLeftView = UIView(frame: CGRect(x: 0, y: 0, width: widthOfSubView, height: heightOfSubView))
    topRightView = UIView(frame: CGRect(x: widthOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), y: 0, width: widthOfSubView, height: heightOfSubView))
    bottomLeftView = UIView(frame: CGRect(x: 0, y: heightOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), width: widthOfSubView, height: heightOfSubView))
    bottomRightView = UIView(frame: CGRect(x: widthOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), y: heightOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), width: widthOfSubView, height: heightOfSubView))
        topLeftView.backgroundColor = .white
        topRightView.backgroundColor = .white
        bottomLeftView.backgroundColor = .white
        bottomRightView.backgroundColor = .white
        view.addSubview(topLeftView)
        view.addSubview(topRightView)
        view.addSubview(bottomLeftView)
        view.addSubview(bottomRightView)
        }
    func addtopLeftViewConstraints() {
        let topLeftViewLeadingConstraint = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal
            , toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        let topLeftViewTopConstraint = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal
            , toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([topLeftViewLeadingConstraint, topLeftViewTopConstraint])
        }

    func addTopRightViewConstraints() {

        let topRightViewTrailingConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal
            , toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)

        let topRightViewTopConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal
            , toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([topRightViewTrailingConstraint, topRightViewTopConstraint])
    }
    
    func addBottomLeftViewConstraints() {

        let bottomLeftViewLeadingConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal
            , toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)

        let bottomLeftViewBottomConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal
            , toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([bottomLeftViewLeadingConstraint, bottomLeftViewBottomConstraint])

    }
    
    func addBottomRightViewConstraints() {

        let bottomRightViewTrailingConstraint = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal
            , toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)

        let bottomRightViewBottomConstraint = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal
            , toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([bottomRightViewTrailingConstraint, bottomRightViewBottomConstraint])
    }
    
    func addTopBottomConstraints() {
        let verticalSpacing1 = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topLeftView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))

        let verticalSpacing2 = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topRightView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))

        NSLayoutConstraint.activate([verticalSpacing1, verticalSpacing2])
    }
    
    func addLeftRightConstraints() {
        let horizontalSpacing1 = NSLayoutConstraint(item: topRightView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topLeftView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))

        let horizontalSpacing2 = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bottomLeftView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))

        NSLayoutConstraint.activate([horizontalSpacing1, horizontalSpacing2])
    }
    
    func addEqualWidthConstraints() {
        let topRightViewWidth = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topRightView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)

        let bottomLeftViewWidth = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bottomLeftView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)

        let bottomRightViewWidth = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal,
                                                      toItem: bottomRightView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([topRightViewWidth, bottomLeftViewWidth,bottomRightViewWidth ])
    }
    
    func addEqualHeightConstraints() {
        let topRightViewHeight = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topRightView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)

        let bottomLeftViewHeight = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bottomLeftView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)

        let bottomRightViewHeight = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bottomRightView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([topRightViewHeight, bottomLeftViewHeight,bottomRightViewHeight ])
        }
    
    func disableAutoResizingMasks() {
    topLeftView.translatesAutoresizingMaskIntoConstraints = false
    topRightView.translatesAutoresizingMaskIntoConstraints = false
    bottomLeftView.translatesAutoresizingMaskIntoConstraints = false
    bottomRightView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addConstraints() {
    addtopLeftViewConstraints()
    addTopRightViewConstraints()
    addBottomLeftViewConstraints()
    addBottomRightViewConstraints()
    addTopBottomConstraints()
    addLeftRightConstraints()
    addEqualWidthConstraints()
    addEqualHeightConstraints()
    disableAutoResizingMasks()
    }
                                            

}

