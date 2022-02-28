//
//  main.swift
//  first-course-local
//
//  Created by Natalya Murygina on 07.02.2022.
//

import Foundation

enum Position {
    case theFirst
    case theLast
}


public struct Queue<T> {
    public var items = [T]()
    public var isEmpty: Bool {
        return items.isEmpty
    }

    public var count: Int {
        return items.count
    }

    public mutating func enqueue(item: T) {
        items.append(item)
    }

    public mutating func dequeue() -> T? {
        items.isEmpty ? nil : items.removeFirst()
    }

    public func filter(_ value: (T) -> Bool) -> [T] {
        var result = [T]()
        for item in items where value(item) {
            result.append(item)
        }
        return result
    }

    subscript(position: Position) -> T {
        switch position {
        case .theFirst:
            return items[items.count - 1]
        case .theLast:
            return items[0]
        }
    }

    public var front: T? {
        guard isEmpty else { return items.first }
        return nil
    }
}


public func answerSistemToVisitor<T>(arrey: [T]) {
    postQueue.items.isEmpty == true ?
        print("Вы первый в очереди на обслуживание") :
        print("Вы \(postQueue.count) в очереди на обслуживание")

    print(postQueue.items)
}


var amptyArrey = [String]()
var postQueue = Queue(items: amptyArrey)

postQueue.enqueue(item: "T4")
answerSistemToVisitor(arrey: postQueue.items)

postQueue.enqueue(item: "N18")
answerSistemToVisitor(arrey: postQueue.items)

postQueue.enqueue(item: "M9")
answerSistemToVisitor(arrey: postQueue.items)

postQueue.enqueue(item: "T5")
answerSistemToVisitor(arrey: postQueue.items)

postQueue.enqueue(item: "T6")
answerSistemToVisitor(arrey: postQueue.items)

postQueue.enqueue(item: "N19")
answerSistemToVisitor(arrey: postQueue.items)

postQueue.enqueue(item: "T7")
answerSistemToVisitor(arrey: postQueue.items)

postQueue.enqueue(item: "M10")
answerSistemToVisitor(arrey: postQueue.items)

let postSendQueue = postQueue.items.filter { $0.hasPrefix("T") }
print(postSendQueue)

let postGetQueue = postQueue.items.filter { $0.hasPrefix("N") }
print(postGetQueue)

var queueSend = Queue(items: postSendQueue)

var getService = queueSend.dequeue()
print(queueSend.items)

print("Следующий в очереди на обслуживание номерок под номером \(String(describing: queueSend.front!))")
getService = queueSend.dequeue()
print("Следующий в очереди на обслуживание номерок под номером \(String(describing: queueSend.front!))")

var filterOfQueue = postQueue.filter {$0.contains("N")}
print("Сортировка по N-элементам - \(filterOfQueue)")

var filterOfQueueOne = postQueue.filter {$0.contains("1")}
print("Сортировка по элементам с цифрой 1 - \(filterOfQueueOne)")


// MARK: - вывод в консоль
//Вы 1 в очереди на обслуживание
//["T4"]
//Вы 2 в очереди на обслуживание
//["T4", "N18"]
//Вы 3 в очереди на обслуживание
//["T4", "N18", "M9"]
//Вы 4 в очереди на обслуживание
//["T4", "N18", "M9", "T5"]
//Вы 5 в очереди на обслуживание
//["T4", "N18", "M9", "T5", "T6"]
//Вы 6 в очереди на обслуживание
//["T4", "N18", "M9", "T5", "T6", "N19"]
//Вы 7 в очереди на обслуживание
//["T4", "N18", "M9", "T5", "T6", "N19", "T7"]
//Вы 8 в очереди на обслуживание
//["T4", "N18", "M9", "T5", "T6", "N19", "T7", "M10"]
//["T4", "T5", "T6", "T7"]
//["N18", "N19"]
//["T5", "T6", "T7"]
//Следующий в очереди на обслуживание номерок под номером T5
//Следующий в очереди на обслуживание номерок под номером T6
//Сортировка по N-элементам - ["N18", "N19"]
//Сортировка по элементам с цифрой 1 - ["N18", "N19", "M10"]
