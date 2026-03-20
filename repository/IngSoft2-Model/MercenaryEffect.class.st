"
When used in a card, permanently allows the ship to hire a mercenary ship as an ally
"
Class {
	#name : 'MercenaryEffect',
	#superclass : 'CardEffect',
	#instVars : [
		'targetShip'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
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
MercenaryEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Mercenary Card requiers a target ship.' ].
]

{ #category : 'as yet unclassified' }
MercenaryEffect >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [

	aShip ~= anotherShip ifTrue: [
		Error signal:
			'The ship is trying to use a permanent card out of its turn' ]
]

{ #category : 'testing' }
MercenaryEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
MercenaryEffect >> initializeTargetedTo: aTargetShip [

	targetShip := aTargetShip
]

{ #category : 'accessing' }
MercenaryEffect >> isCalled: aName [

	^ 'Mercenary Card' = aName
]

{ #category : 'as yet unclassified' }
MercenaryEffect >> targetTo: aShip whoPlayed: aTargetCardName [
	^ self class targetedTo: aShip 
]
