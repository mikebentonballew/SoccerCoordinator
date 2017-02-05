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
var players = [[String: String]]()
var experiencedPlayers = [[String: String]]()
var inexperiencedPlayers = [[String: String]]()
var teamSharks = [[String : String]]()
var teamDragons = [[String: String]]()
var teamRaptors = [[String: String]]()
var letters: [String] = []
var teams = [Any]()

// Append player data to players array
func appendPlayerWith(name: String, height: String, skill: String, guardian: String) -> () {
    players.append(["Name" : name, "Height" : height, "Skill" : skill, "Guardian" : guardian])
}

// Pass the player data one by one to the function
// No more efficient that just manually appending, but I wanted more practice with functions
appendPlayerWith(name: "Joe Smith", height: "42", skill: "YES", guardian: "Jim and Jan Smith")
appendPlayerWith(name: "Jill Tanner", height: "36", skill: "YES", guardian: "Clara Tanner")
appendPlayerWith(name: "Bill Bon", height: "43", skill: "YES", guardian: "Sara and Jenny Bon")
appendPlayerWith(name: "Eva Gordon", height: "45", skill: "NO", guardian: "Wendy and Mike Gordon")
appendPlayerWith(name: "Matt Gill", height: "40", skill: "NO", guardian: "Charles and Sylvia Gill")
appendPlayerWith(name: "Kimmy Stein", height: "41", skill: "NO", guardian: "Bill and Hillary Stein")
appendPlayerWith(name: "Sammy Adams", height: "45", skill: "NO", guardian: "Jeff Adams")
appendPlayerWith(name: "Karl Saygan", height: "42", skill: "YES", guardian: "Heather Bledsoe")
appendPlayerWith(name: "Suzane Greenberg", height: "44", skill: "YES", guardian: "Henrietta Dumas")
appendPlayerWith(name: "Sal Dali", height: "41", skill: "NO", guardian: "Gala Dali")
appendPlayerWith(name: "Joe Kavalier", height: "39", skill: "NO", guardian: "Sam and Elaine Kavalier")
appendPlayerWith(name: "Ben Finkelstein", height: "44", skill: "NO", guardian: "Aaron and Jill Finkelstein")
appendPlayerWith(name: "Diego Soto", height: "41", skill: "YES", guardian: "Robin and Sarika Soto")
appendPlayerWith(name: "Chloe Alaska", height: "47", skill: "NO", guardian: "David and Jamie Alaska")
appendPlayerWith(name: "Arnold Willis", height: "43", skill: "NO", guardian: "Claire Willis")
appendPlayerWith(name: "Phillip Helm", height: "44", skill: "YES", guardian: "Thomas Helm and Eva Jones")
appendPlayerWith(name: "Les Clay", height: "45", skill: "YES", guardian: "Wynonna Brown")
appendPlayerWith(name: "Herschel Krustofski", height: "45", skill: "YES", guardian: "Hyman and Rachel Krustofski")

var counter: Int = 0

// Split beginning array of players into experienced and inexperienced arrays
while counter < players.count {
    if players[counter]["Skill"] == "YES" {
        experiencedPlayers.append(players[counter])
    } else if players[counter]["Skill"] == "NO" {
        inexperiencedPlayers.append(players[counter])
    }
    counter += 1
}

// This definitely fails unless working with arrays of sizes multiples of 3
var experiencedPlayerCounter: Int = 0

while experiencedPlayerCounter < experiencedPlayers.count {
    teamSharks.append(experiencedPlayers.remove(at: 0))
    teamDragons.append(experiencedPlayers.remove(at: 0))
    teamRaptors.append(experiencedPlayers.remove(at: 0))
}


var pCounter: Int = 0
var numberOfTeams: Int = 3 // MAGIC NUMBER I KNOW :)
var tPosition: Int = 0

while pCounter < inexperiencedPlayers.count {
    tPosition = 0
    while tPosition < numberOfTeams {
        print(tPosition)
        print(pCounter)
        tPosition += 1
        pCounter += 1
    }
}


/*
while 0 < inexperiencedPlayers.count {
    teamSharks.append(inexperiencedPlayers.remove(at: 0))
    teamDragons.append(inexperiencedPlayers.remove(at: 0))
    teamRaptors.append(inexperiencedPlayers.remove(at: 0))
}
*/

/*
 -------------------------------------------------------------
 Generate Letters to each parent/guardian.
 Dragons - March 17, 1pm
 Sharks - March 17, 3pm
 Raptors - March 18, 1pm
 
 Lettes to include: the player’s name, guardian names, team name, and date/time of their first team practice.
 -------------------------------------------------------------
*/

func writeLetterFor(array: [[String : String]], team: String, date: String) -> ([String]) {
    var teamLetters: [String] = []
    var memberName: String
    var memberGuardian: String
    var teamCounter: Int = 0
    while teamCounter < array.count {
        memberName = array[teamCounter]["Name"]!
        memberGuardian = array[teamCounter]["Guardian"]!
        teamLetters.append("Dear \(memberGuardian): \n\n We would like to welcome you and \(memberName) as the newest members of \(team). \n\n Please note that the first practice will be on \(date).\n\n Thank You,\n   SportsStaff")
        teamCounter += 1
    }
    return teamLetters
}

// Pass each team array along with team name and practice date to the function to write a letter.
letters += writeLetterFor(array: teamSharks, team: "Team Sharks", date: "March 17, 3pm")
letters += writeLetterFor(array: teamDragons, team: "Team Dragons", date: "March 17, 1pm")
letters += writeLetterFor(array: teamRaptors, team: "Team Raptors", date: "March 18, 1pm")















