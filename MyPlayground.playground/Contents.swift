import UIKit

// HOW TO USE CustomStringConvertible

class Shoe : CustomStringConvertible{
    let color : String
    let size : Int
    let hasLaces : Bool
    
    init(color : String, size: Int, hasLaces: Bool){
        self.color = color
        self.size = size
        self.hasLaces = hasLaces
    }
    
    var description: String{
        return "Shoe(color: \(color), size: \(size), hasLaces: \(hasLaces)) "
    }
}

let myShoe = Shoe(color: "Black", size: 12, hasLaces: true)
let yourShoe = Shoe(color: "Red", size: 8, hasLaces: false)
print(myShoe)
print(yourShoe)

// HOW TO USE EQUATABLE AND COMPARABLE
struct Employee : Equatable, Comparable, Codable{
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
    
    static func ==(lhs: Employee, rhs: Employee)-> Bool{
        return lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName
    }
    
    static func < (lhs: Employee, rhs: Employee) -> Bool{
        return lhs.lastName < rhs.lastName
    }
}

struct Company{
    var name: String
    var employees: [Employee]
}

let employee1 = Employee(firstName: "Ben", lastName: "Atkins",
jobTitle: "Front Desk", phoneNumber: "415-555-7767")

let employee2 = Employee(firstName: "Vera", lastName: "Carr",
jobTitle: "CEO", phoneNumber: "415-555-7768")

let employee3 = Employee(firstName: "Grant", lastName: "Phelps",
jobTitle: "Senior Manager", phoneNumber: "415-555-7770")

let employee4 = Employee(firstName: "Sang", lastName: "Han",
jobTitle: "Accountant", phoneNumber: "415-555-7771")

let employee5 = Employee(firstName: "Daren", lastName:
"Estrada", jobTitle: "Sales Lead", phoneNumber: "415-555-7772")

let employees = [employee1, employee2, employee3, employee4,
employee5]

//there are sort and sorted
//employees.sort(by: <)
let  sortedEmployees = employees.sorted(by: <)
for employee in sortedEmployees {
    print(employee.lastName)
}

// CODABLE
let ben = Employee(firstName: "Ben", lastName: "Atkins",
jobTitle: "Front Desk", phoneNumber: "415-555-7767")

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(ben){
    if let jsonString = String(data: jsonData, encoding: .utf8){
        print(jsonString)
    }
    
}

