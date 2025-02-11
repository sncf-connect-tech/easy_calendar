//
//  EasyEventStoreProtocol.swift
//  eventide
//
//  Created by CHOUPAULT Alexis on 23/01/2025.
//

import Foundation

protocol EasyEventStoreProtocol {
    func createCalendar(title: String, color: UIColor) throws -> Calendar
    
    func retrieveCalendars(onlyWritable: Bool) -> [Calendar]
    
    func deleteCalendar(calendarId: String) throws -> Void
    
    func createEvent(calendarId: String, title: String, startDate: Date, endDate: Date, isAllDay: Bool, description: String?, url: String?) throws -> Event
    
    func retrieveEvents(calendarId: String, startDate: Date, endDate: Date) throws -> [Event]
    
    func deleteEvent(eventId: String) throws -> Void
    
    func createReminder(timeInterval: TimeInterval, eventId: String) throws -> Event
    
    func deleteReminder(timeInterval: TimeInterval, eventId: String) throws -> Event
}
