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

{ #category : #'gt-inspector-extension' }
MOLibrary >> gtInspectorBooksIn: composite [
	<gtInspectorPresentationOrder: -15>
	composite list
		title: 'Books';
		display: [ self books ]
]

{ #category : #initialization }
MOLibrary >> initialize [

	books := OrderedCollection new.
]
