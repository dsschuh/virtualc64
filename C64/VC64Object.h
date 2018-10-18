/*!
 * @header      VC64Object.h
 * @author      Dirk W. Hoffmann, www.dirkwhoffmann.de
 * @copyright   2006 - 2018 Dirk W. Hoffmann
 */
/*              This program is free software; you can redistribute it and/or modify
 *              it under the terms of the GNU General Public License as published by
 *              the Free Software Foundation; either version 2 of the License, or
 *              (at your option) any later version.
 *
 *              This program is distributed in the hope that it will be useful,
 *              but WITHOUT ANY WARRANTY; without even the implied warranty of
 *              MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *              GNU General Public License for more details.
 *
 *              You should have received a copy of the GNU General Public License
 *              along with this program; if not, write to the Free Software
 *              Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef _VC64OBJECT_INC
#define _VC64OBJECT_INC

#include "basic.h"
#include "C64_types.h"

/*! @brief    Common functionality of all VirtualC64 objects.
 *  @details  This class defines the base functionality of all objects such as 
 *            printing debug messages.
 */
class VC64Object {

private:
    
    //! @brief    Debug level for this component
    unsigned debugLevel;

    /*! @brief    Stores how many trace messages are left to be printed
     *  @details  If positive, this value is decremented in tracingEnabled()
     *  @details  A negative value indicates that tracing should continue forever
     */
     int traceCounter;

    /*! @brief    Textual description of this object
     *  @details  Most debug output methods preceed their output with this string.
     *  @note     The default value is NULL. In that case, no prefix is printed.
     */
    const char *description;

public:

    //! Constructor
    VC64Object();
    
    //! Destructor
    virtual ~VC64Object();

    
    //
    //! @functiongroup Initializing the component
    //
    
    //! @brief    Changes the debug level for a specific object.
    void setDebugLevel(unsigned level) { debugLevel = level; }

    //! @brief    Returns the textual description.
    const char *getDescription() { return description ? description : ""; }

    //! @brief    Assigns a textual description.
    void setDescription(const char *str) { description = strdup(str); }

    
    //
    //! @functiongroup Debugging the component
    //
    
    //! @brief    Returns true iff trace mode is enabled.
    bool tracingEnabled();
        
    //! @brief    Starts tracing.
    void startTracing(int counter = -1) { traceCounter = counter; }

    //! @brief    Stops tracing.
    void stopTracing() { traceCounter = 0; }
    
    
    //
    //! @functiongroup Printing messages to console
    //
    
    //! @brief    Prints a message to console.
    void msg(const char *fmt, ...);
    
    //! @brief    Prints a message to the console if debug level is high enough.
    void msg(int level, const char *fmt, ...);
    
    /*! @brief    Prints a debug message to the console
     *  @details  Debug messages are prefixed by a custom string naming the component.
     */
    void debug(const char *fmt, ...);
    
    /*! @brief    Prints a debug message if debug level is high enough.
     *  @details  Debug messages are prefixed by a custom string naming the component.
     */
    void debug(int level, const char *fmt, ...);

    /*! @brief    Prints a warning message to the console.
     *  @details  Warning messages are prefixed by a custom string naming the component.
     */
    void warn(const char *fmt, ...);
    
    /*! @brief    Prints a panic message to console or a log file.
     *  @details  Panic messages are prefixed by a custom string naming the component.
     */
    void panic(const char *fmt, ...);    
};

#endif
