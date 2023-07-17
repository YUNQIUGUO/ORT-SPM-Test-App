//
//  ContentView.swift
//  ORTSPMTestApp
//
//  Created by rachguo on 7/14/23.
//

import SwiftUI
import Foundation
@testable import OnnxRuntimeBindings

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text(ORTSPMTest())
        }
        .padding()
    }
}

func ORTSPMTest() -> String {
    let result = "Hello world!"
    
    print(result)
    
    let modelPath: String? = Bundle.main.path(forResource: "single_add.basic", ofType: "ort")
    
    let version = ORTVersion()
    print(version)
    return version
    
//    let env = try ORTEnv(loggingLevel: ORTLoggingLevel.verbose)
//    let options = try ORTSessionOptions()
//    try options.setLogSeverityLevel(ORTLoggingLevel.verbose)
//    try options.setIntraOpNumThreads(1)
//    // Create the ORTSession
//    _ = try ORTSession(env: env, modelPath: modelPath!, sessionOptions: options)
//    return "Successfully created an inference session."
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
