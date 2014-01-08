Board = require("../../lib/board")
captureException = require("./helpers/exceptions").captureException

describe "Board", ->
  Given -> @subject = new Board()

  describe "initial state", ->
    Then -> @subject.grid[0][0].state == "none"
    And -> @subject.grid[2][2].state == "none"
    And -> @subject.grid[3] == undefined

  describe "#place3SpotShip", ->
    Given -> [@x, @y] = [0, 0]
    Given -> @orientation = "horizontal"

    When -> @result = @subject.place3SpotShip(@x, @y, @orientation)
    Then -> @result == @subject
    And -> @subject.grid[0][0].ship == "ship"
    And -> @subject.grid[1][0].ship == "ship"
    And -> @subject.grid[2][0].ship == "ship"

  # TODO: No placement off the board
  describe "#placeShipOffBoard", ->
    Given -> [@x, @y] = [-1, 0]
    Given -> @orientation = "horizontal"

    When -> @f = => @subject.place3SpotShip(@x, @y, @orientation)
    Then -> expect(@f).toThrow
    And -> @subject.grid[0][0].state == "none"
    And -> @subject.grid[0][1].state == "none"