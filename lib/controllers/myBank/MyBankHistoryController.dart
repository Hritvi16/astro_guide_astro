import 'dart:io';
import 'package:astro_guide_astro/constants/BankConstants.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/bank/BankModel.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class MyBankHistoryController extends GetxController {
  MyBankHistoryController();

  final storage = GetStorage();

  late TextEditingController bank_name;
  late TextEditingController branch;
  late TextEditingController holder_name;
  late TextEditingController about;
  late TextEditingController account_no;
  late TextEditingController ifsc;


  late BankModel bank;
  late List<BankModel> history;

  late AstrologerProvider astrologerProvider = Get.find();

  late bool load;

  @override
  void onInit() {
    bank_name = TextEditingController();
    branch = TextEditingController();
    holder_name = TextEditingController();
    account_no = TextEditingController();
    ifsc = TextEditingController();


    load = false;

    start();
    super.onInit();
  }

  start() {
    getMyBankHistory();
  }

  void getMyBankHistory() {
    astrologerProvider.fetchBank(storage.read("access"), ApiConstants.bankAPI+ApiConstants.history).then((response) {
      if(response.code==1) {
        bank = response.data??BankModel(id: -1, astro_id: -1, bank_name: "", branch: "", holder_name: "", account_no: "", ifsc: "", cheque: "", created_at: "", status: 0, verified: 0);
        history = [];
        history.addAll(response.history??[]);
        update();
        setBankData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> deleteBankHistory(int id) async {

    final Map<String, dynamic> data = {
      CommonConstants.id : id,
    };

    bool status = false;

    await astrologerProvider.updateStatus(storage.read("access"),ApiConstants.bankAPI+ApiConstants.delete, data).then((response) {
      print(response.toJson());
      if(response.code==1) {
        Essential.showSnackBar(response.message);
        status = true;
      }
      else {
        status = false;
      }
    });

    return status;
  }


  void setBankData() {
    bank_name.text = bank.bank_name;
    branch.text = bank.branch;
    holder_name.text = bank.holder_name;
    ifsc.text = bank.ifsc;
    account_no.text = bank.account_no;
    load = true;
    update();
  }

  Future<bool> goto(String page, {dynamic arguments}) async {
    await Get.toNamed(page, arguments: arguments)?.then((value) {
      getMyBankHistory();
    });
    return true;
  }

  void removeHistory(BankModel bank) {
    history.remove(bank);
    update();
  }


}
