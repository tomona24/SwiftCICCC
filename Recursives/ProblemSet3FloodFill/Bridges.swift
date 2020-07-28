//
//  Bridges.swift
//  ProblemSet3FloodFill
//
//  Created by Tomona Sako on 2020/07/28.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func Bridges() {
    struct Square {
        let x: Int
        let y: Int
    }
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    
    let firstLine = readLine()!.split(separator: " ").map {Int(String($0))!}
    let m = firstLine[0]
    
    // 2D array (each tomato location)
    var ilandMap = [[Int]]()
    var groupMap = [[Int]](repeating: [Int](repeating: 0, count: m), count: m)
    var answer : Int = -1
    
    var q = Queue<Square>()
    
    func bfs(m: Int, n: Int, n0: inout Int, q: inout Queue<Square>) {
        while !q.isEmpty() {
            let square = q.dequeue()
            let x = square!.x
            let y = square!.y
            var current = ilandMap[y][x]
            if ilandMap[y][x] >= 1 {
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if nx >= 0 && nx < m && ny >= 0 && ny < n {
                        if ilandMap[ny][nx] == 0 && groupMap[ny][nx] == 0 {
                            ilandMap[ny][nx] = current + 1
                            n0 -= 1
                            q.enqueue(item: Square(x: nx, y: ny))
                            groupMap[ny][nx] = id
                            answer = current
                        }
                        
                    }
                }
                
            }
        }
    }
    
    
    
    for _ in 0..<m {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        ilandMap.append(row)
    }
    
    var id = 0
    var numberOfZero = 0
    
    for x in 0..<m {
        for y in 0..<m {
            if ilandMap[y][x] == 0 {
                numberOfZero += 1
            }
            if ilandMap[y][x] >= 1 && groupMap[y][x] == 0 {
                id += 1
                q.enqueue(item:  Square(x: x, y: y))
            }
        }
    }
    bfs(m: m, n: m, n0 : &numberOfZero, q: &q)
    for i in 0..<ilandMap.count {
        print(ilandMap[i])
    }
    if numberOfZero > 0 {
        
        print(-1)
    } else {
        print(answer)
    }
}
