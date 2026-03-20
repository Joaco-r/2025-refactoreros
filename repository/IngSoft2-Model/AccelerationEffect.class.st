"
When used in a card, permanently increases the total die roll of all ships by 1 (affects the total result, not individual die values)
"
Class {
	#name : 'AccelerationEffect',
	#superclass : 'Object',
	#instVars : [
		'accelerationValue'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'instance creation' }
AccelerationEffect class >> ofValue: anAccelerationValue [
	^ self new initializeWith: anAccelerationValue 
]

{ #category : 'actions' }
AccelerationEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [

]

{ #category : 'actions' }
AccelerationEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [
]

{ #category : 'actions' }
AccelerationEffect >> applyThrowEffectFor: aShip [
	^ 1
]

{ #category : 'as yet unclassified' }
AccelerationEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [

]

{ #category : 'as yet unclassified' }
AccelerationEffect >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [

	aShip ~= anotherShip ifTrue: [
		Error signal:
			'The ship is trying to use a permanent card out of its turn' ]
]

{ #category : 'testing' }
AccelerationEffect >> hasTarget: aShip [

	^ false
]

{ #category : 'initialization' }
AccelerationEffect >> initializeWith: anAccelerationValue [
	accelerationValue := anAccelerationValue.
]

{ #category : 'accessing' }
AccelerationEffect >> isCalled: aName [

	^ 'Acceleration Card' = aName
]

{ #category : 'as yet unclassified' }
AccelerationEffect >> targetTo: aTargetShip [

	^ self
]

{ #category : 'as yet unclassified' }
AccelerationEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self
]
