import 'package:flutter/material.dart';

import 'forms/abas_form_screen.dart';

class AbasScreen extends StatefulWidget {
  const AbasScreen({super.key});

  @override
  _AbasScreenState createState() => _AbasScreenState();
}

class _AbasScreenState extends State<AbasScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Finanças'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Despesas',
            ),
            Tab(
              text: 'Receitas',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DespesasForm(),
          ReceitasForm(),
        ],
      ),
    );
  }
}
