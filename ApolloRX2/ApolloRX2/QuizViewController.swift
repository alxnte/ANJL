//
//  QuizViewController.swift
//  ApolloRX2
//
//  Created by Nubia Johnson on 3/23/22.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBOutlet weak var lblProgress: UILabel!
    
    struct Question {
           let question: String
           let answers: [String]
           let correctAnswer: Int
       }
       
       
       var questions: [Question] = [
           Question(
               question: "Which type of fat cell helps the body stay warm?",
               answers: ["White fat", "Brown fat", "Beige fat", "Saturated fat", ""],
               correctAnswer: 1),
           Question(
               question: "The human gut is made up of which microorganisms, or microbes?",
               answers: ["Bacteria", "Fungi", "Viruses", "All of the above", ""],
               correctAnswer: 3),
           Question(
               question: "What type of therapy engages the body’s defense system to fight cancer?",
               answers: ["Immunotherapy", "Radiation therapy", "Chemotherapy", "Horomone therapy", ""],
               correctAnswer: 0),
           Question(
               question: "Which human sense is the least studied of the five basic senses?",
               answers: ["Sight", "Sound", "Smell", "Taste", "Touch", ""],
               correctAnswer: 4),
           Question(
               question: "True or False: There is a cure for Parkinson’s disease.",
               answers: ["", "True", "False", "", ""],
               correctAnswer: 2),
           Question(
               question: "How is SARS-CoV-2, the novel coronavirus that causes COVID-19, most commonly spread?",
               answers: ["Houseflies and mosquitoes", "Respiratory droplets", "Dirty shoes", "5G mobile networks", ""],
               correctAnswer: 1),
           Question(
               question: "True or False: The flu vaccine combats the same influenza viruses, or flu strains, each year.",
               answers: ["", "True", "False", "", ""],
               correctAnswer: 2),
           Question(
               question: "True or False: Antibiotic resistance means your body is resistant to antibiotics.",
               answers: ["", "True", "False", "", ""],
               correctAnswer: 2),
           Question(
               question: "Which of the following conditions during pregnancy can adversely affect the mother and baby?",
               answers: ["Infection", "Preeclampsia", "Obesity and hypertension", "All of the Above", ""],
               correctAnswer: 3),
           Question(
               question: "What is the most commonly transplanted organ?",
               answers: ["Pancreas", "Heart", "Kidney", "Liver", ""],
               correctAnswer: 2)
       ]
       
       var currentQuestion: Question?
       var currentQuestionPos = 0
       
       var noCorrect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        currentQuestion = questions[0]
        setQuestion()
    }
    
    @IBAction func submitAnswer0(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
        checkAnswer(idx: 1)
    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
        checkAnswer(idx: 2)
    }
    
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(idx: 3)
    }
    
    @IBAction func submitAnswer4(_ sender: Any) {
        checkAnswer(idx: 4)
    }
    
    func checkAnswer(idx: Int) {
            if(idx == currentQuestion!.correctAnswer) {
                noCorrect += 1
            }
            loadNextQuestion()
        }
        
        func loadNextQuestion() {
            // Show next question
            if(currentQuestionPos + 1 < questions.count) {
                currentQuestionPos += 1
                currentQuestion = questions[currentQuestionPos]
                setQuestion()
            // If there are no more questions show the results
            } else {
                performSegue(withIdentifier: "sgShowResults", sender: nil)
            }
            

        }
        
        // Set labels and buttions for the current question
        func setQuestion() {
            lblQuestion.text = currentQuestion!.question
            answer0.setTitle(currentQuestion!.answers[0], for: .normal)
            answer1.setTitle(currentQuestion!.answers[1], for: .normal)
            answer2.setTitle(currentQuestion!.answers[2], for: .normal)
            answer3.setTitle(currentQuestion!.answers[3], for: .normal)
            answer4.setTitle(currentQuestion!.answers[4], for: .normal)
            lblProgress.text = "\(currentQuestionPos + 1) / \(questions.count)"
        }
    
    func hide(){
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if(segue.identifier == "sgShowResults") {
               var vc = segue.destination as! ResultsViewController
               vc.noCorrect = noCorrect
               vc.total = questions.count
           }
       }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
