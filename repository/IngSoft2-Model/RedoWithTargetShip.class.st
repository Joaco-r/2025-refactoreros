Class {
	#name : 'RedoWithTargetShip',
	#superclass : 'RedoEffect',
	#instVars : [
		'targetShip'
	],
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'instance creation' }
RedoWithTargetShip class >> targetedTo: aTargetShip [

	^ self new intializeTargetedTo: aTargetShip
]

{ #category : 'actions' }
RedoWithTargetShip >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyRedoTo: aTargetShip from: owner
]

{ #category : 'initialization' }
RedoWithTargetShip >> intializeTargetedTo: aTargetShip [

	targetShip := aTargetShip
]
