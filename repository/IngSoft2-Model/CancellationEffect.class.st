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
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
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
CancellationEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Cancellation Card requiers a target ship.' ].

	aTargetCardName ifEmpty: [
		Error signal: 'Cancellation Card requiers a target card.' ]
]

{ #category : 'testing' }
CancellationEffect >> hasTarget: aShip [

	^ targetShip = aShip
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
CancellationEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetTo: aTargetShip whoPlayed: aTargetCardName
]
