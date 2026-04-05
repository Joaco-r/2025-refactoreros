"
When used in a card, permanently allows the ship to hire a mercenary ship as an ally
"
Class {
	#name : 'MercenaryEffect',
	#superclass : 'CardEffect',
	#instVars : [
		'targetShip'
	],
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'instance creation' }
MercenaryEffect class >> targetedTo: aTargetShip [
^ self new initializeTargetedTo: aTargetShip
]

{ #category : 'actions' }
MercenaryEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [

	aShip = cardOwner ifTrue: [ aListMercenaries add: targetShip ]
]

{ #category : 'actions' }
MercenaryEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame checkIf: owner canHireAsMercenary: aTargetShip
]

{ #category : 'as yet unclassified' }
MercenaryEffect >> applyReversedMercenaryEffectFor: aShip battling: antherShip in: aListMercenaries from: cardOwner [


	antherShip = cardOwner ifTrue: [ aListMercenaries add: targetShip ]
]

{ #category : 'as yet unclassified' }
MercenaryEffect >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [

	aShip ~= anotherShip ifTrue: [
		Error signal:
			'The ship is trying to use a permanent card out of its turn' ]
]

{ #category : 'as yet unclassified' }
MercenaryEffect >> checkIfTargetShipNeeded [

	Error signal: 'Mercenary Card requiers a target ship.'
]

{ #category : 'testing' }
MercenaryEffect >> hasHiredAsAMercenary: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
MercenaryEffect >> initializeTargetedTo: aTargetShip [

	targetShip := aTargetShip
]

{ #category : 'accessing' }
MercenaryEffect >> isCalled: anEffectName [

	^ 'Mercenary Card' = anEffectName
]

{ #category : 'as yet unclassified' }
MercenaryEffect >> targetTo: aShip [
	^ self class targetedTo: aShip 
]

{ #category : 'as yet unclassified' }
MercenaryEffect >> targetTo: aShip whoPlayed: aTargetCardName [
	Error signal: 'Mercenary Card does not require a target card.'
]
