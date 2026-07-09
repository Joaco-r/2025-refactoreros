"
When used in a card, can be played to inverse the permanent effect of a previously played card.
"
Class {
	#name : 'ReversalEffect',
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
ReversalEffect class >> targetTo: aTargetShip whoPlayed: aTargetCardName [
	^ self new intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName
]

{ #category : 'actions' }
ReversalEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [
	aGame applyReversalTo: targetShip whoPlayed: targetCardName
]

{ #category : 'testing' }
ReversalEffect >> checkIfTargetCardNeeded [

	Error signal: 'Reversal Card requiers a target card.'
]

{ #category : 'testing' }
ReversalEffect >> checkIfTargetShipNeeded [

	Error signal: 'Reversal Card requiers a target ship.'
]

{ #category : 'actions' }
ReversalEffect >> intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName [

	targetShip := aTargetShip.
	targetCardName := aTargetCardName
]

{ #category : 'testing' }
ReversalEffect >> isCalled: anEffectName [

	^ 'Reversal Card' = anEffectName
]

{ #category : 'actions' }
ReversalEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetTo: aTargetShip whoPlayed: aTargetCardName
]
