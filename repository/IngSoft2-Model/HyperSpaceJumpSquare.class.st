"
A square that increases landed ship position in ""4"" squares. (Positions: a dictionary: 'shipName' -> position; positions from current lap, since this object doesn't receive lap information)
"
Class {
	#name : 'HyperSpaceJumpSquare',
	#superclass : 'Square',
	#instVars : [
		'forwardPush'
	],
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'as yet unclassified' }
HyperSpaceJumpSquare class >> withForwardPush: aNumberOfSquares [

	^ self new initializeWithForwardPush: aNumberOfSquares
]

{ #category : 'actions' }
HyperSpaceJumpSquare >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

	isReversed
		ifTrue: [ self applyReversedEffectTo: shipList forShip: aShip ]
		ifFalse: [
			aShip moveForwardBy: forwardPush.
			aShip breakAShield ]
]

{ #category : 'actions' }
HyperSpaceJumpSquare >> applyReversedEffectTo: shipList forShip: aShip [

	shipList do: [ :ship |
		ship = aShip ifFalse: [
			ship moveForwardBy: forwardPush.
			ship breakAShield ] ]
]

{ #category : 'initialization' }
HyperSpaceJumpSquare >> initializeWithForwardPush: aNumberOfSquares [

	forwardPush := aNumberOfSquares.
	isReversed := false.
]
