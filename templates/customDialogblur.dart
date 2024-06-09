class CustomDialog extends StatelessWidget {
  final Widget content;
  final bool isExit;
  const CustomDialog({super.key, required this.content, this.isExit = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: GestureDetector(
          onTap: isExit ? () => Get.back() : null,
          child: Container(
              color: grayColor.withOpacity(.2),
            ),
          ),
        ),
        Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            insetPadding: const EdgeInsets.all(20.0),
            alignment: Alignment.bottomCenter,
            child: content),
      ],
    );
  }
}
