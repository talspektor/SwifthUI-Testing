import UIKit

var greeting = "Hello, playground"

class Database {
    func connect() -> Bool {
        return Bool.random()
    }
}

func connectDatabase() -> true {
    let database = Database()
    let didConnect = database.connect()
    if didConnect {
        return true
    } else {
        print("Could not connect to database")
        return false
    }
}

func determineSupportAgent(ticket) {
    
}
