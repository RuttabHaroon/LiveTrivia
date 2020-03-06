//
//  LiveController.swift
//  livetrivia
//
//  Created by macbook on 16/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import UICircularProgressRing
import ViewAnimator

class LiveController: BaseController {

    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var triviaPopupView: UIView!
    @IBOutlet weak var progressTimerView: UICircularTimerRing!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var triviaQuestionsCollectionView: UICollectionView!
    @IBOutlet weak var shadowOpacityView: UIView!
    
    var comments: [Comment] = {
       return [
            Comment(userProfilePicture: "profile_avatar_3", username: "micheal210", userMessage: "lorem ipsum dolor sit amet"),
            Comment(userProfilePicture: "profile_avatar_2", username: "micheal210", userMessage: "lorem ipsum dolor sit amet"),
            Comment(userProfilePicture: "profile_avatar_4", username: "peelofshame", userMessage: "lorem ipsum dolor sit amet"),
            Comment(userProfilePicture: "profile_avatar_5", username: "peelofshame", userMessage: "lorem ipsum dolor sit amet"),
            Comment(userProfilePicture: "profile_avatar_2", username: "peelofshame", userMessage: "lorem ipsum dolor sit amet"),
            Comment(userProfilePicture: "profile_avatar_2", username: "peelofshame", userMessage: "lorem ipsum dolor sit amet")
        ]
    }()
    
    var triviaQuestions: [TriviaQuestion] = {
       return [TriviaQuestion(question: "Which word is used to describe an official reciever position in football?", possibleAnswers: ["Wide", "Thicc", "Phat"])]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.triviaQuestionsCollectionView.dataSource = self
        self.triviaQuestionsCollectionView.delegate = self
        
        setupUI()

    }
    
}

extension LiveController {
    func setupUI() {
        
       self.triviaPopupView.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.triviaPopupView.alpha = 1
            self.triviaPopupViewAnimate()
        }
        
        
       addNextQuestionRoundNextButton(viewController: self)
        
        commentsTableView.estimatedRowHeight = UITableView.automaticDimension
        commentsTableView.rowHeight = UITableView.automaticDimension
        
        commentsTableView.separatorStyle = .none
        
        setupTriviaPopupView()
        
        shadowOpacityView.addDropShadow(shadowColor: UIColor(red: 190, green: 216, blue: 241, alpha: 1), shadowOpacity: 0.20, shadowRadius: 20)
        
        
        progressTimerView.style = .ontop
        progressTimerView.startTimer(to: 60) { state in
            switch state {
            case .finished:
                print("finished")
            case .continued(let time):
                print("continued: \(time)")
            case .paused(let time):
                print("paused: \(time)")
            }
        }
        
    }
    
    func setupTriviaPopupView() {
        
        triviaPopupView.applyCornerRadius(cornerRadius: 24)
        
        profileImageView.roundView()
        
        progressTimerView.addDropShadow(shadowColor: UIColor.gray, shadowOpacity: 0.4, shadowRadius: 10)
        
    }
    
    func triviaPopupViewAnimate() {
    // Combined animations example
        let zoomAnimation = AnimationType.zoom(scale: 0.2)
        let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
        UIView.animate(views: [triviaPopupView],
                       animations: [zoomAnimation, rotateAnimation],
                       duration: 0.5)
    }
}
extension LiveController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as? CommentTableViewCell else {
            fatalError("The dequeud cell is not of type commentCell")
        }
        
        let comment = comments[indexPath.item]
        
        cell.setup(comment: comment)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 97
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}


extension LiveController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "triviaCell", for: indexPath) as? TriviaAnswerCell else {
            fatalError("The dequeued cell is of type triviaCell")
        }
        
        let answer = triviaQuestions[0].possibleAnswers[indexPath.item]
        cell.setUp(answer: answer)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("SLECETDDDD")
        collectionView.deselectItem(at: indexPath, animated: false)
    }

}

extension LiveController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 75)
    }
    
}


