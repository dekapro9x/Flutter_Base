# cd /Users/Admin/Library/Developer/Xcode/DerivedData
Lệnh xóa: 
# rm -rf ~/Library/Developer/Xcode/DerivedData
# pod cache clean --all

cd ios
pod install --repo-update
cd ..
flutter clean
flutter build ios