"
Represents the absence of a card
"
Class {
	#name : 'NullCard',
	#superclass : 'Object',
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'checking' }
NullCard >> checkIfPresent [
	Error signal: 'No card has been played yet'
]
