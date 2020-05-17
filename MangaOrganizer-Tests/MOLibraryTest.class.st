Class {
	#name : #MOLibraryTest,
	#superclass : #TestCase,
	#instVars : [
		'library'
	],
	#category : #'MangaOrganizer-Tests'
}

{ #category : #running }
MOLibraryTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	library := MOLibrary new.
]

{ #category : #tests }
MOLibraryTest >> testAddBook [

	| book  |
	book := MOBook new.
	
	library addBook: book.
	
	self assert: library books size equals: 1.
	self assert: (library books includes: book).
]
