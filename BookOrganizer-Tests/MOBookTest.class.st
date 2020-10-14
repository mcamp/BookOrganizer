Class {
	#name : #MOBookTest,
	#superclass : #TestCase,
	#instVars : [
		'manga'
	],
	#category : #'BookOrganizer-Tests'
}

{ #category : #running }
MOBookTest >> setUp [
	manga := MOBook new asManga.

]

{ #category : #tests }
MOBookTest >> testAddChapter [

	| chapter |
	chapter := MOChapter new.
	
	manga addChapter: chapter.
	
	self assert: manga chapters size equals: 1.
	self assert: (manga chapters includes: chapter).
	self assert: chapter book equals: manga.
]

{ #category : #tests }
MOBookTest >> testAddChapters [

	
	manga addChapter: (MOChapter new number: 3; yourself).
	manga addChapter: (MOChapter new number: 1; yourself).
	manga addChapter: (MOChapter new number: 2; yourself).
	
	self assert: manga chapters size equals: 3.
	self assert: manga chapters first number equals: 1.
	self assert: manga chapters second number equals: 2.
	self assert: manga chapters third number equals: 3.
]

{ #category : #tests }
MOBookTest >> testReadChapters [

	
	manga addChapter: (MOChapter new number: 3; yourself).
	manga addChapter: (MOChapter new number: 1; yourself).
	manga addChapter: (MOChapter new number: 2; yourself).
	manga addChapter: (MOChapter new number: 4; yourself).

	manga readUntil: 3.
	self assert: manga chapters first wasRead.
	self assert: manga chapters second wasRead.
	self assert: manga chapters third wasRead.
	self deny: manga chapters fourth wasRead.
]
