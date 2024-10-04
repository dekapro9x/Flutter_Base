StreamBuilder<T>(
  stream: myStream, // Stream mà StreamBuilder sẽ lắng nghe
  initialData: initialValue, // Dữ liệu ban đầu khi stream chưa có giá trị
  builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
    // Hàm này sẽ xây dựng giao diện dựa trên trạng thái của Stream
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // Hiển thị loading khi đang chờ dữ liệu
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}'); // Xử lý lỗi nếu có
    } else if (snapshot.hasData) {
      return Text('Data: ${snapshot.data}'); // Hiển thị dữ liệu khi có
    } else {
      return Text('No data'); // Trường hợp không có dữ liệu
    }
  },
)
