// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gaste_certo/src/ui/screens/login/login_screen.dart';
import 'package:get/get.dart';

import '../../../data/repository/despesas/despesas_api.dart';
import '../../../data/repository/get_all_transactions.dart';
import '../../../data/repository/receitas/receitas_api.dart';
import '../../../domain/models/all_transactions_model.dart';
import '../addScreen/abas_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String saldoAtual = "";
  var total;
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    final receitasApi = Get.lazyPut(() => ReceitasApi());

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: height * 0.334,
                  color: Colors.white,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: height * 0.28,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[700],
                    ),
                  ),
                ),
                Positioned(
                  top: width * 0.18,
                  left: width * 0.07,
                  child: Text(
                    "GasteCerto",
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.074),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: width * 0.07,
                  right: width * 0.07,
                  child: Container(
                    height: height * 0.16,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(blurRadius: 5, offset: Offset(0, 2))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.05,
                            top: width * 0.04,
                            bottom: width * 0.02,
                          ),
                          child: Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: width * 0.05),
                          ),
                        ),
                        FutureBuilder<double>(
                          future: GetAllTransactions().getTotal(),
                          builder: (BuildContext context,
                              AsyncSnapshot<double> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }

                            if (snapshot.hasError) {
                              return Text(
                                  'Erro ao obter o total: ${snapshot.error}');
                            }

                            final total = snapshot.data;
                            final textColor =
                                total! < 0 ? Colors.red : Colors.black;

                            return Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.05,
                                top: 5,
                              ),
                              child: Text(
                                'R\$${total.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05,
                                  color: textColor,
                                ),
                              ),
                            );
                          },
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05),
                              child: SizedBox(
                                width: width * 0.6,
                                child: Text(
                                  saldoAtual,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.lightBlue[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.04),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AbasScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: width * 0.12,
                                  height: width * 0.12,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[700],
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 7,
                                        offset: Offset(2, 2),
                                      )
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: width * 0.07,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.008,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            getTransactions(),
            TextButton(
              onPressed: () => Get.to(() => const LoginAccountScreen()),
              child: const Text(
                "sair",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<AllTransactions>> getTransactions() {
    return FutureBuilder<List<AllTransactions>>(
      future: GetAllTransactions().getAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final transactions = snapshot.data!;
          return ListView.builder(
            itemCount: transactions.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return SizedBox(
                child: Slidable(
                  key: const ValueKey(0),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (context) {
                          doNothing(context, transaction);
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: transaction.type == 'Receitas'
                          ? Colors.green
                          : Colors.red,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          // Ação ao clicar no card
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    transaction.type == 'Receitas'
                                        ? Icons.keyboard_double_arrow_up_rounded
                                        : Icons
                                            .keyboard_double_arrow_down_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    transaction.type!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                transaction.nome!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.category,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    transaction.categoria!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'R\$${transaction.valor!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Text('Erro ao carregar transações');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

void doNothing(BuildContext context, AllTransactions transaction) {
  Get.lazyPut(() => ReceitasApi());
  Get.lazyPut(() => DespesasApi());
  Get.lazyPut(() => GetAllTransactions());
  final controller = Get.find<GetAllTransactions>();
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Deletar Card'),
      content: const Text('Tem certeza que deseja deletar esse card?'),
      actions: [
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Deletar'),
          onPressed: () {
            if (transaction.type == 'Receitas') {
              ReceitasApi.instance.deleteReceitas(
                id: transaction.id!,
              );
            } else {
              DespesasApi.instance.deleteDespesas(
                id: transaction.id!,
              );
            }

            Get.reloadAll();

            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
