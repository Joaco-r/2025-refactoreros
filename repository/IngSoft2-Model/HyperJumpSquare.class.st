"
A square that makes the ship advances M parsecs forward, following list values.
"
Class {
	#name : 'HyperJumpSquare',
	#superclass : 'Square',
	#instVars : [
		'rewards',
		'currentRewardIndex'
	],
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'actions' }
HyperJumpSquare class >> checkRewards: aParsecsList [

	aParsecsList ifEmpty: [
		Error signal: 'Parsec rewards cannot be empty' ]
]

{ #category : 'instance creation' }
HyperJumpSquare class >> withRewards: aSetOfDistances [

	self checkRewards: aSetOfDistances.

	^ self new initializeWithRewards: aSetOfDistances
]

{ #category : 'actions' }
HyperJumpSquare >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

	| distanceInSquares |
	distanceInSquares := (rewards at: currentRewardIndex) toParsecs
	                     // aBoard parsecsPerSquare.

	isReversed
		ifTrue: [
			self
				applyReversedEffectTo: shipList
				forShip: aShip
				with: distanceInSquares ]
		ifFalse: [ aShip moveForwardBy: distanceInSquares ].


	currentRewardIndex := currentRewardIndex + 1.
	currentRewardIndex > rewards size ifTrue: [ currentRewardIndex := 1 ]
]

{ #category : 'actions' }
HyperJumpSquare >> applyReversedEffectTo: shipList forShip: aShip with: aDistanceInSquares [

	shipList do: [ :ship |
		ship = aShip ifFalse: [
			ship moveForwardBy: aDistanceInSquares
			] ]
]

{ #category : 'initialization' }
HyperJumpSquare >> initializeWithRewards: aSetOfDistances [

	rewards := (aSetOfDistances asSortedCollection: [ :aDistance :anotherDistance | aDistance toParsecs > anotherDistance toParsecs])
		               asArray.
	currentRewardIndex := 1.
	isReversed := false.
]
