# Hướng dẫn build version và deploy product App KRMEDI:

Bước 1: Kiểm tra ver hiện tại trên App Store và ChPlay

Bước 2: Kiểm tra version sẽ tăng lên để đẩy lên Store trong thư mục: 
# GlobalConfigs : common/global_configs.dart
static final String versionAppBuildLocal = Platform.isIOS ? '1.1.2' : '1.1.2';

Bước 3: Pod install và Pod update phải sửa = tay cấu hình Firebase SDK do sử dụng bản cũ.
Sửa các file trong XCode bao gồm: 
hoặc chạy lệnh :
# git apply storage.patch -v

# https://github.com/firebase/firebase-ios-sdk/pull/12387/files

Mở Pod trong Xcode ra: 
# Sửa FirebaseStorage/Sources/Storage.swift
# Pods/FirebaseStorage/FirebaseStorage/Sources/Storage.swif

# Sửa từ: 70 - 78
@objc(storageForApp:) open class func storage(app: FirebaseApp) -> Storage {
//    let provider = ComponentType<StorageProvider>.instance(for: StorageProvider.self,
//                                                           in: app.container)
      guard let provider = ComponentType<StorageProvider>.instance(for: StorageProvider.self,
                                                                       in: app.container) else {
            fatalError("No \(StorageProvider.self) instance found for Firebase app: \(app.name)")
          }
      return provider.storage(for: Storage.bucket(for: app))
}

# Sửa từ: 88 - 97:
@objc(storageForApp:URL:)
open class func storage(app: FirebaseApp, url: String) -> Storage {
//    let provider = ComponentType<StorageProvider>.instance(for: StorageProvider.self,
//                                                           in: app.container)
      guard let provider = ComponentType<StorageProvider>.instance(for: StorageProvider.self,
                                                                   in: app.container) else {
        fatalError("No \(StorageProvider.self) instance found for Firebase app: \(app.name)")
      }
      return provider.storage(for: Storage.bucket(for: app, urlString: url))
}


# Sửa từ: 326 - 365

 private static func initFetcherServiceForApp(_ app: FirebaseApp,
                                               _ bucket: String,
                                               _ auth: AuthInterop?, //Thêm _ auth: AuthInterop?
                                               _ appCheck: AppCheckInterop?) //Thêm  _ appCheck: AppCheckInterop?
    -> GTMSessionFetcherService {
    objc_sync_enter(fetcherServiceLock)
    defer { objc_sync_exit(fetcherServiceLock) }
    var bucketMap = fetcherServiceMap[app.name]
    if bucketMap == nil {
      bucketMap = [:]
      fetcherServiceMap[app.name] = bucketMap
    }
    var fetcherService = bucketMap?[bucket]
    if fetcherService == nil {
      fetcherService = GTMSessionFetcherService()
      fetcherService?.isRetryEnabled = true
      fetcherService?.retryBlock = retryWhenOffline
      fetcherService?.allowLocalhostRequest = true
      let authorizer = StorageTokenAuthorizer(
        googleAppID: app.options.googleAppID,
        fetcherService: fetcherService!,
        authProvider: auth,
        appCheck: appCheck
      )
      fetcherService?.authorizer = authorizer
      bucketMap?[bucket] = fetcherService
    }
    return fetcherService!
  }

  private let auth: AuthInterop?  //Thêm dấu ?    
  private let appCheck: AppCheckInterop? //Thêm dấu ?
  private let storageBucket: String
  private var usesEmulator: Bool = false
  internal var host: String
  internal var scheme: String
  internal var port: Int
  internal var maxDownloadRetryInterval: TimeInterval
  internal var maxOperationRetryInterval: TimeInterval
  internal var maxUploadRetryInterval: TimeInterval

# Sửa từ 393 - 402:
  private func ensureConfigured() {
    guard fetcherService == nil else {
      return
    }
      fetcherService = Storage.initFetcherServiceForApp(app, storageBucket, auth!, appCheck!) //Thêm !
    if usesEmulator {
      fetcherService?.allowLocalhostRequest = true
      fetcherService?.allowedInsecureSchemes = ["http"]
    }
  }


# Sửa theo : 
# https://github.com/firebase/firebase-ios-sdk/pull/12391/files
# FirebaseCore/Extension/FIRComponentType.h

# Sửa từ 25 - 36:
NS_SWIFT_NAME(ComponentType)
@interface FIRComponentType<__covariant T> : NSObject

/// Do not use directly. A factory method to retrieve an instance that provides a specific
/// functionality.
//+ (T)instanceForProtocol:(Protocol *)protocol inContainer:(FIRComponentContainer *)container;
+ (nullable T)instanceForProtocol:(Protocol *)protocol
                      inContainer:(FIRComponentContainer *)container;

@end

NS_ASSUME_NONNULL_END


# FirebaseCore/Sources/FIRComponentType.m
# Sửa từ 17-30:

#import "FirebaseCore/Extension/FIRComponentType.h"

#import "FirebaseCore/Sources/FIRComponentContainerInternal.h"

@implementation FIRComponentType

//+ (id)instanceForProtocol:(Protocol *)protocol inContainer:(FIRComponentContainer *)container {
+ (nullable id)instanceForProtocol:(Protocol *)protocol
                       inContainer:(FIRComponentContainer *)container {
  // Forward the call to the container.
  return [container instanceForProtocol:protocol];
}

@end