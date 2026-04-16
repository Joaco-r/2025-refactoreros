"
A square that doesn't affect ships positions (a dictionary: 'shipName' -> position; positions from current lap, since this object doesn't receive lap information)
"
Class {
	#name : 'EmptySquare',
	#superclass : 'Object',
	#instVars : [
		'isReversed'
	],
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'as yet unclassified' }
EmptySquare class >> withDefaultPolarity [
	^ self new initializeWithDefaultPolarity
]

{ #category : 'actions' }
EmptySquare >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

]

{ #category : 'checking' }
EmptySquare >> checkIf: aShip shouldBattleOn: aBoard managedBy: aShipManager [

	aShipManager checkBattles: aShip on: aBoard
]

{ #category : 'initialization' }
EmptySquare >> initializeWithDefaultPolarity [
	isReversed := false.
]

{ #category : 'as yet unclassified' }
EmptySquare >> reverseSquareEffect [

	isReversed := isReversed not
]
