Class {
	#name : #MOChapter,
	#superclass : #Object,
	#instVars : [
		'book',
		'name',
		'number',
		'link',
		'read'
	],
	#classVars : [
		'instance'
	],
	#category : #MangaOrganizer
}

{ #category : #comparing }
MOChapter >> < anotherChapter [

	^ self number < anotherChapter number
]

{ #category : #accessing }
MOChapter >> book [

	^ book
]

{ #category : #accessing }
MOChapter >> book: aBook [

	book := aBook
]

{ #category : #initialization }
MOChapter >> initialize [

	number := 0.
	name := 'Untitled'.
	link := ''.
	read := false.
]

{ #category : #accessing }
MOChapter >> link [
	^ link
]

{ #category : #accessing }
MOChapter >> link: anUrl [

	link := anUrl
]

{ #category : #accessing }
MOChapter >> name [
	^ name
]

{ #category : #accessing }
MOChapter >> name: aString [
	name := aString
]

{ #category : #accessing }
MOChapter >> number [
	^ number
]

{ #category : #accessing }
MOChapter >> number: aNumber [
	number := aNumber
]

{ #category : #converting }
MOChapter >> printOn: aStream [

	aStream << '[' << number asString << '] ' << name 
]

{ #category : #read }
MOChapter >> read [
	read := true.
]

{ #category : #read }
MOChapter >> unread [

	read := false.
]

{ #category : #read }
MOChapter >> wasRead [

	^ read
]
