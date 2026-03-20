"
When used in a card, can be played out of turn to mimic the effect of the last played card, regardless of its type (instant or permanent)


"
Class {
	#name : 'RedoEffect',
	#superclass : 'Object',
	#instVars : [
		'targetShip',
		'targetCardName'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'as yet unclassified' }
RedoEffect class >> targetTo: aTargetShip whoPlayed: aTargetCardName [
	^ self new intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName
]

{ #category : 'instance creation' }
RedoEffect class >> targetedTo: aTargetPlayer [
	^ self new intializeTargetedTo: aTargetPlayer whoPlayed: ''
]

{ #category : 'actions' }
RedoEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'actions' }
RedoEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyRedoTo: aTargetShip from: owner whoPlayed: targetCardName
]

{ #category : 'actions' }
RedoEffect >> applyThrowEffectFor: aShip [
	^ 0
	
]

{ #category : 'as yet unclassified' }
RedoEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [

]

{ #category : 'as yet unclassified' }
RedoEffect >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [
]

{ #category : 'testing' }
RedoEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
RedoEffect >> intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName [

	targetShip := aTargetShip.
	targetCardName := aTargetCardName
]

{ #category : 'testing' }
RedoEffect >> isCalled: aName [

	^ 'Redo Card' = aName
]

{ #category : 'as yet unclassified' }
RedoEffect >> targetTo: aTargetShip [
	^ self class targetedTo: aTargetShip
]

{ #category : 'as yet unclassified' }
RedoEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetTo: aTargetShip whoPlayed: aTargetCardName
]
