Class {
	#name : #MOLibrary,
	#superclass : #Object,
	#instVars : [
		'books'
	],
	#classVars : [
		'instance'
	],
	#category : #BookOrganizer
}

{ #category : #accessing }
MOLibrary class >> instance [

	^ instance ifNil: [ instance := self new ]
]

{ #category : #adding }
MOLibrary >> addBook: aBook [

	books add: aBook.
]

{ #category : #accessing }
MOLibrary >> books [
	^books
]

{ #category : #initialization }
MOLibrary >> initialize [

	books := OrderedCollection new.
]
