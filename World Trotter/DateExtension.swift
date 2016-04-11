//
//  DateExtension.swift
//  World Trotter
//
//  Created by Allen McKinstry on 11/04/2016.
//  Copyright © 2016 Allen McKinstry. All rights reserved.
//

import Foundation

extension NSDate : Comparable {}

//  To conform to Comparable, NSDate must also conform to Equatable.
//  Hence the == operator.
public func == (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedSame
}

public func > (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedDescending
}

public func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

public func <= (lhs: NSDate, rhs: NSDate) -> Bool {
    return  lhs == rhs || lhs < rhs
}

public func >= (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs == rhs || lhs > rhs
}