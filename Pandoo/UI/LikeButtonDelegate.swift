//
//  LikeButtonDelegate.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 27.1.23..
//

import UIKit

protocol LikeButtonDelegate: AnyObject {
    func didTapLikeButton(at indexPath: IndexPath)
}
