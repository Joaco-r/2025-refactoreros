"
A square that doesn't affect ships positions (a dictionary: 'shipName' -> position; positions from current lap, since this object doesn't receive lap information)
"
Class {
	#name : 'Square',
	#superclass : 'Object',
	#instVars : [
		'isReversed'
	],
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'as yet unclassified' }
Square class >> empty [
	^ self new initializeWithDefaultPolarity
]

{ #category : 'actions' }
Square >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

]

{ #category : 'checking' }
Square >> checkIf: aShip shouldBattleOn: aBoard managedBy: aShipManager [

	aShipManager checkBattles: aShip on: aBoard
]

{ #category : 'initialization' }
Square >> initializeWithDefaultPolarity [
	isReversed := false.
]

{ #category : 'as yet unclassified' }
Square >> reverseSquareEffect [

	isReversed := isReversed not
]
