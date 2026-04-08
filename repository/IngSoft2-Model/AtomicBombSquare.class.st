"
A square that resets all ships positions (a dictionary: 'shipName' -> position) to ""1"" (positions from current lap, since this object doesn't receive lap information)
"
Class {
	#name : 'AtomicBombSquare',
	#superclass : 'EmptySquare',
	#instVars : [
		'isReversed'
	],
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'as yet unclassified' }
AtomicBombSquare class >> withDefaultPolarity [
	^ self new initializeWithDefaultPolarity
]

{ #category : 'actions' }
AtomicBombSquare >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

	isReversed
		ifTrue: [
			self
				applyReversedEffectTo: shipList
				forShip: aShip
				on: aBoard
				managedBy: aShipManager ]
		ifFalse: [
			shipList do: [ :ship |
				ship goToFirstSquare.
				ship breakAShield ] ]
]

{ #category : 'as yet unclassified' }
AtomicBombSquare >> applyReversedEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [
]

{ #category : 'checking' }
AtomicBombSquare >> checkIf: aShip shouldBattleOn: aBoard managedBy: aShipManager [
]

{ #category : 'initialization' }
AtomicBombSquare >> initializeWithDefaultPolarity [
	isReversed := false.
]

{ #category : 'as yet unclassified' }
AtomicBombSquare >> reverseSquareEffect [
	isReversed := isReversed not.
]
