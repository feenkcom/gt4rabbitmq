Class {
	#name : #RabbitMqHttpClient,
	#superclass : #Object,
	#instVars : [
		'host',
		'port',
		'username',
		'password',
		'baseUrl'
	],
	#category : #'RabbitMq-API'
}

{ #category : #'instance creation' }
RabbitMqHttpClient class >> host: aHost port: aPort user: aUsername password: aPassword [
    ^ self new
        host: aHost;
        port: aPort;
        username: aUsername;
        password: aPassword;
        yourself
]

{ #category : #accessing }
RabbitMqHttpClient >> baseUrl [
	^ baseUrl
]

{ #category : #accessing }
RabbitMqHttpClient >> baseUrl: anObject [
	baseUrl := anObject
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> channelDetails: channelIdString [
    ^ self request: 'GET' path: { 'channels'. channelIdString. } body: nil.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> channels [
    ^ self get: { 'channels' }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> closeConnectionsFor: usernameString [
    ^ self request: 'DELETE' path: { 'connections'. 'username'. usernameString. } body: nil.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> clusterName [
    ^ self get: { 'cluster-name' }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> connectionChannels: connectionNameString [
    ^ self request: 'GET' path: { 'connections'. connectionNameString. 'channels'. } body: nil.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> connectionMetrics: connectionNameString [
    ^ self request: 'GET' path: { 'connections'. connectionNameString. } body: nil.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> connections [
    ^ self get: { 'connections' }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> consumers [
    ^ self get: { 'consumers' }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> definitions [
    ^ self get: { 'definitions' }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> delete: pathSegments [
    ^ self request: 'DELETE' path: pathSegments body: nil
]

{ #category : #private }
RabbitMqHttpClient >> deletePath: pathSegments [
    | client znUrl |

    znUrl := baseUrl asZnUrl.
    znUrl
    	addPathSegments: pathSegments;
        username: username;
        password: password.
    client := ZnClient new.
    client delete: znUrl.
	client isSuccess ifFalse:
		[ RabbitMqClientError signalClient: client ].
	^ client.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> deleteQueue: queueNameString vhost: vHostString [
    ^ self deletePath: { 'queues'. vHostString. queueNameString. }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> deprecatedFeatures [
    ^ self get: { 'deprecated-features' }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> exchangeMetrics: exchangeNameString vHost: vHostString [
    ^ self request: 'GET' path: { 'exchanges'. vHostString. exchangeNameString. } body: nil.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> exchanges [
    ^ self get: { 'exchanges' }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> featureFlags [
    ^ self get: { 'feature-flags' }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> get: pathSegments [
    ^ self request: 'GET' path: pathSegments body: nil
]

{ #category : #accessing }
RabbitMqHttpClient >> host [
	^ host
]

{ #category : #private }
RabbitMqHttpClient >> host: aString [

	host := aString.
	self updateBaseUrl.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> nodes [
    ^ self get: { 'nodes' }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> overview [
    ^ self get: { 'overview' }
]

{ #category : #accessing }
RabbitMqHttpClient >> password [
	^ password
]

{ #category : #accessing }
RabbitMqHttpClient >> password: anObject [
	password := anObject
]

{ #category : #accessing }
RabbitMqHttpClient >> port [
	^ port ifNil: [ 15672 ]
]

{ #category : #accessing }
RabbitMqHttpClient >> port: anInteger [

	port := anInteger.
	self updateBaseUrl.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> post: pathSegments body: body [
    ^ self request: 'POST' path: pathSegments body: body
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> purgeQueue: queueNameString vhost: vHostString [
    ^ self deletePath: { 'queues'. vHostString. queueNameString. 'contents'. }
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> put: pathSegments body: body [
    ^ self request: 'PUT' path: pathSegments body: body
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> queues [
    ^ self get: { 'queues' }
]

{ #category : #private }
RabbitMqHttpClient >> request: method path: pathSegments body: body [
    | client response znUrl |

    znUrl := baseUrl asZnUrl.
    znUrl
    	addPathSegments: pathSegments;
        username: username;
        password: password.
    client := ZnClient new
        url: znUrl;
        accept: 'application/json'.
    body ifNotNil: [ 
           client 
           	entity: (ZnEntity text: (NeoJSONWriter toString: body));
           	contentType: 'application/json'
        ].
    response := 
        (method = 'GET') ifTrue: [client get]
        ifFalse: [ (method = 'POST') ifTrue: [client post]
        ifFalse: [ (method = 'PUT') ifTrue: [client put]
        ifFalse: [ (method = 'DELETE') ifTrue: [client delete]
        ifFalse: [self error: 'Unknown HTTP method']]]].
	response ifNil:
		[ self error: (String streamContents: [ :stream |
			stream << 'HTTP '.
			client response statusLine printCodeAndReasonOn:  stream ]) ].
    ^ NeoJSONReader fromString: response contents
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> statisticsForQueue: queueNameString vhost: vHostString [
    ^ RabbitMqQueueStatistics rawData:
    	(self request: 'GET' path: { 'queues'. vHostString. queueNameString. } body: nil).
]

{ #category : #private }
RabbitMqHttpClient >> updateBaseUrl [
    baseUrl := 'http://', host , ':' , port asString , '/api'.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> usedDeprecatedFeatures [
    ^ self get: { 'deprecated-features'. 'used'. }
]

{ #category : #accessing }
RabbitMqHttpClient >> username [
	^ username
]

{ #category : #accessing }
RabbitMqHttpClient >> username: anObject [
	username := anObject
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> usernameConnections: usernameString [
    ^ self request: 'GET' path: { 'connections'. 'username'. usernameString. } body: nil.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> vHostChannels: vHostString [
    ^ self request: 'GET' path: { 'vhosts'. vHostString. 'channels'. } body: nil.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> vHostConnections: vHostString [
    ^ self request: 'GET' path: { 'vhosts'. vHostString. 'connections'. } body: nil.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> vHostConsumers: vHostString [
    ^ self request: 'GET' path: { 'consumers'. vHostString. } body: nil.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> vHostDefinition: vHostString [
    ^ self request: 'GET' path: { 'definitions'. vHostString. } body: nil.
]

{ #category : #'api - accessing' }
RabbitMqHttpClient >> vHostExchanges: vHostString [
    ^ self request: 'GET' path: { 'exchanges'. vHostString. } body: nil.
]
