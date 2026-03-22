"
A spaceship game.
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'lapsGoal',
		'shipManager',
		'ships',
		'board',
		'activeCards',
		'nextSquare'
	],
	#category : 'IngSoft2-Model-Game',
	#package : 'IngSoft2-Model',
	#tag : 'Game'
}

{ #category : 'validation' }
Game class >> checkValidLapCount: aNumberOfLaps [

	aNumberOfLaps >= 1 ifFalse: [
		Error signal: 'Lap count must be equal or higher than 1' ]
]

{ #category : 'validation' }
Game class >> checkValidShipNames: shipNames [

	| duplicatedNames |
	shipNames isNotEmpty ifFalse: [
		Error signal: 'At least one ship is required' ].

	duplicatedNames := shipNames copy asSet select: [ :aName |
		                   (shipNames occurrencesOf: aName) > 1 ].

	duplicatedNames ifNotEmpty: [
		Error signal:
			duplicatedNames asCommaStringAnd , ' listed more than once' ]
]

{ #category : 'initialization' }
Game class >> createShipsNamed: shipNames on: squareCount drawingFrom: allCards [

	| ships cards |
	ships := OrderedCollection new.

	1 to: shipNames size do: [ :i |
		cards := OrderedCollection new.
		cards add: allCards atRandom.
		cards add: allCards atRandom.

		ships add: (Ship
				 for: (shipNames at: i)
				 startingAt: (Position atStartOfLapWithSquareNumbers: squareCount)
				 shieldedWith: 3
				 holding: cards) ].
	^ ships
]

{ #category : 'initialization' }
Game class >> gamePlayedBy: shipNames on: aBoard toPlayFor: aLapGoal [

	| ships allCards |
	self checkValidShipNames: shipNames.
	self checkValidLapCount: aLapGoal.

	allCards := {
		            Card speedWithoutOwner.
		            Card mercenaryWithoutOwner .
		            Card accelerationWithoutOwner.
		            Card cancellationWithoutOwner.
		            Card redoWithoutOwner.
		            Card repeatWithoutOwner }.
	ships := self
		         createShipsNamed: shipNames
		         on: aBoard numberOfSquares
		         drawingFrom: allCards.


	^ self new initializeWith: ships on: aBoard toPlayFor: aLapGoal
]

{ #category : 'initialization' }
Game class >> gamePlayedBy: shipNames on: aBoard toPlayFor: aLapGoal drawingFrom: aDeckOfCards [

	| ships cards |
	self checkValidShipNames: shipNames.
	self checkValidLapCount: aLapGoal.

	ships := OrderedCollection new.

	1 to: shipNames size do: [ :i |
		cards := OrderedCollection new.
		cards add: aDeckOfCards removeFirst.
		cards add: aDeckOfCards removeFirst.
		ships add: (Ship
				 for: (shipNames at: i)
				 startingAt:
				 (Position atStartOfLapWithSquareNumbers: aBoard numberOfSquares)
				 shieldedWith: 3
				 holding: cards) ].

	^ self new initializeWith: ships on: aBoard toPlayFor: aLapGoal
]

{ #category : 'actions' }
Game >> applyCancellationTo: aTargetShip whoPlayed: aTargetCardName [

	| cardToBeCancelled |
	(activeCards anySatisfy: [ :aCard |
		 aCard is: aTargetCardName ownedBy: aTargetShip ]) ifFalse: [
		Error signal: 'Targeted Card is not within active permanent cards' ].

	cardToBeCancelled := activeCards detect: [ :aCard |
		                     aCard is: aTargetCardName ownedBy: aTargetShip ].
	activeCards remove: cardToBeCancelled
]

{ #category : 'as yet unclassified' }
Game >> applyRedoFrom: aShip [

	| newCard cardToBeReplayed |
	activeCards ifEmpty: [ Error signal: 'No card has been played yet' ].

	cardToBeReplayed := (activeCards at: 1) findCardToBeReplayed:
		                    activeCards.
	newCard := cardToBeReplayed playedBy: aShip.

	newCard
		checkForTurnRequierementwhen: aShip
		playsACardDuringTheTurnOf: (ships at: 1).
	newCard checkIfTargetShipNeeded.
	newCard checkIfTargetCardNeeded.

	newCard applyOnPlayed: self to: ''.
	activeCards addFirst: newCard
]

{ #category : 'as yet unclassified' }
Game >> applyRedoTo: aTargetShip from: aShip [

	| newCard cardToBeReplayed |
	activeCards ifEmpty: [ Error signal: 'No card has been played yet' ].

	cardToBeReplayed := (activeCards at: 1) findCardToBeReplayed:
		                    activeCards.
	newCard := cardToBeReplayed playedBy: aShip targetedTo: aTargetShip.


	newCard
		checkForTurnRequierementwhen: aShip
		playsACardDuringTheTurnOf: (ships at: 1).
	newCard checkIfTargetCardNeeded.

	newCard applyOnPlayed: self to: aTargetShip.
	activeCards addFirst: newCard
]

{ #category : 'actions' }
Game >> applyRedoTo: aTargetShip from: aShip whoPlayed: aCard [

	| newCard cardToBeReplayed |
	activeCards ifEmpty: [ Error signal: 'No card has been played yet' ].


	cardToBeReplayed := (activeCards at: 1) findCardToBeReplayed:
		                    activeCards.
	newCard := cardToBeReplayed
		           playedBy: aShip
		           targetedTo: aTargetShip
		           whoPlayed: aCard.


	newCard
		checkForTurnRequierementwhen: aShip
		playsACardDuringTheTurnOf: (ships at: 1).

	newCard applyOnPlayed: self to: aTargetShip.
	activeCards addFirst: newCard
]

{ #category : 'actions' }
Game >> applyRepeatTo: aTarget [

	| targetedShip |
	targetedShip := self searchShipByName: aTarget playerName .

	shipManager landShip: targetedShip atSquare: nextSquare on: board
]

{ #category : 'accessing' }
Game >> cardsInHandOf: aShipName [

	| queriedShip |
	queriedShip := self searchShipByName: aShipName.

	^ queriedShip cardsInHand
]

{ #category : 'actions' }
Game >> checkForActiveGame [

	self isGameFinished ifTrue: [ Error signal: 'The game has finished' ].
	^ true
]

{ #category : 'as yet unclassified' }
Game >> checkIf: aShip canHireAsMercenary: anotherShip [
		| activeMercenaryCards |
	activeMercenaryCards := activeCards select: [ :aCard | aCard hasSameTypeAs: 'Mercenary Card' ]. 
	
	(activeMercenaryCards anySatisfy: [ :aCard | aCard hasTarget: anotherShip ]) ifTrue: [ Error signal: 'Ship has already been hired as mercenary' ].
]

{ #category : 'actions' }
Game >> checkIfAllowedToPlay: aShip [

	(shipManager hasTurnSkips: aShip) ifTrue: [
		Error signal: aShip playerName , ' must skip this turn' ]
]

{ #category : 'initialization' }
Game >> initializeWith: aSetOfships on: aBoard toPlayFor: aNumberOfLaps [

	ships := aSetOfships deepCopy.
	lapsGoal := aNumberOfLaps.
	activeCards := OrderedCollection new.
	shipManager := ShipManager withShips: ships andActiveCards: activeCards.
	board := aBoard.	
	nextSquare := EmptySquare new.

]

{ #category : 'accessing' }
Game >> isGameFinished [

	^ ships anySatisfy: [ :ship | ship hasReachedLap: lapsGoal ]
]

{ #category : 'accessing' }
Game >> lapCountOf: aShipName [

	| queriedShip |
	queriedShip := self searchShipByName: aShipName.

	^ queriedShip lapCount
]

{ #category : 'actions' }
Game >> play [

	| diceOutcome aShip extraPointsForThrow |
	self checkForActiveGame.
	aShip := ships addLast: ships removeFirst.
	self checkIfAllowedToPlay: aShip.
	diceOutcome := board rollDice.
	extraPointsForThrow := 0.
	activeCards do: [ :aCard |
		extraPointsForThrow := extraPointsForThrow
		                       + (aCard applyThrowEffectFor: aShip) ].

	shipManager moveShip: aShip to: diceOutcome + extraPointsForThrow.
	nextSquare := board squareAt: aShip boardPosition.
	shipManager landShip: aShip atSquare: nextSquare on: board
]

{ #category : 'accessing' }
Game >> positionOf: aShipName [

	| queriedShip |
	queriedShip := self searchShipByName: aShipName.

	^ queriedShip boardPosition
]

{ #category : 'accessing' }
Game >> rank: aSetOfShips [

	| shipsOrderedByRanking |
	shipsOrderedByRanking := aSetOfShips sorted: [ :aShip :anotherShip |
		                         aShip hasGreaterPosition: anotherShip ].

	^ OrderedCollection withAll: shipsOrderedByRanking
]

{ #category : 'accessing' }
Game >> rankingOf: aShipName [

	| queriedShip |
	queriedShip := self searchShipByName: aShipName.

	^ (self rank: ships) indexOf: queriedShip
]

{ #category : 'actions' }
Game >> searchShipByName: queriedShipName [

	^ ((ships select: [ :aShip | aShip playerName = queriedShipName ])
		   ifEmpty: [
		   Error signal: 'No ship by that name exists in the game' ]) at: 1
]

{ #category : 'accessing' }
Game >> shieldfOf: aShipName [

	| queriedShip |
	queriedShip := self searchShipByName: aShipName.

	^ queriedShip shields
]

{ #category : 'actions' }
Game >> skip [

	| aShip |
	self checkForActiveGame.
	aShip := ships addLast: ships removeFirst.
	aShip rechargeShields
]

{ #category : 'actions' }
Game >> throw: aCardName from: aShipName [
	| queriedShip card |
	queriedShip := self searchShipByName: aShipName.

	
	card := queriedShip throw: aCardName whenTurnOf: (ships at: 1).
	
	card applyOnPlayed: self to: ''.
	activeCards addFirst: card.
]

{ #category : 'actions' }
Game >> throw: aCardName from: aShipName to: aTargetShipName [

	| queriedShip card queriedTargetShip |
	queriedShip := self searchShipByName: aShipName.
	queriedTargetShip := self searchShipByName: aTargetShipName.
	
	card := queriedShip throw: aCardName whenTurnOf: (ships at: 1) to: queriedTargetShip.
	
	card applyOnPlayed: self to: queriedTargetShip. 
	activeCards addFirst: card.
]

{ #category : 'actions' }
Game >> throw: aCardName from: aShipName to: aTargetShipName whoPlayed: aTargetCardName [

	| queriedShip card queriedTargetShip |
	queriedShip := self searchShipByName: aShipName.
	queriedTargetShip := self searchShipByName: aTargetShipName.
	
	card := queriedShip throw: aCardName whenTurnOf: (ships at: 1) to: queriedTargetShip whoPlayed: aTargetCardName.
	
	card applyOnPlayed: self to: queriedTargetShip.
	activeCards addFirst: card.
]

{ #category : 'accessing' }
Game >> winner [

	self isGameFinished ifFalse: [
		Error signal: 'The game is still being played' ].

	^ ((self rank: ships) at: 1) playerName
]
