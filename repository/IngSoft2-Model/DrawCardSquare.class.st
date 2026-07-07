"
A square that gives a new random card to a ship
"
Class {
	#name : 'DrawCardSquare',
	#superclass : 'Square',
	#instVars : [
		'deck'
	],
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'instance creation' }
DrawCardSquare class >> drawingFrom: aDeck [

	^ self new intializeWith: aDeck
]

{ #category : 'instance creation' }
DrawCardSquare class >> withDefaultDeck [

	| allCards |
	allCards := {
		            Card speedWithoutOwner.
		            Card mercenaryWithoutOwner .
		            Card accelerationWithoutOwner.
		            Card cancellationWithoutOwner.
		            Card redoWithoutOwner.
		            Card repeatWithoutOwner }.

	^ self new intializeWith: allCards
]

{ #category : 'actions' }
DrawCardSquare >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

	isReversed
		ifTrue: [ self applyReversedEffectTo: shipList forShip: aShip ]
		ifFalse: [ aShip drawCard: deck atRandom deepCopy ]
]

{ #category : 'actions' }
DrawCardSquare >> applyReversedEffectTo: shipList forShip: aShip [

	shipList do: [ :ship |
		ship = aShip ifFalse: [ ship drawCard: deck atRandom deepCopy ] ]
]

{ #category : 'initialization' }
DrawCardSquare >> intializeWith: aDeckOfCards [
	
	deck := aDeckOfCards.
	isReversed := false.
]
