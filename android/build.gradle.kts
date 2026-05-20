allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Work around Android 16KB page-size devices/emulators:
// older JNA libjnidispatch binaries are linked with 8KB alignment and crash with:
// "program alignment (8192) cannot be smaller than system page size (16384)".
// Force a JNA version that ships 16KB-page compatible Android natives.
subprojects {
    configurations.configureEach {
        resolutionStrategy {
            force("net.java.dev.jna:jna:5.17.0")
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
