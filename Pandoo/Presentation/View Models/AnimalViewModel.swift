//
//  AnimalViewModel.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 27.1.23..
//

import Foundation

protocol CommentDelegate: AnyObject {
    func didAddComment()
}

public final class AnimalViewModel {
    var animal: Animal
    
    public init(animal: Animal) {
        self.animal = animal
    }
    
    weak var delegate: CommentDelegate?
    
    struct EmptyCommentError: Error {}
    
    func addComment(_ text: String?) throws {
        guard let text, !text.isEmpty, let user = User.loggedInUser else {
            throw EmptyCommentError()
        }
        
        let comment = Comment(
            user: user,
            text: text,
            date: Date())
        animal.comments.append(comment)
        delegate?.didAddComment()
    }
}
