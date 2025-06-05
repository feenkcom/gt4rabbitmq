Class {
	#name : #RabbitMqClientError,
	#superclass : #Error,
	#instVars : [
		'client'
	],
	#category : #'RabbitMq-API'
}

{ #category : #signaling }
RabbitMqClientError class >> signalClient: aRabbitMqClient [

	^ self new
		client: aRabbitMqClient;
		signal
]

{ #category : #accessing }
RabbitMqClientError >> client [
	^client
]

{ #category : #accessing }
RabbitMqClientError >> client: anObject [
	client := anObject
]

{ #category : #accessing }
RabbitMqClientError >> description [

	^ String streamContents: [ :stream |
		self messageText isEmptyOrNil ifFalse:
			[ stream
				<< self messageText;
				space ].
		client
			ifNil: [ stream << '<no message>' ]
			ifNotNil: 
				[ stream << 'HTTP '.
				client response statusLine printCodeAndReasonOn:  stream ] ]
]

{ #category : #testing }
RabbitMqClientError >> isResumable [

	^ true
]
