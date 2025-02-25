Class {
	#name : #PackageDocGenerator,
	#superclass : #Object,
	#category : #'Documentation-Generator'
}

{ #category : #'as yet unclassified' }
PackageDocGenerator class >> generateDoc: aPackage [
	(RPackageOrganizer default packageNamed: aPackage) classes do: 
	[ :each | ClassDocGenerator generateDoc: each ]
]
