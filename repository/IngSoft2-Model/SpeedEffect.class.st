"
When used in a card, permanently increases the total die roll of a selected ship by 1 (affects the total result, not individual die values)
"
Class {
	#name : 'SpeedEffect',
	#superclass : 'Object',
	#instVars : [
		'targetShip',
		'speedValue'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'instance creation' }
SpeedEffect class >> ofValue: aSpeedValue targetedTo: aTarget [

	^ self new initializeWithSpeedValue: aSpeedValue and: aTarget
]

{ #category : 'actions' }
SpeedEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'actions' }
SpeedEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [
]

{ #category : 'actions' }
SpeedEffect >> applyThrowEffectFor: aShip [

	aShip = targetShip ifTrue: [ ^ 1 ].
	^ 0
]

{ #category : 'as yet unclassified' }
SpeedEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Speed Card requiers a target ship.' ]
]

{ #category : 'as yet unclassified' }
SpeedEffect >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [

	aShip ~= anotherShip ifTrue: [
		Error signal:
			'The ship is trying to use a permanent card out of its turn' ]
]

{ #category : 'testing' }
SpeedEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
SpeedEffect >> initializeWithSpeedValue: aSpeedValue and: aTargetShip [
	speedValue := aSpeedValue.
	targetShip := aTargetShip
]

{ #category : 'accessing' }
SpeedEffect >> isCalled: aName [

	^ 'Speed Card' = aName
]

{ #category : 'as yet unclassified' }
SpeedEffect >> targetTo: aTargetShip [

	^ self class ofValue: speedValue targetedTo: aTargetShip
]

{ #category : 'as yet unclassified' }
SpeedEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class ofValue: speedValue targetedTo: aTargetShip
]
