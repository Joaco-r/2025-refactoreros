Class {
	#name : 'RedoWithTargetCard',
	#superclass : 'RedoEffect',
	#instVars : [
		'targetShip',
		'targetCardName'
	],
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'as yet unclassified' }
RedoWithTargetCard class >> targetTo: aTargetShip whoPlayed: aTargetCardName [
	^ self new intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName
]

{ #category : 'actions' }
RedoWithTargetCard >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyRedoTo: aTargetShip from: owner whoPlayed: targetCardName
]

{ #category : 'as yet unclassified' }
RedoWithTargetCard >> intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName [


	targetShip := aTargetShip.
	targetCardName := aTargetCardName
]
