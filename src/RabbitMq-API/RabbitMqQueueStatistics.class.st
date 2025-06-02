Class {
	#name : #RabbitMqQueueStatistics,
	#superclass : #RabbitMqObject,
	#category : #'RabbitMq-API'
}

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> arguments [
	^ self rawData at: 'arguments'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> autoDelete [
	^ self rawData at: 'auto_delete'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> consumerCapacity [
	^ self rawData at: 'consumer_capacity'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> consumerDetails [
	^ self rawData at: 'consumer_details'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> consumerUtilisation [
	^ self rawData at: 'consumer_utilisation'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> consumers [
	^ self rawData at: 'consumers'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> deliveries [
	^ self rawData at: 'deliveries'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> durable [
	^ self rawData at: 'durable'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> effectivePolicyDefinition [
	^ self rawData at: 'effective_policy_definition'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> exclusive [
	^ self rawData at: 'exclusive'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> exclusiveConsumerTag [
	^ self rawData at: 'exclusive_consumer_tag'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> garbageCollection [
	^ self rawData at: 'garbage_collection'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> headMessageTimestamp [
	^ self rawData at: 'head_message_timestamp'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> idleSince [
	^ self rawData at: 'idle_since'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> incoming [
	^ self rawData at: 'incoming'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> memory [
	^ self rawData at: 'memory'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> messageBytes [
	^ self rawData at: 'message_bytes'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> messageBytesPagedOut [
	^ self rawData at: 'message_bytes_paged_out'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> messageBytesPersistent [
	^ self rawData at: 'message_bytes_persistent'
]

{ #category : #'as yet unclassified' }
RabbitMqQueueStatistics >> messageBytesRam [
	^ self rawData at: 'message_bytes_ram'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messageBytesReady [
	^ self rawData at: 'message_bytes_ready'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messageBytesUnacknowledged [
	^ self rawData at: 'message_bytes_unacknowledged'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messages [
	^ self rawData at: 'messages'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messagesDetails [
	^ self rawData at: 'messages_details'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messagesPagedOut [
	^ self rawData at: 'messages_paged_out'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messagesPersistent [
	^ self rawData at: 'messages_persistent'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messagesRam [
	^ self rawData at: 'messages_ram'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messagesReady [
	^ self rawData at: 'messages_ready'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messagesReadyDetails [
	^ self rawData at: 'messages_ready_details'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messagesReadyRam [
	^ self rawData at: 'messages_ready_ram'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messagesUnacknowledged [
	^ self rawData at: 'messages_unacknowledged'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messagesUnacknowledgedDetails [
	^ self rawData at: 'messages_unacknowledged_details'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> messagesUnacknowledgedRam [
	^ self rawData at: 'messages_unacknowledged_ram'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> name [
	^ self rawData at: 'name'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> node [
	^ self rawData at: 'node'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> operatorPolicy [
	^ self rawData at: 'operator_policy'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> policy [
	^ self rawData at: 'policy'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> reductions [
	^ self rawData at: 'reductions'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> reductionsDetails [
	^ self rawData at: 'reductions_details'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> singleActiveConsumerTag [
	^ self rawData at: 'single_active_consumer_tag'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> state [
	^ self rawData at: 'state'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> storageVersion [
	^ self rawData at: 'storage_version'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> type [
	^ self rawData at: 'type'
]

{ #category : #accessing }
RabbitMqQueueStatistics >> vhost [
	^ self rawData at: 'vhost'
]
