class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final bool isBorder;
  final bool isAdd;
  final double height;
  final bool isSecond;
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.isBorder = false,
      this.isAdd = false,
      this.height = 45,
      this.isSecond = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.isTablet ? 55 : height,
      child: ElevatedButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.isTablet
                  ? TextStyles.text24w500Button
                  : TextStyles.text20w500Button,
            ),
            const SizedBox(
              width: 10,
            ),
            isAdd ? SvgPicture.asset("assets/icons/add.svg") : const SizedBox()
          ],
        ),
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(0),
            foregroundColor: WidgetStatePropertyAll(onPressed == null
                ? ColorsButton.disOutline
                : ColorsButton.outline),
            backgroundColor: WidgetStatePropertyAll(
                isSecond ? Colors.white : ColorsButton.enable),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                side: isBorder
                    ? const BorderSide(width: 1, color: Colors.black)
                    : const BorderSide(
                        width: 0,
                      ),
                borderRadius: BorderRadius.circular(5)))),
      ),
    );
  }
}
