"
A Card with an effect that can be played in game
"
Class {
	#name : 'Card',
	#superclass : 'Object',
	#instVars : [
		'owner',
		'effect'
	],
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'instance creation' }
Card class >> accelerationWithoutOwner [

	^ self new
		  initializeOwnedBy: nil
		  causing: (AccelerationEffect ofValue: 1)
]

{ #category : 'as yet unclassified' }
Card class >> cancellationWithoutOwner [

	^ self new
		  initializeOwnedBy: nil
		  causing: (CancellationEffect targetTo: nil whoPlayed: nil)
]

{ #category : 'instance creation' }
Card class >> mercenaryWithoutOwner [

	^ self new
		  initializeOwnedBy: nil
		  causing: (MercenaryEffect targetedTo: nil)
]

{ #category : 'instance creation' }
Card class >> ownedBy: aShip causing: anEffect [

	^ self new initializeOwnedBy: aShip causing: anEffect
]

{ #category : 'instance creation' }
Card class >> redoWithoutOwner [

	^ self new initializeOwnedBy: nil causing: RedoEffect new
]

{ #category : 'as yet unclassified' }
Card class >> repeatWithoutOwner [

	^ self new
		  initializeOwnedBy: nil
		  causing: (RepeatEffect targetedTo: nil)
]

{ #category : 'instance creation' }
Card class >> speedWithoutOwner [

	^ self new
		  initializeOwnedBy: nil
		  causing: (SpeedEffect ofValue: 1 targetedTo: nil)
]

{ #category : 'actions' }
Card >> applyMercenaryEffectFor: aShip in: shipWithMercenaries [
	^ (effect applyMercenaryEffectFor: aShip in: shipWithMercenaries from: owner)
]

{ #category : 'actions' }
Card >> applyOnPlayed: aGame to: aTargetShip [

	effect applyPlayedEffectIn: aGame from: owner to: aTargetShip
]

{ #category : 'actions' }
Card >> applyThrowEffectFor: aShip [

	^ (effect applyThrowEffectFor: aShip)
]

{ #category : 'as yet unclassified' }
Card >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [

	effect
		checkForTurnRequierementwhen: aShip
		playsACardDuringTheTurnOf: anotherShip
]

{ #category : 'as yet unclassified' }
Card >> checkIfTargetCardNeeded [
	effect checkIfTargetCardNeeded.
]

{ #category : 'as yet unclassified' }
Card >> checkIfTargetShipNeeded [
	effect checkIfTargetShipNeeded.
]

{ #category : 'as yet unclassified' }
Card >> findCardToBeReplayed: activeCards [

	^ effect findCardToBeReplayed: activeCards
]

{ #category : 'testing' }
Card >> hasAsEffect: aCardName [
	^ (effect isCalled: aCardName )
]

{ #category : 'testing' }
Card >> hasHiredAsAMercenary: aShip [

	^ effect hasHiredAsAMercenary: aShip
]

{ #category : 'initialization' }
Card >> initializeOwnedBy: aShip causing: anEffect [

	owner := aShip.
	effect := anEffect.
	
]

{ #category : 'testing' }
Card >> is: aCardName ownedBy: aShip [

	^ aShip = owner and: (effect isCalled: aCardName)
]

{ #category : 'as yet unclassified' }
Card >> playedBy: aShip [

	^ self class
		  ownedBy: aShip
		  causing: (effect)
]

{ #category : 'as yet unclassified' }
Card >> playedBy: aShip targetedTo: aTargetShip [

	^ self class
		  ownedBy: aShip
		  causing: (effect targetTo: aTargetShip)
]

{ #category : 'as yet unclassified' }
Card >> playedBy: aShip targetedTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class
		  ownedBy: aShip
		  causing: (effect targetTo: aTargetShip whoPlayed: aTargetCardName)
]
