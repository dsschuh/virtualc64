//
// This file is part of VirtualC64 - A user-friendly Commodore 64 emulator
//
// Copyright (C) Dirk W. Hoffmann. www.dirkwhoffmann.de
// Licensed under the GNU General Public License v3
//
// See https://www.gnu.org for license information
//

import Foundation


//
// Remote control commands
//

class VC64ResetCommand: NSScriptCommand {
    
    override func performDefaultImplementation() -> Any? {

        return resetScriptCmd(arguments: [:])
    }
}

class VC64ConfigureCommand: NSScriptCommand {
    
    override func performDefaultImplementation() -> Any? {
        
        track()
        if let arguments = evaluatedArguments {
            return configureScriptCmd(arguments: arguments)
        } else {
            return false
        }
    }
}

class VC64DragInCommand: NSScriptCommand {
    
    override func performDefaultImplementation() -> Any? {
        
        track()
        if let arguments = evaluatedArguments {
            return dragInScriptCmd(arguments: arguments)
        } else {
            return false
        }
    }
}

class VC64TypeTextCommand: NSScriptCommand {
    
    override func performDefaultImplementation() -> Any? {
        
        if let arguments = evaluatedArguments {
            return typeTextCmd(arguments: arguments)
        } else {
            return false
        }
    }
}

class VC64TakeScreenshotCommand: NSScriptCommand {
    
    override func performDefaultImplementation() -> Any? {
        
        if let arguments = evaluatedArguments {
            return takeScreenshotCmd(arguments: arguments)
        } else {
            return false
        }
    }
}