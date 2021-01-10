Class {
	#name : #MOWebtoonsRetriever,
	#superclass : #MORetriever,
	#category : #'BookOrganizer-Retriever'
}

{ #category : #url }
MOWebtoonsRetriever >> absoluteLink: aLink [
	^ self location , aLink
]

{ #category : #'private - parser' }
MOWebtoonsRetriever >> findAndCreateChapters: aLink [

	| parser chapterTags chapter |
	parser := Soup fromUrl: aLink.
	chapterTags :=
		(parser findTag: [ :tag| tag id = '_listUl'])
			findAllTags: [ :t| t name = 'li'].
	
	^ chapterTags collect: [ :tag| 
		chapter := MOChapter new.
		chapter link: (tag findTag: [ : subTag| subTag name = 'a' ]) href.
		chapter name: (tag findTagByClass: 'subj') next next contents.
		chapter number: (tag attributeAt: 'data-episode-no') asNumber.
	]
]

{ #category : #'private - parser' }
MOWebtoonsRetriever >> findChapterCollectionLinks: aLink [

	| currentPage nextParser lastPage |
	currentPage := 11.
	nextParser := Soup fromUrl: (aLink asUrl queryAt: 'page' put: currentPage).
	
	[ (nextParser findTagByClass: 'pg_next') isNil ] whileFalse: [ 
		1 second wait.
		currentPage := currentPage + 10.
		nextParser := Soup fromUrl: (aLink asUrl queryAt: 'page' put: currentPage).
	].

	lastPage := 
		((nextParser findTagByClass: 'paginate') findAllTags: [ :tag | tag name = 'a' ]) 
			last next next contents asNumber.
	
	^ (1 to: lastPage) collect: [ :page|  aLink asUrl queryAt: 'page' put: page].
]

{ #category : #accessing }
MOWebtoonsRetriever >> location [
	^ 'https://www.webtoons.com/'
]

{ #category : #accessing }
MOWebtoonsRetriever >> name [
	^ 'Webtoons'
]

{ #category : #retrieve }
MOWebtoonsRetriever >> retrieveChaptersFromBook: aBook [

	| chapterCollectionLinks |
	chapterCollectionLinks := self findChapterCollectionLinks: (self absoluteLink: aBook link).
	chapterCollectionLinks do: [ :aLink|
		1 second wait. "we do not want to make too many request"
		aBook addAllChapters: (self findAndCreateChapters: aLink).
	].
]
