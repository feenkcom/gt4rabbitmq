Class {
	#name : #RabbitMqObject,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'client'
	],
	#category : #'RabbitMq-API'
}

{ #category : #'instance creation' }
RabbitMqObject class >> rawData: aJsonObject [

	^ self new rawData: aJsonObject
]

{ #category : #accessing }
RabbitMqObject >> client [
	^ client
]

{ #category : #accessing }
RabbitMqObject >> client: anObject [
	client := anObject
]

{ #category : #'as yet unclassified' }
RabbitMqObject >> gtRawDataFor: aView [
	<gtView>
	
	rawData ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Raw Data';
		priority: 50;
		object: [ rawData ];
		view: #gtLiveFor:
]

{ #category : #accessing }
RabbitMqObject >> rawData [
	^ rawData
]

{ #category : #accessing }
RabbitMqObject >> rawData: anObject [
	rawData := anObject
]
