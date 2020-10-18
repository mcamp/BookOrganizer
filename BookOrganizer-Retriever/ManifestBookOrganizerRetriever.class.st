"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBookOrganizerRetriever,
	#superclass : #PackageManifest,
	#category : #'BookOrganizer-Retriever-Manifest'
}

{ #category : #'code-critics' }
ManifestBookOrganizerRetriever class >> ruleRBSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MOWebtoonsRetriever #findChapterCollectionLinks: #false)) #'2020-10-18T21:17:02.086029+02:00') #(#(#RGMethodDefinition #(#MOWebtoonsRetriever #findAndCreateChapters: #false)) #'2020-10-18T23:01:41.576574+02:00') )
]
