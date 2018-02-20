//
//  MacKey.swift
//  VirtualC64
//
//  Created by Dirk Hoffmann on 18.02.18.
//

import Foundation
import Carbon.HIToolbox

/// The C64Key structure represents a physical keys on the C64 keyboard.
/// The key is specified by its row and coloumn position in the C64 keyboard matrix.
struct MacKey : Codable {
    
    /// Unique identifier for a key on the Mac keyboard
    var keyCode: UInt16 = 0
    
    /// Keycode in hex format as a string
    var keyCodeStr: String { return String.init(format: "%02X", keyCode) }
    
    // Textual description of this key
    var description: String?
    
    init(keyCode: UInt16, characters: String? = nil) {
        
        self.keyCode = keyCode
        self.description = characters
    }
    
    init(keyCode: Int, characters: String? = nil) {
        
        self.init(keyCode: UInt16(keyCode), characters: characters)
    }
}

extension MacKey: Equatable {
    static func ==(lhs: MacKey, rhs: MacKey) -> Bool {
        return lhs.keyCode == rhs.keyCode
    }
}

extension MacKey: Hashable {
    var hashValue: Int {
        return Int(self.keyCode)
    }
}

extension MacKey {
    
    // Layout independend keys. Keycodes are the same on all Mac keyboards
    static let ret = MacKey.init(keyCode: kVK_Return, characters: "")
    static let tab = MacKey.init(keyCode: kVK_Tab, characters: "")
    static let space = MacKey.init(keyCode: kVK_Space, characters: "")
    static let delete = MacKey.init(keyCode: kVK_Delete, characters: "")
    static let shift = MacKey.init(keyCode: kVK_Shift, characters: "SHIFT")
    static let option = MacKey.init(keyCode: kVK_Option, characters: "OPTION")
    static let control = MacKey.init(keyCode: kVK_Control, characters: "CTRL")
    
    static let F1 = MacKey.init(keyCode: kVK_F1, characters: "F1")
    static let F2 = MacKey.init(keyCode: kVK_F2, characters: "F2")
    static let F3 = MacKey.init(keyCode: kVK_F3, characters: "F3")
    static let F4 = MacKey.init(keyCode: kVK_F4, characters: "F4")
    static let F5 = MacKey.init(keyCode: kVK_F5, characters: "F5")
    static let F6 = MacKey.init(keyCode: kVK_F6, characters: "F6")
    static let F7 = MacKey.init(keyCode: kVK_F7, characters: "F7")
    static let F8 = MacKey.init(keyCode: kVK_F8, characters: "F8")
    
    static let curLeft = MacKey.init(keyCode: kVK_LeftArrow, characters: "")
    static let curRight = MacKey.init(keyCode: kVK_RightArrow, characters: "")
    static let curDown = MacKey.init(keyCode: kVK_DownArrow, characters: "")
    static let curUp = MacKey.init(keyCode: kVK_UpArrow, characters: "")
    
    // Layout dependend keys. Keycodes refer to the keys on a standard ANSI US keyboard
    struct ansi {
        static let grave = MacKey.init(keyCode: kVK_ANSI_Grave, characters: "")
        static let digit0 = MacKey.init(keyCode: kVK_ANSI_0, characters: "0")
        static let digit1 = MacKey.init(keyCode: kVK_ANSI_1, characters: "1")
        static let digit2 = MacKey.init(keyCode: kVK_ANSI_2, characters: "2")
        static let digit3 = MacKey.init(keyCode: kVK_ANSI_3, characters: "3")
        static let digit4 = MacKey.init(keyCode: kVK_ANSI_4, characters: "4")
        static let digit5 = MacKey.init(keyCode: kVK_ANSI_5, characters: "5")
        static let digit6 = MacKey.init(keyCode: kVK_ANSI_6, characters: "6")
        static let digit7 = MacKey.init(keyCode: kVK_ANSI_7, characters: "7")
        static let digit8 = MacKey.init(keyCode: kVK_ANSI_8, characters: "8")
        static let digit9 = MacKey.init(keyCode: kVK_ANSI_9, characters: "9")
        static let minus = MacKey.init(keyCode: kVK_ANSI_Minus, characters: "")
        static let equal = MacKey.init(keyCode: kVK_ANSI_Equal, characters: "")
        
        static let A = MacKey.init(keyCode: kVK_ANSI_A, characters: "A")
        static let B = MacKey.init(keyCode: kVK_ANSI_B, characters: "B")
        static let C = MacKey.init(keyCode: kVK_ANSI_C, characters: "C")
        static let D = MacKey.init(keyCode: kVK_ANSI_D, characters: "D")
        static let E = MacKey.init(keyCode: kVK_ANSI_E, characters: "E")
        static let F = MacKey.init(keyCode: kVK_ANSI_F, characters: "F")
        static let G = MacKey.init(keyCode: kVK_ANSI_G, characters: "G")
        static let H = MacKey.init(keyCode: kVK_ANSI_H, characters: "H")
        static let I = MacKey.init(keyCode: kVK_ANSI_I, characters: "I")
        static let J = MacKey.init(keyCode: kVK_ANSI_J, characters: "J")
        static let K = MacKey.init(keyCode: kVK_ANSI_K, characters: "K")
        static let L = MacKey.init(keyCode: kVK_ANSI_L, characters: "L")
        static let M = MacKey.init(keyCode: kVK_ANSI_M, characters: "M")
        static let N = MacKey.init(keyCode: kVK_ANSI_N, characters: "N")
        static let O = MacKey.init(keyCode: kVK_ANSI_O, characters: "O")
        static let P = MacKey.init(keyCode: kVK_ANSI_P, characters: "P")
        static let Q = MacKey.init(keyCode: kVK_ANSI_Q, characters: "Q")
        static let R = MacKey.init(keyCode: kVK_ANSI_R, characters: "R")
        static let S = MacKey.init(keyCode: kVK_ANSI_S, characters: "S")
        static let T = MacKey.init(keyCode: kVK_ANSI_T, characters: "T")
        static let U = MacKey.init(keyCode: kVK_ANSI_U, characters: "U")
        static let V = MacKey.init(keyCode: kVK_ANSI_V, characters: "V")
        static let W = MacKey.init(keyCode: kVK_ANSI_W, characters: "W")
        static let X = MacKey.init(keyCode: kVK_ANSI_X, characters: "X")
        static let Y = MacKey.init(keyCode: kVK_ANSI_Y, characters: "Y")
        static let Z = MacKey.init(keyCode: kVK_ANSI_Z, characters: "Z")
        static let leftBracket = MacKey.init(keyCode: kVK_ANSI_LeftBracket, characters: "")
        static let rightBracket = MacKey.init(keyCode: kVK_ANSI_RightBracket, characters: "")
        
        static let comma = MacKey.init(keyCode: kVK_ANSI_Comma, characters: ",")
        static let period = MacKey.init(keyCode: kVK_ANSI_Period, characters: ".")
        static let slash = MacKey.init(keyCode: kVK_ANSI_Slash, characters: "")
        static let backSlash = MacKey.init(keyCode: kVK_ANSI_Backslash, characters: "")
        static let semicolon = MacKey.init(keyCode: kVK_ANSI_Semicolon, characters: "")
        static let quote = MacKey.init(keyCode: kVK_ANSI_Quote, characters: "")
    }
    
    // Layout dependend keys. Keycodes refer to the keys on a standard ANSI US keyboard
    struct iso {
        static let hat = MacKey.init(keyCode: 0x0A, characters: "")
    }
}
