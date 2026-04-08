Class {
	#name : 'ReversePolarityEffect',
	#superclass : 'CardEffect',
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'actions' }
ReversePolarityEffect >> applyPlayedEffectIn: aGame from: owner to: aSquareNumber [

	aGame applyReversePolarityFor: aSquareNumber.
]

{ #category : 'testing' }
ReversePolarityEffect >> isCalled: anEffectName [

	^ 'Reverse Polarity Card' = anEffectName
]
