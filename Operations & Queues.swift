//
//  Operations & Queues.swift
//  
//
//  Created by Mike Gilroy on 28/01/2017.
//
//

import Foundation

// MARK: - Custom Operation Overrides

class ConcurrentOperation: Operation {
	enum State: String {
		case isReady, isExecuting, isFinished
		
		fileprivate
		var keyPath: String {
			return  rawValue
		}
	}
	
	var state = State.isReady {
		willSet {
			willChangeValue(forKey: newValue.keyPath)
			willChangeValue(forKey: state.keyPath)
		}
		didSet {
			didChangeValue(forKey: oldValue.keyPath)
			didChangeValue(forKey: state.keyPath)
		}
	}
}


extension ConcurrentOperation {
	//: NSOperation Overrides
	
	override var isExecuting: Bool {
		return state == .isExecuting
	}
	
	override var isFinished: Bool {
		return state == .isFinished
	}
	
	override var isAsynchronous: Bool {
		return true
	}
	
	override func start() {
		if isCancelled {
			state = .isFinished
			return
		}
		
		main()
		state = .isExecuting
	}
	
	override func cancel() {
		state = .isFinished
	}
}

class SerialOperation: Operation {
	enum State: String {
		case isReady, isExecuting, isFinished
		
		fileprivate
		var keyPath: String {
			return  rawValue
		}
	}
	
	var state = State.isReady {
		willSet {
			willChangeValue(forKey: newValue.keyPath)
			willChangeValue(forKey: state.keyPath)
		}
		didSet {
			didChangeValue(forKey: oldValue.keyPath)
			didChangeValue(forKey: state.keyPath)
		}
	}
}

extension SerialOperation {
	//: NSOperation Overrides
	
	override var isExecuting: Bool {
		return state == .isExecuting
	}
	
	override var isFinished: Bool {
		return state == .isFinished
	}
	
	// isAsynchronous returned as false for serial operation
	override var isAsynchronous: Bool {
		return false
	}
	
	override func start() {
		if isCancelled {
			state = .isFinished
			return
		}
		
		main()
		state = .isExecuting
	}
	
	override func cancel() {
		state = .isFinished
	}
}


// MARK: - Custom Operation Queues

class ConcurrentOperationQueue: OperationQueue {
	
	override init() {
		super.init()
		self.qualityOfService = .userInitiated
	}
}

class SerialOperationQueue: OperationQueue {
	
	override init() {
		super.init()
		self.qualityOfService = .userInitiated
		// Set maxConcurrentOperationCount to 1 so that operations are executed one-by-one -> in serial manner
		self.maxConcurrentOperationCount = 1
	}
}


// MARK: - Helpers

/* Extension on array that allows you to easily add a completion block to the operations in an operation queue, which executes once all operations in queue are complete

	This works by creating a new block operation (your completion block) and adding every operation already in your operation queue as a dependency for this block operation. As the block operation has every other operation in the queue as a dependency it will only execute when all are finished (serial or concurrent), acting as a completion block. 

	Note: - the onFinish method can only be called on the array operations in the queue, not the queue itself - e.g. myQueue.operations.onFinish { my completion code }

*/
extension Array where Element: Operation {
	/// Execute block after all operations from the array.
	func onFinish(block: @escaping () -> Void) {
		let doneOperation = BlockOperation(block: block)
		self.forEach { [weak doneOperation] in doneOperation?.addDependency($0) }
		OperationQueue().addOperation(doneOperation)
	}
}

