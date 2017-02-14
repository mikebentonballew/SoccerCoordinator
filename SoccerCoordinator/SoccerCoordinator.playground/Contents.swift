//: Playground - noun: a place where people can play

import UIKit

/*
 --------------------------------------------------------
 Project 1 - Soccer League Coordinator in Swift
 Author - Michael Ballew
 --------------------------------------------------------
*/

/*
 --------------------------------------------------------
 Soccer Team Data
 Team Player        Height  Skilled Guardian
 --------------------------------------------------------
 Joe Smith              42	YES     Jim and Jan Smith
 Jill Tanner            36	YES     Clara Tanner
 Bill Bon               43	YES     Sara and Jenny Bon
 Eva Gordon             45	NO      Wendy and Mike Gordon
 Matt Gill              40	NO      Charles and Sylvia Gill
 Kimmy Stein            41	NO      Bill and Hillary Stein
 Sammy Adams            45	NO      Jeff Adams
 Karl Saygan            42	YES     Heather Bledsoe
 Suzane Greenberg       44	YES     Henrietta Dumas
 Sal Dali               41	NO      Gala Dali
 Joe Kavalier           39	NO      Sam and Elaine Kavalier
 Ben Finkelstein        44	NO      Aaron and Jill Finkelstein
 Diego Soto             41	YES     Robin and Sarika Soto
 Chloe Alaska           47	NO      David and Jamie Alaska
 Arnold Willis          43	NO      Claire Willis
 Phillip Helm           44	YES     Thomas Helm and Eva Jones
 Les Clay               42	YES     Wynonna Brown
 Herschel Krustofski	45	YES     Hyman and Rachel Krustofski
 --------------------------------------------------------
*/

// Initialize Empty Arrays of Definintions representing all players and each team
var players = [[String: Any]]()
var experiencedPlayers = [[String: Any]]()
var inexperiencedPlayers = [[String: Any]]()
var teamSharks = [[String : Any]]()
var teamDragons = [[String: Any]]()
var teamRaptors = [[String: Any]]()
var letters: [String] = []

// Append player data to players array
func appendPlayerWith(name: String, height: Double, skill: Bool, guardian: String) -> () {
    players.append(["Name" : name, "Height" : height, "Skill" : skill, "Guardian" : guardian])
}

// Pass the player data one by one to the function
// No more efficient that just manually appending, but I wanted more practice with functions
appendPlayerWith(name: "Joe Smith", height: 42.0, skill: true, guardian: "Jim and Jan Smith")
appendPlayerWith(name: "Jill Tanner", height: 36.0, skill: true, guardian: "Clara Tanner")
appendPlayerWith(name: "Bill Bon", height: 43.0, skill: true, guardian: "Sara and Jenny Bon")
appendPlayerWith(name: "Eva Gordon", height: 45.0, skill: false, guardian: "Wendy and Mike Gordon")
appendPlayerWith(name: "Matt Gill", height: 40.0, skill: false, guardian: "Charles and Sylvia Gill")
appendPlayerWith(name: "Kimmy Stein", height: 41.0, skill: false, guardian: "Bill and Hillary Stein")
appendPlayerWith(name: "Sammy Adams", height: 45.0, skill: false, guardian: "Jeff Adams")
appendPlayerWith(name: "Karl Saygan", height: 42.0, skill: true, guardian: "Heather Bledsoe")
appendPlayerWith(name: "Suzane Greenberg", height: 44.0, skill: true, guardian: "Henrietta Dumas")
appendPlayerWith(name: "Sal Dali", height: 41.0, skill: false, guardian: "Gala Dali")
appendPlayerWith(name: "Joe Kavalier", height: 39.0, skill: false, guardian: "Sam and Elaine Kavalier")
appendPlayerWith(name: "Ben Finkelstein", height: 44.0, skill: false, guardian: "Aaron and Jill Finkelstein")
appendPlayerWith(name: "Diego Soto", height: 41.0, skill: true, guardian: "Robin and Sarika Soto")
appendPlayerWith(name: "Chloe Alaska", height: 47.0, skill: false, guardian: "David and Jamie Alaska")
appendPlayerWith(name: "Arnold Willis", height: 43.0, skill: false, guardian: "Claire Willis")
appendPlayerWith(name: "Phillip Helm", height: 44.0, skill: true, guardian: "Thomas Helm and Eva Jones")
appendPlayerWith(name: "Les Clay", height: 45.0, skill: true, guardian: "Wynonna Brown")
appendPlayerWith(name: "Herschel Krustofski", height: 45.0, skill: true, guardian: "Hyman and Rachel Krustofski")

// Split beginning array of players into experienced and inexperienced arrays
var counter: Int = 0
while counter < players.count {
    if players[counter]["Skill"] as! Bool == true {
        experiencedPlayers.append(players[counter])
    } else if players[counter]["Skill"] as! Bool == false {
        inexperiencedPlayers.append(players[counter])
    }
    counter += 1
}

// Sort experienced and inexperienced groups in reverse order of one another
experiencedPlayers.sort(by: {$0["Height"] as! Double > $1["Height"] as! Double})
inexperiencedPlayers.sort(by: {$1["Height"] as! Double > $0["Height"] as! Double})

// While the experienced and inexperienced arrays of players are not empty, iterate through and append to team arrays
while 0 < experiencedPlayers.count {
    if experiencedPlayers.count != 0 {
        teamSharks.append(experiencedPlayers.remove(at: 0))
    }
    if experiencedPlayers.count != 0 {
        teamDragons.append(experiencedPlayers.remove(at: 0))
    }
    if experiencedPlayers.count != 0 {
        teamRaptors.append(experiencedPlayers.remove(at: 0))
    }
}

while 0 < inexperiencedPlayers.count {
    if inexperiencedPlayers.count != 0 {
        teamSharks.append(inexperiencedPlayers.remove(at: 0))
    }
    if inexperiencedPlayers.count != 0 {
        teamDragons.append(inexperiencedPlayers.remove(at: 0))
    }
    if inexperiencedPlayers.count != 0 {
        teamRaptors.append(inexperiencedPlayers.remove(at: 0))
    }
}


/*
 -------------------------------------------------------------
 Generate Letters to each parent/guardian.
 Dragons - March 17, 1pm
 Sharks - March 17, 3pm
 Raptors - March 18, 1pm
 
 Lettes to include: the player’s name, guardian names, team name, and date/time of their first team practice.
 -------------------------------------------------------------
*/

func writeLetterFor(array: [[String : Any]], team: String, date: String) -> ([String]) {
    var teamLetters: [String] = []
    var memberName: String
    var memberGuardian: String
    var teamCounter: Int = 0
    while teamCounter < array.count {
        memberName = array[teamCounter]["Name"] as! String
        memberGuardian = array[teamCounter]["Guardian"] as! String
        teamLetters.append("Dear \(memberGuardian): \n\n We would like to welcome you and \(memberName) as the newest members of \(team). \n\n Please note that the first practice will be on \(date).\n\n Thank You,\n   SportsStaff\n\n")
        teamCounter += 1
    }
    return teamLetters
}

// Pass each team array along with team name and practice date to the function to write a letter.
letters = writeLetterFor(array: teamSharks, team: "Team Sharks", date: "March 17, 3pm")
letters.append(contentsOf: writeLetterFor(array: teamRaptors, team: "Team Raptors", date: "March 18, 1pm"))
letters.append(contentsOf: writeLetterFor(array: teamDragons, team: "Team Dragons", date: "March 17, 1pm"))

for letter in letters{
    print(letter)
}

/*
 -------------------------------------------------------------
 Extra Credit
 Function to take an array of players and return the average height of team.
 -------------------------------------------------------------
*/

func getAverageTeamMemberHeight(array: [[String: Any]]) -> Double {
    var numberOfMembers: Double = 0.0
    var sumOfMemberHeights: Double = 0.0
    for teamMember in array {
        sumOfMemberHeights += teamMember["Height"] as! Double
        numberOfMembers += 1
    }
    print(sumOfMemberHeights/numberOfMembers)
    return (sumOfMemberHeights / numberOfMembers)
}

// Check Average Team Heights
getAverageTeamMemberHeight(array: teamRaptors)
getAverageTeamMemberHeight(array: teamDragons)
getAverageTeamMemberHeight(array: teamSharks)








