"
Example code with MongoDB extension 

""a MOLibrary""
retriever := MOWebtoonsRetriever new.
book := (MOBook new) asManga; name: 'Tower of God'.
retriever retrieveBook: book location: 'en/fantasy/tower-of-god/list?title_no=95'.
self addBook: book.

self save: MODatabase new
"
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

{ #category : #initialization }
MOLibrary class >> reset [
	instance := self new
]

{ #category : #adding }
MOLibrary >> addBook: aBook [

	books add: aBook.
	aBook library: self
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

{ #category : #actions }
MOLibrary >> save: persistance [
	persistance save: self
]
