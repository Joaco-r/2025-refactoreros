Class {
	#name : 'CardEffect',
	#superclass : 'Object',
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'actions' }
CardEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'actions' }
CardEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [
]

{ #category : 'actions' }
CardEffect >> applyReversedThrowEffectFor: aShip [

	^ 0
]

{ #category : 'actions' }
CardEffect >> applyThrowEffectFor: aShip [
	^ 0
	
]

{ #category : 'testing' }
CardEffect >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [
]

{ #category : 'testing' }
CardEffect >> checkIfTargetCardNeeded [
]

{ #category : 'testing' }
CardEffect >> checkIfTargetShipNeeded [
]

{ #category : 'actions' }
CardEffect >> findCardToBeReplayed: activeCards [
	^ (activeCards at: 1 )
]

{ #category : 'testing' }
CardEffect >> hasHiredAsAMercenary: aShip [
	^ false
]
