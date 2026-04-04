"
When used in a card, permanently increases the total die roll of a selected ship by 1 (affects the total result, not individual die values)
"
Class {
	#name : 'SpeedEffect',
	#superclass : 'CardEffect',
	#instVars : [
		'targetShip',
		'speedValue'
	],
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'instance creation' }
SpeedEffect class >> ofValue: aSpeedValue targetedTo: aTarget [

	^ self new initializeWithSpeedValue: aSpeedValue and: aTarget
]

{ #category : 'as yet unclassified' }
SpeedEffect >> applyReversedThrowEffectFor: aShip [

	aShip = targetShip ifTrue: [ ^ -1 ].

	^ 0
]

{ #category : 'actions' }
SpeedEffect >> applyThrowEffectFor: aShip [

	aShip = targetShip ifTrue: [ ^ 1 ].

	^ 0
]

{ #category : 'as yet unclassified' }
SpeedEffect >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [

	aShip ~= anotherShip ifTrue: [
		Error signal:
			'The ship is trying to use a permanent card out of its turn' ]
]

{ #category : 'as yet unclassified' }
SpeedEffect >> checkIfTargetShipNeeded [

	Error signal: 'Speed Card requiers a target ship.'
]

{ #category : 'initialization' }
SpeedEffect >> initializeWithSpeedValue: aSpeedValue and: aTargetShip [

	speedValue := aSpeedValue.
	targetShip := aTargetShip.

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

	Error signal:'Speed Card does not require a target card.'
]
