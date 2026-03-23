"
When used in a card, can be played out of turn to remove an active permanent card from the game
"
Class {
	#name : 'CancellationEffect',
	#superclass : 'CardEffect',
	#instVars : [
		'targetShip',
		'targetCardName'
	],
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'as yet unclassified' }
CancellationEffect class >> targetTo: aTargetShip whoPlayed: aTargetCardName [
	^ self new intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName
]

{ #category : 'actions' }
CancellationEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [
	aGame applyCancellationTo: targetShip whoPlayed: targetCardName
]

{ #category : 'as yet unclassified' }
CancellationEffect >> checkIfTargetCardNeeded [

	Error signal: 'Cancellation Card requiers a target card.'
]

{ #category : 'as yet unclassified' }
CancellationEffect >> checkIfTargetShipNeeded [

	Error signal: 'Cancellation Card requiers a target ship.'
]

{ #category : 'as yet unclassified' }
CancellationEffect >> intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName [

	targetShip := aTargetShip.
	targetCardName := aTargetCardName
]

{ #category : 'testing' }
CancellationEffect >> isCalled: aName [

	^ 'Cancellation Card' = aName
]

{ #category : 'as yet unclassified' }
CancellationEffect >> targetTo: aTargetShip [

	Error signal:'Cancellation Card requiers a target card.'
]

{ #category : 'as yet unclassified' }
CancellationEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetTo: aTargetShip whoPlayed: aTargetCardName
]
