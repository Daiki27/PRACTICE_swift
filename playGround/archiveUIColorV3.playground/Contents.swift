/*
 UIColor -> Encode -> Data -> save -> Get Any -> Data -> Decode -> Any -> UIColor
 Any型だから, 同じ階層内にあるUIColorとかDate型にasでキャストができるはず.
 だから, UIColorを(NS)Dateとかにasではキャストすることができない.
 UIColorをエンコードして, エンコードしたものを保存する.
 エンコードされたUIColorを取得し, デコードしてUIColorにasでキャストすることでUIColorをUDから取得できる.
 */

import UIKit

extension UserDefaults {
    func setColor(_ color: UIColor, forKey key: String){
        //UIColorをUserDefaultsに保存するための関数.
        //保存したい色をエンコードする.
        let colorEncoded = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
        if let setColor = colorEncoded{
            //エンコードした色をUserDefaultsに保存する.
            defaults.set(setColor, forKey: key)
        }else{
            print("Failed to encode the color.")
        }
    }
    
    func colorObject(forKey key: String) -> UIColor?{
        //UserDefaultsからUIColorを取得するための関数.
        var colorReturned: UIColor?
        let colorFromUD = defaults.object(forKey: "myColor") as? Data
        //シャドーイング, OptionalBindingのときのみ使える. 変数多くなるからこう書けると便利.
        if let colorFromUD = colorFromUD{
            let colorDecoded = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorFromUD) as? UIColor
            if let colorDecoded = colorDecoded{
                colorReturned = colorDecoded
            }else{
                print("Failed to decode the color.")
            }
        }else{
            print("Failed to load the color.")
        }
        return colorReturned
    }
}

let defaults = UserDefaults.standard
//保存したい色.
let myColor = UIColor.red
//保存したい色をUserDefaultsに保存する.
defaults.setColor(myColor, forKey: "myColor")
//UserDefaultsから色情報を取得する.
let backgroundColor = defaults.colorObject(forKey: "myColor")
if let backgroundColor = backgroundColor{
    print(backgroundColor)
}else{
    print("Failed to load the color from UserDefaults.")
}
