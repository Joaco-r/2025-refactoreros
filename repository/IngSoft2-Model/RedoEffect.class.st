"
When used in a card, can be played out of turn to mimic the effect of the last played card, regardless of its type (instant or permanent)


"
Class {
	#name : 'RedoEffect',
	#superclass : 'CardEffect',
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'actions' }
RedoEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyRedoFrom: owner
]

{ #category : 'as yet unclassified' }
RedoEffect >> findCardToBeReplayed: activeCards [
	^ (activeCards at: 2 )
]

{ #category : 'testing' }
RedoEffect >> isCalled: aName [

	^ 'Redo Card' = aName
]

{ #category : 'as yet unclassified' }
RedoEffect >> targetTo: aTargetShip [
	
	^ RedoWithTargetShip targetedTo: aTargetShip
]

{ #category : 'as yet unclassified' }
RedoEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ RedoWithTargetCard targetTo: aTargetShip whoPlayed: aTargetCardName
]
