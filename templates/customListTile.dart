class CustomListTile extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;
  const CustomListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: CardColors.enable,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyles.text20w500,
              ),
              const Spacer(),
              SvgPicture.asset(icon),
            ],
          ),
        ),
      ),
    );
  }
}
