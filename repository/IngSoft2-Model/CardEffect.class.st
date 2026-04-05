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

{ #category : 'as yet unclassified' }
CardEffect >> applyReversedThrowEffectFor: aShip [

	^ 0
]

{ #category : 'actions' }
CardEffect >> applyThrowEffectFor: aShip [
	^ 0
	
]

{ #category : 'as yet unclassified' }
CardEffect >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [
]

{ #category : 'as yet unclassified' }
CardEffect >> checkIfTargetCardNeeded [
]

{ #category : 'as yet unclassified' }
CardEffect >> checkIfTargetShipNeeded [
]

{ #category : 'as yet unclassified' }
CardEffect >> findCardToBeReplayed: activeCards [
	^ (activeCards at: 1 )
]

{ #category : 'testing' }
CardEffect >> hasHiredAsAMercenary: aShip [
	^ false
]
