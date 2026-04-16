"
A square that resets all ships positions (a dictionary: 'shipName' -> position) to ""1"" (positions from current lap, since this object doesn't receive lap information)
"
Class {
	#name : 'BlackHoleSquare',
	#superclass : 'Square',
	#instVars : [
		'backwardsPush'
	],
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'actions' }
BlackHoleSquare class >> checkValidBackwardsPushNumber: squaresToPushBackwards [

	squaresToPushBackwards >= 1 ifFalse: [
		Error signal:
			'Squares to push backwards must be equal or higher than 1' ]
]

{ #category : 'instance creation' }
BlackHoleSquare class >> withBackwardsPush: aNumberOfSquares [

	self checkValidBackwardsPushNumber: aNumberOfSquares.

	^ self new initializeWithBackwardsPush: aNumberOfSquares
]

{ #category : 'actions' }
BlackHoleSquare >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

	isReversed
		ifTrue: [ self applyReversedEffectTo: shipList forShip: aShip ]
		ifFalse: [ aShip moveBackwardsBy: backwardsPush ]
]

{ #category : 'as yet unclassified' }
BlackHoleSquare >> applyReversedEffectTo: shipList forShip: aShip [

	shipList do: [ :ship |
		ship = aShip ifFalse: [ ship moveBackwardsBy: backwardsPush ] ]
]

{ #category : 'initialization' }
BlackHoleSquare >> initializeWithBackwardsPush: aNumberOfSquares [

	backwardsPush := aNumberOfSquares.
	isReversed := false.
]
