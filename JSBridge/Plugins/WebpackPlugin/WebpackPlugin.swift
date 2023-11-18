//
//  WebpackPlugin.swift
//
//
//  Created by 朱冰一 on 2023/11/18.
//

import Foundation
import PackagePlugin

var logs: [String] = []

@main
struct WebpackPlugin: CommandPlugin {
  func performCommand(context: PluginContext, arguments: [String]) async throws {
    let echoTool = try context.tool(named: "npx")
    let echoToolPath = URL(fileURLWithPath: echoTool.path.string)
    
    let process = try Process.run(echoToolPath, arguments: ["webpack", "build"])
    process.waitUntilExit()
    log("Hello2")
  }
  
  func log(_ message: String) {
      logs.append(message)
      printLogs()
    }
    
    func printLogs() {
      do {
        try logs.joined(separator: "\n").write(toFile: "logs", atomically: true, encoding: .utf8)
      } catch {
        // ignore
      }
    }
}
