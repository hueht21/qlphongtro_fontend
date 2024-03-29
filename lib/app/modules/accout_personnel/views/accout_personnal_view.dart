part of "accout_personnel_page.dart";

Widget _viewTitleOption() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        AppStr.accoutPersonnal,
        style: Theme.of(Get.context!).textTheme.subtitle1,
      ),
      ElevatedButton.icon(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: AppConst.defaultPadding * AppDimens.sizePading,
            vertical: AppConst.defaultPadding /
                (Responsive.isMobile(Get.context!) ? AppDimens.sizeVerticalSmall : AppDimens.sizeVertical),
          ),
        ),
        onPressed: () {
          // tạo tai khoan
          // ShowPopup.showDialogConfirm("content", confirm: () {
          //
          // }, actionTitle: "Xác nhận");
          Get.toNamed(Routes.CREATE_ACC_PERSONNAL);
        },
        icon: const Icon(Icons.add),
        label: const Text(AppStr.createAcc),
      ),
    ],
  );
}

Widget _buildListPersonnal(AccoutPersonnalController controller) {
  return Container(
    padding: const EdgeInsets.all(AppConst.defaultPadding),
    decoration: const BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.all(Radius.circular(AppDimens.sizeCircular)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStr.listAccPer,
          style: Theme.of(Get.context!).textTheme.subtitle1,
        ),
        SizedBox(
          width: double.infinity,
          child: DataTable2(
            showCheckboxColumn : false,
            columnSpacing: AppConst.defaultPadding,
            minWidth: AppDimens.minWidthTab,
            columns: const [
              DataColumn(
                label: Text(AppStr.nameAcc),
              ),
              DataColumn(
                label: Text(AppStr.nameLogin),
              ),
              DataColumn(
                label: Text(AppStr.phone),
              ),
              DataColumn(
                label: Text(AppStr.position),
              ),
              DataColumn(
                label: Center(child: Text(AppStr.function)),
              ),
            ],
            rows: List.generate(
              controller.listPersonnal.length,
              (index) => recentFileDataRow(controller.listPersonnal[index], controller),
            ),
          ),
        ),
      ],
    ),
  );
}

DataRow recentFileDataRow(PersonnalModel acc, AccoutPersonnalController controller) {
  return DataRow(
    onSelectChanged: (bool? select){

      controller.personnalModel.value = acc;

    },
    cells: [
      DataCell(Text(acc.fullName!)),
      DataCell(Text(acc.email!)),
      DataCell(Text(acc.phoneNumber!)),
      DataCell(Container(
          decoration: BoxDecoration(
              color: acc.nameRole! == AppStr.personnal ? AppColors.colorAccPer:  AppColors.colorAccAd,
              borderRadius: BorderRadius.circular(AppDimens.paddingHor)),
          child: Text(acc.nameRole!).paddingSymmetric(horizontal: AppDimens.sizeCircular, vertical: AppDimens.sizeVerticalSmall))),
      const DataCell(Center(child: Text("..."))),
    ],
  );
}
