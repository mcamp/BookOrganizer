Class {
	#name : #MOBook,
	#superclass : #Object,
	#instVars : [
		'name',
		'link',
		'type',
		'chapters'
	],
	#category : #MangaOrganizer
}

{ #category : #adding }
MOBook >> addChapter: aChapter [
	
	aChapter book: self.
	chapters add: aChapter.
]

{ #category : #converting }
MOBook >> asComic [
	type := #comic
]

{ #category : #converting }
MOBook >> asManga [
	type := #manga
]

{ #category : #accessing }
MOBook >> chapters [
	^chapters
]

{ #category : #initialization }
MOBook >> initialize [

	name := 'Untitled'.
	link := ''.
	type := #undefined.
	chapters := SortedCollection sortUsing: [ :elem1 :elem2 | elem1 < elem2 ]
]

{ #category : #accessing }
MOBook >> link [
	^ link
]

{ #category : #accessing }
MOBook >> link: anUrl [
	link := anUrl
]

{ #category : #accessing }
MOBook >> name [
	^ name
]

{ #category : #accessing }
MOBook >> name: aString [
	name := aString
]

{ #category : #read }
MOBook >> readUntil: aNumber [
	"read until aNumber (inclusive) index of chapters"
	
	chapters from: 1 to: aNumber do: [ :chapter| chapter read]
]
