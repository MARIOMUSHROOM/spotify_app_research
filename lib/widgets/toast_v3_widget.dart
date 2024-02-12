import 'package:flutter/material.dart';

class ToastWidget {
  ToastWidget(this.context);
  BuildContext context;

  OverlayEntry? _entry;
  show({
    String message = 'ไม่สามารถทำรายการได้',
    IconData icon = Icons.error_outline_outlined,
    Duration? duration,
  }) {
    final overlay = Overlay.of(context);
    _entry = OverlayEntry(
      builder: (context) {
        return ToastScreen(
          message: message,
          leading: Icon(
            icon,
            color: Colors.white,
          ),
        );
      },
    );
    overlay.insert(_entry!);
    Future.delayed(duration ?? const Duration(seconds: 2))
        .then((value) {})
        .then((value) {
      _entry!.remove();
      _entry == null;
    });
  }

  loading({
    String message = 'กำลังโหลดข้อมูล',
    Duration? duration,
  }) {
    final overlay = Overlay.of(context);
    _entry = OverlayEntry(
      builder: (context) {
        return ToastScreen(
          message: message,
          leading: Container(
            height: 30,
            width: 30,
            padding: const EdgeInsets.all(5),
            child: CircularProgressIndicator(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        );
      },
    );
    overlay.insert(_entry!);
    Future.delayed(duration ?? const Duration(seconds: 2))
        .then((value) {})
        .then((value) {
      _entry!.remove();
      _entry == null;
    });
  }

  success({
    String message = 'ทำรายการสำเร็จ',
    IconData icon = Icons.check_circle_outline,
    Duration? duration,
  }) {
    final overlay = Overlay.of(context);
    _entry = OverlayEntry(
      builder: (context) {
        return ToastScreen(
          message: message,
          leading: Icon(
            icon,
            color: Colors.white,
          ),
        );
      },
    );
    overlay.insert(_entry!);
    Future.delayed(duration ?? const Duration(seconds: 2))
        .then((value) {})
        .then((value) {
      _entry!.remove();
      _entry == null;
    });
  }
}

class ToastScreen extends StatefulWidget {
  const ToastScreen({
    Key? key,
    this.message = 'ไม่สามารถทำรายการได้',
    this.leading,
  }) : super(key: key);
  final String message;
  final Widget? leading;
  @override
  State<ToastScreen> createState() => _ToastScreenState();
}

class _ToastScreenState extends State<ToastScreen> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              // width: 100,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[600],
              ),
              padding: const EdgeInsets.only(left: 5, right: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.leading ?? const SizedBox(),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: Text(
                      widget.message,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
