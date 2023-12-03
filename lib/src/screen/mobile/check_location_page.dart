import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:managerfoodandcoffee/src/common_widget/my_button.dart';
import 'package:managerfoodandcoffee/src/common_widget/snack_bar_getx.dart';
import 'package:managerfoodandcoffee/src/controller_getx/table_controller.dart';
import 'package:managerfoodandcoffee/src/model/table_model.dart';
import 'package:managerfoodandcoffee/src/screen/mobile/home_screen.dart';
import 'package:managerfoodandcoffee/src/utils/colortheme.dart';
import 'package:managerfoodandcoffee/src/utils/texttheme.dart';

class LocationCheckPage extends StatefulWidget {
  final double vido;
  final double kinhdo;
  final TableModel table;
  const LocationCheckPage(
      {super.key,
      required this.vido,
      required this.kinhdo,
      required this.table});

  @override
  State<LocationCheckPage> createState() => _LocationCheckPageState();
}

class _LocationCheckPageState extends State<LocationCheckPage> {
  String titleError = '';
  @override
  void initState() {
    super.initState();
    checkLocation(widget.vido, widget.kinhdo);
    // print("${widget.kinhdo},${widget.vido}");
  }

  Future<void> checkLocation(double vido, double kinhdo) async {
    setState(() {
      titleError = '';
    });
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      //xử lý dữ liệu khi người dùng không đáp ứng
      return;
    }
    Position currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    //12.679977153272034, 108.02220482420341
    //12.702650385123615, 108.07410104860656
    double targetLat = vido; //12.679977153272034 /* Vĩ độ của vị trí cụ thể */;
    double targetLon =
        kinhdo; //108.02220482420341 /* Kinh độ của vị trí cụ thể */;

    double distance = Geolocator.distanceBetween(targetLat, targetLon,
        currentPosition.latitude, currentPosition.longitude);
    print("Bạn cách quán: ${distance.ceil()}m");
     
    if (distance.ceil() <= 100000) {
      // //Thay đổi trạng thái đã chọn bàn
      // final controllerTable = Get.put(TableController());
      // controllerTable.updateSelectedTable(widget.table);
      Get.back();
      // Điều kiện đáp ứng, chuyển hướng tới trang đăng nhập.
      Get.offAll(() => HomeScreen(tableModel: widget.table));
    } else {
      // Người dùng không ở trong phạm vi 100m, hiển thị thông báo hoặc thực hiện hành động khác.
      showCustomSnackBar(
          title: 'Cảnh báo',
          message:
              'Bạn cách quán : ${distance.ceil()}m không nằm trong phạm vi của quán',
          type: Type.warning);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      Navigator.pop(context);
      // setState(() {
      //   titleError =
      //       'Bạn cách quán : ${distance.ceil()}m không nằm trong phạm vi của quán.';
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: colorScheme(context).primaryContainer,
      actions: [
        titleError.isEmpty
            ? const SizedBox()
            : MyButton(
                onTap: () => checkLocation(widget.vido, widget.kinhdo),
                backgroundColor: colorScheme(context).primary,
                height: 60,
                text: Text(
                  'Thử lại',
                  style: TextStyle(color: colorScheme(context).tertiary),
                ))
      ],
      content: FittedBox(
        child: Column(
          children: [
            Lottie.asset(
              "assets/images/location.json",
              animate: true,
            ),
            // const Spacer(),
            titleError.isNotEmpty
                ? Text(
                    titleError,
                    style: text(context).titleMedium?.copyWith(
                          color: Colors.red,
                        ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Đang kiểm tra...",
                          style: text(context).displayMedium,
                        ),
                        Lottie.asset("assets/images/ani_loading.json",
                            animate: true, width: 200, height: 200),
                      ],
                    ),
                  ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đâyd
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
//xin chào mọi người lại là tôi đây
