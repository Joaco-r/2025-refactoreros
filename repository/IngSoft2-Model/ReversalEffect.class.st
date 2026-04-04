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

{ #category : 'as yet unclassified' }
ReversalEffect >> intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName [

	targetShip := aTargetShip.
	targetCardName := aTargetCardName
]

{ #category : 'testing' }
ReversalEffect >> isCalled: anEffectName [

	^ 'Reversal Card' = anEffectName
]

{ #category : 'as yet unclassified' }
ReversalEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetTo: aTargetShip whoPlayed: aTargetCardName
]
