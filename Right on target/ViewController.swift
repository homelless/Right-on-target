//
//  ViewController.swift
//  Right on target
//
//  Created by MacBookAir on 20.12.23.
//

import UIKit

class ViewController: UIViewController {
    //сущность игра
    var game: Game!
    //элементы на сцене
    @IBOutlet var slider : UISlider!
    @IBOutlet var label : UILabel!
 
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //создаем экземпляр сущности Игра
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        //обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    //  MARK: - Взаимодействие View - Model

    
    //проверка выбранного пользователем числа
    @IBAction func checkNumber() {
        //высчитываем очки за раунд
        game.calculateScore(with: Int(slider.value))
        //проверяем оконченна ли игра
        if game.isGameEnded {
            showAlertWith(score: game.score)
            //начинаем игру заново
            game.restartGame()
        }else{
            game.startNewRound()
        }
        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    //MARK: - Обновление View
    //обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String ) {
        label.text = newText
    }
    //отображение всплывающего окна со счетом
    private func showAlertWith(score: Int) {
    let alert = UIAlertController(
    title: "Игра окончена",
    message: "Вы заработали \(score) очков",preferredStyle: .alert); alert.addAction(UIAlertAction(title: "Начать заново", style:.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
    }
}
