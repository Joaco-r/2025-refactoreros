"
When used in a card, can be played out of turn to reapply the last effect used in the game to a selected ship
"
Class {
	#name : 'RepeatEffect',
	#superclass : 'CardEffect',
	#instVars : [
		'targetShip'
	],
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'instance creation' }
RepeatEffect class >> targetedTo: aTargetPlayer [
	^ self new intializeTargetedTo: aTargetPlayer
]

{ #category : 'actions' }
RepeatEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyRepeatTo: aTargetShip
]

{ #category : 'as yet unclassified' }
RepeatEffect >> checkIfTargetShipNeeded [

	Error signal: 'Repeat Card requires a target ship.'
]

{ #category : 'initialization' }
RepeatEffect >> intializeTargetedTo: aTargetPlayer [

	targetShip := aTargetPlayer
]

{ #category : 'testing' }
RepeatEffect >> isCalled: aName [

	^ 'Repeat Card' = aName
]

{ #category : 'as yet unclassified' }
RepeatEffect >> targetTo: aTargetShip [
	^ self class targetedTo: aTargetShip
]

{ #category : 'as yet unclassified' }
RepeatEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [
	Error signal: 'Repeat Card does not require a target card.'
]
