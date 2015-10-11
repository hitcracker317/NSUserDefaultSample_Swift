//
//  ViewController.swift
//  NSUserDefaultSample
//
//  Created by 前田 晃良 on 2015/10/12.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UITextFieldDelegate{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthDayTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var bornTextField: UITextField!
    
    var sexArray = ["男","女","その他"]
    var bornArray = ["北海道","青森","岩手","宮城","秋田","山形","福島","茨城","栃木","群馬","埼玉","千葉","東京","神奈川","新潟","富山","石川","福井","山梨","長野","岐阜","静岡","愛知","三重","滋賀","京都","大阪","兵庫","奈良","和歌山","鳥取","島根","岡山","広島","山口","徳島","香川","愛媛","高知","福岡","佐賀","長崎","熊本","大分","宮崎","鹿児島","沖縄"]
    
    var pickerBirthDay = UIPickerView()
    var pickerSex = UIPickerView()
    var pickerBorn = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.nameTextField.delegate = self
        
        pickerBirthDay.delegate = self
        pickerSex.delegate = self
        pickerBorn.delegate = self
        
        //ピッカービューにタグを設定(どのピッカーを表示するのか特定するため)
        pickerBirthDay.tag = 1
        pickerSex.tag = 2
        pickerBorn.tag = 3
        
        //テキストフィールドを選択した際に開くピッカービューを設定
        birthDayTextField.inputView = pickerBirthDay
        sexTextField.inputView = pickerSex
        bornTextField.inputView = pickerBorn
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //キーボードのリターンが押された際にキーボードを閉じる
        nameTextField.resignFirstResponder();
        return true;
    }
    
    //ピッカーの種類数を指定
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        var numberOfComponents:Int = 0
        
        switch pickerView.tag {
            case 1:
                //誕生日
                numberOfComponents = 3
                break
            case 2:
                //性別
                numberOfComponents = 1
                break
            case 3:
                //生まれ
                numberOfComponents = 1
                break
            default:
                break
        }
        return numberOfComponents
    }
    
    //ピッカーに表示する要素数を指定
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var numberOfRows:Int = 0
        
        switch pickerView.tag {
        case 1:
            //誕生日
            numberOfRows = 3
            break
        case 2:
            //性別
            numberOfRows = sexArray.count
            break
        case 3:
            //生まれ
            numberOfRows = bornArray.count
            break
        default:
            break
        }
        return numberOfRows
        
    }
    
    //ピッカーに表示するタイトルを設定
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var pickerTile:String = ""
        
        switch pickerView.tag {
        case 1:
            //誕生日
            //pickerTile =
            break
        case 2:
            //性別
            pickerTile = sexArray[row]
            break
        case 3:
            //生まれ
            pickerTile = bornArray[row]
            break
        default:
            break
        }
        return pickerTile
    }

    //ピッカーで選択した要素をテキストフィールドに反映
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var pickerTile:String = ""
        
        switch pickerView.tag {
        case 1:
            //誕生日
            //pickerTile =
            break
        case 2:
            //性別
            sexTextField.text = sexArray[row]
            break
        case 3:
            //生まれ
            bornTextField.text = bornArray[row]
            break
        default:
            break
        }
    }

}

