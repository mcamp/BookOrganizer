Class {
	#name : #MOChapter,
	#superclass : #Object,
	#instVars : [
		'book',
		'name',
		'number',
		'read',
		'link'
	],
	#classVars : [
		'instance'
	],
	#category : #BookOrganizer
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

{ #category : #private }
MOChapter >> externalOpen [

	OSSUnixSubprocess new
	command: 'xdg-open';
	arguments: {self link};
	runAndWaitOnExitDo: [ :process :outString  | ].
	
]

{ #category : #initialization }
MOChapter >> initialize [

	number := 0.
	name := 'Untitled'.
	read := false.
]

{ #category : #accessing }
MOChapter >> link [
	^ link
]

{ #category : #accessing }
MOChapter >> link: aString [
	link := aString
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

{ #category : #read }
MOChapter >> open [
	self externalOpen.
	
	self read
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
