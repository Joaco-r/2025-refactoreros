"
Represents a player of the Game. 
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'playerName',
		'position',
		'shields',
		'maxShields',
		'cardsInHand'
	],
	#category : 'IngSoft2-Model-Game',
	#package : 'IngSoft2-Model',
	#tag : 'Game'
}

{ #category : 'accessing' }
Ship class >> for: aPlayerName startingAt: aPostion shieldedWith: aNumberOfShields holding: cards [

	^ self new
		  initializeFor: aPlayerName
		  startingAt: aPostion
		  shieldedWith: aNumberOfShields
		  holding: cards
]

{ #category : 'accessing' }
Ship >> boardPosition [

	^ position square
]

{ #category : 'actions' }
Ship >> breakAShield [

	shields > 0 ifTrue: [ shields := shields - 1 ]
]

{ #category : 'accessing' }
Ship >> cardsInHand [

	^ cardsInHand collect: [ :card | card ]
]

{ #category : 'actions' }
Ship >> drawCard: aCard [
		
	cardsInHand add: aCard
]

{ #category : 'actions' }
Ship >> goToFirstSquare [

	position := position goToStartOfLap
]

{ #category : 'comparing' }
Ship >> hasGreaterPosition: anotherShip [

	^  position isGreaterThan: (anotherShip position)
]

{ #category : 'testing' }
Ship >> hasReachedLap: lapsGoal [

	^ position lap = lapsGoal
]

{ #category : 'accessing' }
Ship >> hasShields [

	^ shields > 0
]

{ #category : 'accessing' }
Ship >> initializeFor: aPlayerName startingAt: aPostion shieldedWith: aNumberOfShields holding: cards [

	playerName := aPlayerName.
	position := aPostion.
	shields := aNumberOfShields.
	maxShields := aNumberOfShields.
	cardsInHand := cards

]

{ #category : 'accessing' }
Ship >> isAtTheSameSquareAs: anotherShip [

	^ position hasEqualPosition: anotherShip position
]

{ #category : 'accessing' }
Ship >> lapCount [

	^ position lap
]

{ #category : 'actions' }
Ship >> moveBackwardsBy: aPosition [

	position := position decreaseBy: aPosition
]

{ #category : 'actions' }
Ship >> moveForwardBy: aSquareDistance [

	position := position increaseBy: aSquareDistance
]

{ #category : 'accessing' }
Ship >> playerName [

	^ playerName
]

{ #category : 'accessing' }
Ship >> position [

	^ position
]

{ #category : 'actions' }
Ship >> rechargeShields [

	shields := maxShields
]

{ #category : 'accessing' }
Ship >> shields [

	^ shields
]

{ #category : 'actions' }
Ship >> throw: aCardName whenTurnOf: aShip [

	| card cardToBePlayed |
	(cardsInHand anySatisfy: [ :aCard | aCard hasAsEffect: aCardName ])
		ifFalse: [ Error signal: 'The ship does not have this card' ].
	card := cardsInHand detect: [ :aCard |
		        aCard hasAsEffect: aCardName ].

	card
		checkForTurnRequierementwhen: self
		playsACardDuringTheTurnOf: aShip.
	card checkIfTargetShipNeeded.
	card checkIfTargetCardNeeded.


	cardToBePlayed := card playedBy: self.
	cardsInHand remove: card.

	^ cardToBePlayed
]

{ #category : 'actions' }
Ship >> throw: aCardName whenTurnOf: aShip to: aTargetShip [

	| card cardToBePlayed |
	(cardsInHand anySatisfy: [ :aCard | aCard hasAsEffect: aCardName ])
		ifFalse: [ Error signal: 'The ship does not have this card' ].
	card := cardsInHand detect: [ :aCard |
		        aCard hasAsEffect: aCardName ].

	card
		checkForTurnRequierementwhen: self
		playsACardDuringTheTurnOf: aShip.
	card checkIfTargetCardNeeded.

	cardToBePlayed := card playedBy: self targetedTo: aTargetShip.
	cardsInHand remove: card.

	^ cardToBePlayed
]

{ #category : 'actions' }
Ship >> throw: aCardName whenTurnOf: aShip to: aTargetShip whoPlayed: aTargetCardName [

	| card cardToBePlayed |
	(cardsInHand anySatisfy: [ :aCard | aCard hasAsEffect: aCardName ])
		ifFalse: [ Error signal: 'The ship does not have this card' ].
	card := cardsInHand detect: [ :aCard |
		        aCard hasAsEffect: aCardName ].

	card checkForTurnRequierementwhen: self playsACardDuringTheTurnOf: aShip.
	
	cardToBePlayed := card playedBy: self targetedTo: aTargetShip whoPlayed: aTargetCardName.
	
	cardsInHand remove: card.

	^ cardToBePlayed
]
