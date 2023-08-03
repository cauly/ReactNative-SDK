
ReactNative를 위한 Cauly SDK 연동 예제

# cauly-sdk-reactnative-example
- 이 프로젝트는 Cauly SDK ReactNative 연동 예제 프로젝트입니다.
- 이 프로젝트는 react-native-library 를 통해 생성된 프로젝트로, 설정 관련한 자세한 내용은 링크(https://reactnative.dev/docs/native-modules-setup)를 참고하여 주시기 바랍니다.
- ReactNative SDK 예제는 Android 4.1(Jelly Bean, API Level 16) 이상 기기와 JDK 11 이상에서 동작합니다.
- 최신 버전의 Cauly SDK 사용을 권장합니다.
- 최신 버전의 Android Studio와 Visual Studio Code 사용을 권장합니다. Eclipse에 대한 기술 지원은 하지 않습니다.

Installation
----

1. 프로젝트 루트 경로에 명령어 실행
    ```npm install```

2. 프로젝트 루트/android 폴더 내 build.gradle 파일에 accessKey와 secretkey 입력
    ```
        ...
        allprojects {
            repositories {
                google()
                mavenCentral()
                ...
                // Cauly SDK Repository
                maven {
                    url "s3://repo.cauly.net/releases"
                    credentials(AwsCredentials) {
                        accessKey "AKIAWRZUK5MFKYVSUOLB"
                        secretKey "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"
                    }
                }
                ...
            }
        }        
        ...
    ```

Run
----
1. Settings(윈도우는 Preferences) > Build, Executeion, Deployment > Build Tools > Gradle > Gradle JDK를 11 선택 > Apply 및 OK 
2. 프로젝트루트/example/android/app/src/main/assets 폴더 확인 후 없으면 생성
3. 프로젝트루트/example/android 폴더에서 ./gradlew clean 실행
4. 프로젝트루트/example에서 다음 명령어 실행
    ```
    react-native bundle --platform android --dev false --entry-file index.js --bundle-output ./example/android/app/src/main/assets/index.android.bundle --assets-dest ./example/android/app/src/main/res
    ```
5. 안드로이드 스튜디오 > Settings > Reload all from disk 실행 
6. 안드로이드 스튜디오 > Settings > Sync project
7. 안드로이드 스튜디오 > Build > Clean & rebuild
8. 프로젝트 루트에서 yarn example android 실행

js파일 수정 시 적용방법
----
1. 프로젝트루트/example/android/app/src/main/assets 폴더 아래 index.android.bundle 파일 삭제
2. 프로젝트루트/example/android 폴더에서 ./gradlew clean 실행
3. 프로젝트루트/example에서 다음 명령어 실행
    ```
    react-native bundle --platform android --dev false --entry-file index.js --bundle-output ./example/android/app/src/main/assets/index.android.bundle --assets-dest ./example/android/app/src/main/res
    ```
4. 프로젝트 루트에서 yarn example android 실행