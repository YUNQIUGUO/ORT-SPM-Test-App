//
//  ContentView.swift
//  ORTSPMTestApp
//
//  Created by rachguo on 7/14/23.
//

import SwiftUI
import Foundation
@testable import OnnxRuntimeBindings

private let modelPath: String? = Bundle.main.path(forResource: "single_add.basic", ofType: "ort")

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text(SPMTest_GetORTVersion())
            Text(SPMTest_CreateORTSession())
        }
        .padding()
    }
}

func SPMTest_GetORTVersion() -> String {
    let version = ORTVersion()
    return version
}

func SPMTest_CreateORTSession() -> String {
    do {
        let env = try ORTEnv(loggingLevel: ORTLoggingLevel.verbose)
        let options = try ORTSessionOptions()
        try options.setLogSeverityLevel(ORTLoggingLevel.verbose)
        try options.setIntraOpNumThreads(1)
        // Create the ORTSession
        _ = try ORTSession(env: env, modelPath: modelPath!, sessionOptions: options)
        return "Successfully created an inference session."
    } catch let error as NSError {
        print("Error: \(error.localizedDescription)")
        return "Unable to create an ORT session."
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
