//
//  DataManager.swift
//  JustEat
//
//  Created by Farhan Mirza on 16/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

// DataManager class to handle local data

class DataManager {
    
    static let shared = DataManager()
    
    // save last used outcode by user
    func saveLastUsedOutcode(outcode : String) {
        UserDefaults.standard.set(outcode, forKey: "outcode")
    }
    
    // get last used outcode by user
    func getLastUsedOutcode() -> String {
        return UserDefaults.standard.string(forKey: "outcode") ?? ""
    }
    
    // clear all saved data if required
    func clearAllSavedData() {
        func resetDefaults() {
            let defaults = UserDefaults.standard
            let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
                defaults.removeObject(forKey: key)
            }
        }
    }
}
