# cd /Users/Admin/Library/Developer/Xcode/DerivedData
Lệnh xóa: 
# rm -rf ~/Library/Developer/Xcode/DerivedData

cd ios
pod install --repo-update
cd ..
flutter clean
flutter build ios