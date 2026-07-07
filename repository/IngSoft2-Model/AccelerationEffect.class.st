"
When used in a card, permanently increases the total die roll of all ships by 1 (affects the total result, not individual die values)
"
Class {
	#name : 'AccelerationEffect',
	#superclass : 'CardEffect',
	#instVars : [
		'accelerationValue'
	],
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'instance creation' }
AccelerationEffect class >> ofValue: anAccelerationValue [
	^ self new initializeWith: anAccelerationValue 
]

{ #category : 'actions' }
AccelerationEffect >> applyReversedThrowEffectFor: aShip [

	^ -1
]

{ #category : 'actions' }
AccelerationEffect >> applyThrowEffectFor: aShip [
	^ 1
]

{ #category : 'testing' }
AccelerationEffect >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [

	aShip ~= anotherShip ifTrue: [
		Error signal:
			'The ship is trying to use a permanent card out of its turn' ]
]

{ #category : 'initialization' }
AccelerationEffect >> initializeWith: anAccelerationValue [
	accelerationValue := anAccelerationValue.
]

{ #category : 'accessing' }
AccelerationEffect >> isCalled: anEffectName [

	^ 'Acceleration Card' = anEffectName
]

{ #category : 'actions' }
AccelerationEffect >> targetTo: aTargetShip [ 
	
	Error signal: 'Acceleration Card does not require a target ship.'
]

{ #category : 'actions' }
AccelerationEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [
	
	Error signal: 'Acceleration Card does not require a target card.'
]
