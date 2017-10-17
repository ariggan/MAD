//
//  cactus.swift
//  projectOne
//
//  Created by Ariel Riggan on 10/17/17.
//  Copyright © 2017 Ariel Riggan. All rights reserved.
//

import Foundation
import UIKit
import EventKit

class cactus: plant {
    override var plantName: String{ return "Cactus"}
    override var plantNotes: String{
        return "Be careful these plants are prickly. Do not overwater."}
    //var myRepeatRule=EKRecurrenceRule(recurrenceWith: .weekly, interval: 1, daysOfTheWeek: [EKRecurrenceDayOfWeek(EKWeekday(rawValue: 1)!)], daysOfTheMonth: nil, monthsOfTheYear: nil, weeksOfTheYear: nil, daysOfTheYear: nil, setPositions: nil, end: nil)
    //var reminderNum = 1
    override var plantImage: UIImage{
        return UIImage(named: "cactus")!}
}
